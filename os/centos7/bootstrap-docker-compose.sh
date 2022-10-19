echo ""
echo "--------------------"
echo "Downloading docker-compose..."
echo "--------------------"
echo ""
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \

echo ""
echo "--------------------"
echo "Making docker-compose executable..."
echo "--------------------"
echo ""
chmod +x /usr/local/bin/docker-compose
