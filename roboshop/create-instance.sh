#!/bin/bash

CREATE() {
  COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null | wc -l)

 if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0855cab4944392d0a --instance-type t3.micro --security-group-ids  sg-053f6428e2a50d485 --tag-specifications "ResourceType=instance, Tags=[{Key=Name, Value=$1}" | jq &>/dev/null
 else
  echo -e "\e[1;33m$1 Instance already exists\e[0m"
  return
 fi

 sleep 5
 IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null )
 ## xargs is used to remove the double quotes
}

if [ "$1" == "all" ]; then
  ALL=(frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment)
  for component in ${ALL[*]}; do
    echo "Creating Instance - $component"
    CREATE $component
  done
else
    CREATE $1
fi

