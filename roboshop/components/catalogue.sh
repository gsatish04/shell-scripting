#!/bin/bash

source components/common.sh

Print "Install NodeJS"
yum install nodejs make gcc-c++ -y &>>$LOG
Stat $?

Print "Add Roboshop User"
id roboshop &>>$LOG
if  [ $? -eq 0 ]; then
  echo User Roboshop already exists
else
  useradd roboshop &>>$LOG
fi
Stat $?

Print "Download Catalogue"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
Stat $?

Print "Remove Old Content"
rm -rf /home/roboshop/catalogue &>>$LOG
Stat $?

Print "Extract Catalogue"
unzip -o -d /home/roboshop /tmp/catalogue.zip &>>$LOG
Stat $?

Print "Copy Content"
mv /home/roboshop/catalogue-main /home/roboshop/catalogue
Stat $?

Print "Install NodesJS dependencies"
cd /home/roboshop/catalogue
npm install &>>$LOG
Stat $?

Print " Fix App Permission"
crown -R roboshop:roboshop /home/roboshop
Stat $?

Print "Update DNS records in SystemD config"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service &>>$LOG
Stat $?

Print "Copy SystemD file"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>$LOG
Stat $?

Print "Start Catalogue Service"
systemctl daemon-reload &>>$LOG && systemctl restart catalogue &>>$LOG && systemctl enable catalogue &>>$LOG
Stat $?

Print "Checking DB Connections from APP"
STAT=$(curl -s localhost:8080/health | jq .mongo)
echo Status = $STAT
if [ "$STAT" == "true" ]; then
  Stat 0
else
    Stat 1
fi