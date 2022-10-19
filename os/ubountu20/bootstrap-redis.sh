echo ""
echo "--------------------"
echo "Installing Redis..."
echo "--------------------"
echo ""
yum install redis -y

echo ""
echo "--------------------"
echo "Enabling Redis service..."
echo "--------------------"
echo ""
systemctl enable redis

echo ""
echo "--------------------"
echo "Starting Redis service..."
echo "--------------------"
echo ""
systemctl start redis

redis-cli ping

echo ""
echo "--------------------"
echo "Redis has been successfully installed ! Keep rocking..."
echo "--------------------"
echo ""
