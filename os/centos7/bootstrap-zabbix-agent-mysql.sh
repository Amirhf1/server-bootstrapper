echo ""
echo "--------------------"
echo "Creating mysql user for zabbix-agent..."
echo "--------------------"
echo ""
mysql -e "CREATE USER 'zbx_monitor'@'%' IDENTIFIED BY 'cy(=5H]YM3y7Mz=;';"

echo ""
echo "--------------------"
echo "Granting necessary permissions to new user..."
echo "--------------------"
echo ""
mysql -e "GRANT REPLICATION CLIENT,PROCESS,SHOW DATABASES,SHOW VIEW ON *.* TO 'zbx_monitor'@'%';"

echo ""
echo "--------------------"
echo "Configuring zabbix to work with mysql..."
echo "--------------------"
echo ""
if [ ! -d "/var/lib/zabbix" ]; then
  mkdir /var/lib/zabbix
fi
if [ ! -f "/var/lib/zabbix/.my.cnf" ]; then
  cp ./../templates/zabbix/mysql/my.cnf /var/lib/zabbix/.my.cnf
fi
if [ ! -f "/etc/zabbix/template_db_mysql.conf" ]; then
  cp ./../templates/zabbix/mysql/template_db_mysql.conf /etc/zabbix/zabbix_agentd.d/template_db_mysql.conf
fi

echo ""
echo "--------------------"
echo "Zabbix has been successfully configured to work with mysql !"
echo "--------------------"
echo ""