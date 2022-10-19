echo ""
echo "--------------------"
echo "Creating a user with 'git' username..."
echo "--------------------"
echo ""
adduser git -G nginx

echo ""
echo "--------------------"
echo "Generating ssh-key for git user..."
echo "--------------------"
echo ""
mkdir -p /home/git/.ssh
ssh-keygen -q -t rsa -N '' -f /home/git/.ssh/id_rsa -C git@"$(uname -n)"

echo ""
echo "--------------------"
echo "Changing home dir ownership..."
echo "--------------------"
echo ""
chown -R git:git /home/git

echo ""
echo "--------------------"
echo "Prinint public key..."
echo "--------------------"
echo ""
cat /home/git/.ssh/id_rsa.pub

echo ""
echo "--------------------"
echo "Clearing yum..."
echo "--------------------"
echo ""
yum autoremove -y
yum clean all

echo "Enjoy ! 😉"
