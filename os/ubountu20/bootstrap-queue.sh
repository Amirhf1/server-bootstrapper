if [ ! -z $1 ]; then
  echo ""
  echo "--------------------"
  echo "Configuring queue-worker for $1..."
  echo "--------------------"
  echo ""
  QUEUE_SERVICE_NAME="queue-$1.service"
  QUEUE_SERVICE_PATH="/usr/lib/systemd/system/$QUEUE_SERVICE_NAME"
  if [ ! -f $QUEUE_SERVICE_PATH ]; then
    cp ./../templates/laravel/queue.service $QUEUE_SERVICE_PATH
    sed -i "s/__APP_NAME__/$1/" $QUEUE_SERVICE_PATH
    systemctl enable $QUEUE_SERVICE_NAME
    systemctl start $QUEUE_SERVICE_NAME
  fi
  echo ""
  echo "--------------------"
  echo "Queue worker service for $1 has been successfully configured !"
  echo "--------------------"
  echo ""
fi
