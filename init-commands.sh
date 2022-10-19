#!/bin/sh

#                [ TIP ]
#
#   please do these things       
#   Please enter the following values ​​according to your needs 
#   

export APP_NAME="google"

export APP_URL="google.com"

export SERVER_OS="centos7" 



echo $SERVER_OS
echo ""

# Do not change this part
if [ $SERVER_OS == 'ubountu' ]
then
    cd os/ubountu20
    ls
    echo 'comming soon add ubountu server section'
fi

if [ $SERVER_OS == 'centos7' ]
then
    cd os/centos7/
    sh bootstrap.sh $APP_URL $APP_NAME
fi