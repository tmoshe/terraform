#!/bin/bash

# This is a sample Bash script
# It prints a welcome message and current date


echo "Welcome to the script!" >> /home/ubuntu/file1.txt
echo "Today is $(date)" >> /home/ubuntu/file1.txt 
sudo apt update -y
sudo apt upgrade -y
echo "finished upgrade system" >> /home/ubuntu/file1.txt


sudo wget https://packages.chef.io/files/stable/chef-workstation/23.5.1040/ubuntu/22.04/chef-workstation_23.5.1040-1_amd64.deb
sudo dpkg -i chef-workstation_23.5.1040-1_amd64.deb
echo "finished install chef on system" >> /home/ubuntu/file1.txt
sudo git clone https://github.com/tmoshe/chef.git /opt/chef
sudo chmod +x /opt/chef/cookbooks/cron/files/script.sh


sudo chef-solo -c /opt/chef/solo.rb -j /opt/chef/runlist.json --chef-license=accept > /var/log/chef.log
echo "user data was done!" >> /home/ubuntu/file1.txt