#!/bin/bash

# Update the sources list
sudo apt-get update -y

# install git
sudo apt-get install git -y

#make changes to .bashrc
echo 'export DB_HOST=192.168.10.200' >> ~/.bashrc

export DB_HOST=192.168.10.200

# #read changes just made to bash rc using current process not child
# source ~/.bashrc

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# commands to use nginx as a reverse proxy
# install nginx
sudo apt-get install nginx -y

# start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# unlink original default configuration file before creating new one
sudo unlink /etc/nginx/sites-enabled/default

# create and enter new configuration file and 
cd /etc/nginx/sites-available
touch proxy_config.conf

# write the following commands into the new config file
sudo sh -c "echo 'server {

listen 80;

location / {

proxy_pass http://192.168.10.100:3000;

}

}' >> proxy_config.conf"

# activate new config file by creating link
sudo ln -s /etc/nginx/sites-available/proxy_config.conf /etc/nginx/sites-enabled/proxy_config.conf


# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

# Missing some automation here to start the servers
cd /home/ubuntu/app

pm2 start app.js --update-env
