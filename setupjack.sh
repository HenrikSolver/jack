SP=$((8076+($UID-1000)*2))
AP=$(($SP+1))
if [ ! -d ~/.jack-server ]; then
  mkdir ~/.jack-server
  wget https://raw.githubusercontent.com/HenrikSolver/jack/master/config.properties -O ~/.jack-server/config.properties
fi
sed -i "s@^jack.server.service.port.*@jack.server.service.port=$SP@" ~/.jack-server/config.properties
sed -i "s@^jack.server.admin.port.*@jack.server.admin.port=$AP@" ~/.jack-server/config.properties
chmod 600 ~/.jack-server/config.properties
if  [ ! -f ~/.jack-settings ]; then
  wget https://raw.githubusercontent.com/HenrikSolver/jack/master/jack-settings -O ~/.jack-settings
fi
sed -i "s@^SERVER_PORT_SERVICE.*@SERVER_PORT_SERVICE=$SP@" ~/.jack-settings
sed -i "s@^SERVER_PORT_ADMIN.*@SERVER_PORT_ADMIN=$AP@" ~/.jack-settings
 
