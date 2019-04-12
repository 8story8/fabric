#!/bin/bash

USER_NAME=$1

# install wget
sudo yum install wget -y -q

# install docker
sudo yum install docker -y -q
sudo service docker start > /dev/null

# install docker compose
sudo curl -sL "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install go
sudo wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz -q
sudo tar -zxf go1.12.1.linux-amd64.tar.gz
sudo rm -rf go1.12.1.linux-amd64.tar.gz
sudo mv go .go
sudo mv .go /home/${USER_NAME}/
echo 'export GOPATH=$HOME/.go' >> "/home/${USER_NAME}/.bashrc"
echo 'export PATH=$PATH:$GOPATH/bin' >> "/home/${USER_NAME}/.bashrc"

# install npm
sudo yum install epel-release -y -q 
sudo yum install npm -y -q
sudo npm install n -g 

# install node.js
sudo n 8.9.4 

# install git
sudo yum install git -y -q

# install fabric
cd /home/${USER_NAME}
curl -sSL http://bit.ly/2ysbOFE | bash -s -- 1.4.0 
sudo setenforce 0
