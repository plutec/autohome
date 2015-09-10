#!/bin/sh
#You must have nodemcu-uploader.py in your path
sudo ~/bin/nodemcu-uploader.py upload connect_wifi.lua ../libraries/dht11.lua:dht11.lua run_dht11.lua server.lua --compile
sudo ~/bin/nodemcu-uploader.py upload init.lua --restart
