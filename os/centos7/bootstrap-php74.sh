echo ""
echo "--------------------"
echo "Enabling remi-php74 repo in yum..."
echo "--------------------"
echo ""
yum-config-manager -y --enable remi-php74

echo ""
echo "--------------------"
echo "Installing PHP 7.4 with some necessary extensions..."
echo "--------------------"
echo ""
yum install -y php php-fpm php-gd php-json php-mbstring php-mysqlnd php-xml php-xmlrpc php-opcache php-redis php-intl php-zip php-soap
#if [ ! -f "/usr/local/bin/php" ] && [ ! -f "/usr/bin/php" ]; then
#  if [ -f "/opt/remi/php74/root/usr/bin/php" ]; then
#    ln -s /opt/remi/php74/root/usr/bin/php /usr/local/bin/php
#  fi
#fi
php --version

echo ""
echo "--------------------"
echo "Configuring php-fpm..."
echo "--------------------"
echo ""
cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.backup
cp ./../templates/php-fpm/www.conf /etc/php-fpm.d/www.conf
php-fpm -t

echo ""
echo "--------------------"
echo "Enabling php-fpm service..."
echo "--------------------"
echo ""
systemctl enable php-fpm

echo ""
echo "--------------------"
echo "Restarting php-fpm service..."
echo "--------------------"
echo ""
systemctl restart php-fpm

echo ""
echo "--------------------"
echo "Restarting nginx service..."
echo "--------------------"
echo ""
systemctl restart nginx

echo ""
echo "--------------------"
echo "PHP 7.4 has been sucessfully installed !"
echo "--------------------"
echo ""