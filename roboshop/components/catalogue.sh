#!/bin/bash

source components/common.sh

Print "Install NodeJS"
yum install nodejs make gcc-c++ -y &>>LOG
Stat $?

Print "Add Roboshop User"
id roboshop &>>LOG
if  [ $? -eq 0 ]; then
  echo User Roboshop already exists
else
  useradd roboshop &>>LOG
fi
Stat $?


Print "Download Catalogue"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>LOG
Stat $?

Print "Remove Old Content"
rm -rf /home/roboshop/catalogue &>>LOG
Stat $?

Print "Extract Catalogue"
unzip -o -d /home/roboshop /tmp/catalogue.zip &>>LOG
Stat $?

exit

$ cd /home/roboshop
$ unzip /tmp/catalogue.zip
$ mv catalogue-main catalogue
$ cd /home/roboshop/catalogue
$ npm install
NOTE: We need to update the IP address of MONGODB Server in systemd.service file
Now, lets set up the service with systemctl.

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue