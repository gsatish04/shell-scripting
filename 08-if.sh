#!/bin/bash

read -p 'Enter username: ' username

if [ "$username" =="root"]; then
  echo "Hey , you are root user"
  else
    echo Hey, you are nonroot user
  fi
