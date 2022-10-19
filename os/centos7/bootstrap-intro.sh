echo ""
echo "--------------------"
echo "Bootstrapping started..."
echo "--------------------"
echo ""

echo ""
echo "--------------------"
echo "Updating yum"
echo "--------------------"
echo ""
yum update -y

echo ""
echo "--------------------"
echo "Installing yum-utils, wget and htop"
echo "--------------------"
echo ""
yum install -y yum-utils wget htop zip

echo ""
echo "--------------------"
echo "Installing epel-release"
echo "--------------------"
echo ""
yum -y install epel-release

echo ""
echo "--------------------"
echo "Enabling remi repository"
echo "--------------------"
echo ""
yum-config-manager -y --enable remi

echo ""
echo "--------------------"
echo "Updating yum"
echo "--------------------"
echo ""
yum update -y

echo ""
echo "--------------------"
echo "Installing remi-release-7 package"
echo "--------------------"
echo ""
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

echo ""
echo "--------------------"
echo "Disabling SELinux ⛔️"
echo "--------------------"
echo ""
yum setenforce 0
