source components/common.sh


Print "Download Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https: //raw.githubuserconsent.com/roboshop-devops-project/mongodb/main/mongo.repo
Stat $?
