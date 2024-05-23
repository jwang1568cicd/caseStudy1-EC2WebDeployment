# caseStudy1-EC2WebDeployment
Simple Web Application Deployment with GIT and AWS EC2

This project consists of 3 portions:
1. The simple web page, index.html, and a logo file, jwllonline.png are version controlled in git hub project, caseStudy1-EC2WebDeployment. The images directory archives all related screenshots as references.
2. The AWS EC2 setup are captured in the screenshots for related VPC and security related settings.
3. Bash script, ec2_check.sh, could be used at host side to verify if EC2 instance is accessible via ssh with identity PEM file.
4. Bash deployment script, deploy.sh, is a script to clone the GIT repository and serve the static website on the EC2 instance. You will need to transfer it to the EC2 host via the wget or ssh session to deploy the required provisioning.
