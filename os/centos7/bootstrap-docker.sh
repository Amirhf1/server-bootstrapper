echo ""
echo "--------------------"
echo "Installing curl..."
echo "--------------------"
echo ""
yum install -y curl

echo ""
echo "--------------------"
echo "Adding docker repositories..."
echo "--------------------"
echo ""
yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo ""
echo "--------------------"
echo "Installing docker engine..."
echo "--------------------"
echo ""
yum install -y docker-ce docker-ce-cli containerd.io \

echo ""
echo "--------------------"
echo "Starting and enabling docker daemon..."
echo "--------------------"
echo ""
systemctl start docker
systemctl enable docker
