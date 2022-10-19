#!/bin/sh

echo ""
echo "--------------------"
echo "Installing composer..."
echo "--------------------"
echo ""
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"

echo ""
echo "--------------------"
echo "Correct checksum is $EXPECTED_CHECKSUM..."
echo "--------------------"
echo ""
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

echo ""
echo "--------------------"
echo "Got $ACTUAL_CHECKSUM as checksum, comparing..."
echo "--------------------"
echo ""
if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
  echo >&2 'ERROR: Invalid installer checksum'
  rm composer-setup.php
  exit 1
fi

echo ""
echo "--------------------"
echo "Running composer-setup..."
echo "--------------------"
echo ""

php composer-setup.php
RESULT=$?
rm composer-setup.php
if [ -f composer.phar ]; then
  echo ""
  echo "--------------------"
  echo "Moving composer.phar to /usr/local/bin..."
  echo "--------------------"
  echo ""
  mv composer.phar /usr/local/bin/composer
fi
exit $RESULT
