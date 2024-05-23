#!/bin/bash

# Check if the git and httpd are isntalled
rpm -q httpd &> /dev/null
if [ $? -ne 0 ]; then
  echo "Installing httpd"
  sudo yum install -y httpd
fi

rpm -q git &> /dev/null

if [ $? -ne 0 ]; then
  echo "Installing git"
  sudo yum install -y git
fi


#clean up previously cached data
sudo systemctl stop httpd

sudo rm -f /var/www/html/index.html
sudo rm -f /var/www/html/jwllonline.png
cd ~
sudo rm -rf caseStudy1-EC2WebDeployment
sudo git clone https://github.com/jwang1568cicd/caseStudy1-EC2WebDeployment.git

#copy the desired web pages to /var/www/html
sudo cd caseStudy1-EC2WebDeployment
sudo cp ./caseStudy1-EC2WebDeployment/index.html /var/www/html/
sudo cp ./caseStudy1-EC2WebDeployment/jwllonline.png /var/www/html/

sudo systemctl restart httpd

echo "web sever has been provisioned and it's ready."
