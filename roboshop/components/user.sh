#!/bin/bash

source components/common.sh

MSPACE=$(cat $0 | grep ^Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=User
COMPONENT=user
NODEJS

Print "Checking DB Connections from APP"
sleep 5
STAT=$(curl -s localhost:8080/health | jq .mongo)
echo Status = $STAT
if [ "$STAT" == "true" ]; then
  Stat 0
else
    Stat 1
fi


