echo ""
echo "--------------------"
echo "Adding zabbix-release repository to yum..."
echo "--------------------"
echo ""
rpm -Uvh https://repo.zabbix.com/zabbix/5.4/rhel/7/x86_64/zabbix-release-5.4-1.el7.noarch.rpm

echo ""
echo "--------------------"
echo "Cleaning yum cache"
echo "--------------------"
echo ""
yum clean all

echo ""
echo "--------------------"
echo "Changing nameservers due to sanctions !"
echo "--------------------"
echo ""
cp /etc/resolv.conf /etc/resolv.conf.backup
cp ./../templates/resolv.conf /etc/resolv.conf

echo ""
echo "--------------------"
echo "Installing zabbix-agent..."
echo "--------------------"
echo ""
yum install -y zabbix-agent

echo ""
echo "--------------------"
echo "Resetting nameservers..."
echo "--------------------"
echo ""
cp /etc/resolv.conf.backup /etc/resolv.conf

echo ""
echo "--------------------"
echo "Enabling zabbix-agent service..."
echo "--------------------"
echo ""
systemctl enable zabbix-agent

echo ""
echo "--------------------"
echo "Starting zabbix-agent service..."
echo "--------------------"
echo ""
systemctl restart zabbix-agent

echo ""
echo "--------------------"
echo "Opening 10050 port on firewall !"
echo "--------------------"
echo ""
firewall-cmd --add-port=10050/tcp --permanent
firewall-cmd --reload

echo ""
echo "--------------------"
echo "Configuring zabbix-agent..."
echo "--------------------"
echo ""
cp ./../templates/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
HOSTNAME=$(uname -n)
sed -i "s/__HOST_NAME__/$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf

echo ""
echo "--------------------"
echo "Restarting zabbix-agent service..."
echo "--------------------"
echo ""
systemctl restart zabbix-agent

echo ""
echo "--------------------"
echo "Zabbix agent successfully installed !"
echo "--------------------"
echo ""
