 #!/bin/bash

# Update packages
sudo apt update && sudo apt-get upgrade -y

# Install needed tools
sudo apt install curl wget htop -y

# Installing Git
sudo apt update
sudo apt install git -y

# Installing Node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node --lts

# Installing node packages
npm i -g node-sass live-server

# Installing MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt update
sudo apt install mongodb-org -y --allow-unauthenticated

sudo mkdir -p /data/db
sudo chown mongodb:mongodb /data/db

sudo systemctl start mongod
sudo systemctl enable mongod

# Installing Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -rf google-chrome-stable_current_amd64.deb

## Installing MongoDB Compass
## [TODO]: Update & fix compass installation
# wget https://downloads.mongodb.com/compass/mongodb-compass_1.12.5_amd64.deb;
# sudo dpkg -i mongodb-compass_1.12.5_amd64.deb;
# sudo rm -rf mongodb-compass_1.12.5_amd64.deb;

# Installing Slack
sudo snap install slack --classic

# Installing Visual Studio Code + Plugins
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

code --install-extension dbaeumer.vscode-eslint
code --install-extension streetsidesoftware.code-spell-checker

sudo snap install zoom-client

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb -y
sudo useradd dci-admin 

echo "--------- Installation Successful ----------"
