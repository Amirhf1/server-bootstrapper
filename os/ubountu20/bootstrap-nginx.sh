echo ""
echo "--------------------"
echo "Installing nginx..."
echo "--------------------"
echo ""
yum install -y nginx

echo ""
echo "--------------------"
echo "Enabling nginx service..."
echo "--------------------"
echo ""
systemctl enable nginx

echo ""
echo "--------------------"
echo "Starting nginx service..."
echo "--------------------"
echo ""
systemctl start nginx
nginx --version

echo ""
echo "--------------------"
echo "Opening HTTP port on firewall public zone..."
echo "--------------------"
echo ""
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

echo ""
echo "--------------------"
echo "Copying snippet templates to nginx configs directory..."
echo "--------------------"
echo ""
if [ ! -d "/etc/nginx/snippets" ]; then
    cp -r ./../templates/nginx/snippets /etc/nginx
fi

echo ""
echo "--------------------"
echo "Copying nginx general config file template to nginx configs directory..."
echo "--------------------"
echo ""
cp ./../templates/nginx/nginx.conf /etc/nginx/nginx.conf

if [ ! -z $1 ] && [ ! -z $2 ]; then
  echo ""
  echo "--------------------"
  echo "Configuring $1..."
  echo "--------------------"
  echo ""
  CONFIG_NAME="$1".conf
  CONFIG_PATH=/etc/nginx/conf.d/$CONFIG_NAME
  if [ ! -d "/etc/nginx/conf.d" ]; then
    mkdir /etc/nginx/conf.d
  fi
  cp ./../templates/nginx/conf.d/template.conf $CONFIG_PATH
  sed -i "s/__SERVER_NAME__/$1/" $CONFIG_PATH
  sed -i "s/__APP_NAME__/$2/" $CONFIG_PATH
  echo ""
  echo "--------------------"
  echo "Configuration of $1 has been successfully done !"
  echo "--------------------"
  echo ""
fi
nginx -t

echo ""
echo "--------------------"
echo "Restarting nginx..."
echo "--------------------"
echo ""
systemctl restart nginx

echo ""
echo "--------------------"
echo "Nginx has been successfully installed and configured !"
echo "--------------------"
echo ""
