echo ""
echo "--------------------"
echo "Changing nameservers due to sanctions !"
echo "--------------------"
echo ""
cp /etc/resolv.conf /etc/resolv.conf.backup
cp ./../templates/resolv.conf /etc/resolv.conf

echo ""
echo "--------------------"
echo "Downloading MariaDB repository..."
echo "--------------------"
echo ""
wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup

echo ""
echo "--------------------"
echo "Executing mariadb_repo_setup..."
echo "--------------------"
echo ""
chmod +x mariadb_repo_setup
./mariadb_repo_setup

echo ""
echo "--------------------"
echo "Installing MariaDB-server..."
echo "--------------------"
echo ""
yum install -y MariaDB-server

echo ""
echo "--------------------"
echo "Starting mariadb service..."
echo "--------------------"
echo ""
systemctl start mariadb.service

echo ""
echo "--------------------"
echo "Enabling mariadb service..."
echo "--------------------"
echo ""
systemctl enable mariadb.service

echo ""
echo "--------------------"
echo "Resetting nameservers..."
echo "--------------------"
echo ""
cp /etc/resolv.conf.backup /etc/resolv.conf

echo ""
echo "--------------------"
echo "Proceed to mysql_secure_installation..."
echo "--------------------"
echo ""
mysql_secure_installation

echo ""
echo "--------------------"
echo "Disabling MariaDB repositories from yum..."
echo "--------------------"
echo ""
yum-config-manager --disable mariadb-*

echo ""
echo "--------------------"
echo "MySQL has been installed successfully !"
echo "--------------------"
echo ""