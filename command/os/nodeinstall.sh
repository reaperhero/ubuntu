#!/bin/bash
apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install nodejs
node -v 
npm -v 
