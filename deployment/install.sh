#!/bin/bash
set -x

config_file="cpds.yml"
function extract_config {
  local start_line=$(grep -n "$1" "$config_file" | cut -d: -f1)
  if [ -z "$start_line" ]; then
          echo "Error: comment line for $1 not found in $config_file"
    exit 1
  fi
  local end_line=$(tail -n +$((start_line+1)) "$config_file" | grep -n "# " | cut -d: -f1 | head -n 1)

  if [ -z "$end_line" ]; then
    sed -n "$((start_line+1)),$ p" "$config_file" > "$2"
  else
    sed -n "$((start_line+1)),$((start_line+end_line-1))p" "$config_file" > "$2"
  fi
  systemctl restart $3
}



rpm -i --nodeps mariadb/*.rpm --force
systemctl start mariadb.service
systemctl enable mariadb.service
mysql_secure_installation<<EOF

y
y
root
root
y
y
y
y
EOF
mysql < database/create_database.sql
mysql cpds < database/create_table.sql
mysql cpds < database/rule.sql
#mysql -u root<<EOF
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
#EOF


rpm -i cpds-analyzer-1.0-linx99.aarch64.rpm
extract_config "# cpds-analyzer" "/etc/cpds/analyzer/config.yml" "cpds-analyzer.service"


rpm -i cpds-detector-1.0-linx99.aarch64.rpm
extract_config "# cpds-detector" "/etc/cpds/detector/config.yml" "cpds-detector.service"


rpm -i prometheus-2.45.0-linx99.aarch64.rpm
extract_config "# prometheus" "/etc/prometheus/prometheus.yml" "prometheus.service"


rpm -i --nodeps nginx/*.rpm --force
rpm -i cpds-ui-1.0-1.0.0.aarch64.rpm
extract_config "# cpds-ui" "/etc/nginx/conf.d/cpds-ui.conf" "nginx.service"


echo "CPDS installation completed"
