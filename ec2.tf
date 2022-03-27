data "aws_ami" "ubuntu_focal_lts" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical

}

data "template_cloudinit_config" "cloudinit-nextcloud" {
  gzip          = false
  base64_encode = false

  # 1. Download nextcloud and install dependencies
  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/scripts/1_download_nextcloud_and_deps.sh", {})
  }

  # 2. Configure Nextcloud database in RDS
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/2_configure_db_rds.sh", {
      db_name     = var.db_name,
      db_user     = var.db_user,
      db_pass     = var.db_pass,
      db_endpoint = aws_db_instance.nextcloud_mysql_instance.endpoint,
      admin_user  = var.admin_user,
      admin_pass  = var.admin_pass,
      data_dir    = var.data_dir,
    })
  }

  # 3. Configure Nextcloud datastore in S3
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/3_configure_datastore_s3.sh", {
      aws_region      = var.aws_region,
      s3_bucket_name  = var.s3_bucket_name,
      user_access_key = var.s3_access_key,
      user_secret_key = var.s3_secret_key
    })
  }

  # 4. Install Apache conf for Nextcloud
  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/scripts/4_nextcloud_apache_conf.sh", {})
  }

  # 5. Finish Apache configuration and start service
  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/scripts/5_finish_config_and_start.sh", {})
  }
}

resource "aws_key_pair" "keypair" {
  key_name   = var.nextcloud_key_name
  public_key = file(var.nextcloud_key_path)
}

resource "aws_instance" "nextcloud_app_instance" {
  ami                    = data.aws_ami.ubuntu_focal_lts.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.nextcloud_app_sg.id]
  subnet_id              = aws_subnet.nextcloud_app_subnet.id
  iam_instance_profile   = "LabInstanceProfile"

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name = "Nextcloud app"
  }

  user_data = data.template_cloudinit_config.cloudinit-nextcloud.rendered
}

resource "aws_eip" "ip" {
  instance = aws_instance.nextcloud_app_instance.id
}

resource "aws_security_group" "nextcloud_app_sg" {
  name = "nextcloud_app_sg"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.nextcloud_vpc.id

  lifecycle {
    create_before_destroy = true
  }
}

