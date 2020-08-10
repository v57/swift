version=8
curl -sL "https://deb.nodesource.com/setup_$version.x" | sudo -E bash -
apt install -y nodejs

# Installing nodemon for automatically running nodejs server
npm install -g nodemon
