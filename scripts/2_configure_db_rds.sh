#!/bin/bash

# RDS config
IP_INSTANCIA=$(curl http://169.254.169.254/latest/meta-data/public-hostname)
cat << EOF > nextcloud/config/autoconfig.php
<?php
\$AUTOCONFIG = array(
  "dbtype"        => "mysql",
  "dbname"        => "${db_name}",
  "dbuser"        => "${db_user}",
  "dbpass"        => "${db_pass}",
  "dbhost"        => "${db_endpoint}",
  "dbtableprefix" => "",
  "adminlogin"    => "${admin_user}",
  "adminpass"     => "${admin_pass}",
  "trusted_domains" => array (0 => "$IP_INSTANCIA", 1 => "62.57.177.179",),
  "directory"     => "${data_dir}",
);
EOF
#  "adminlogin"    => "${admin_user}",
#  "adminpass"     => "${admin_pass}",
