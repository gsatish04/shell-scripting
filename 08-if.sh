#!/bin/bash

read -p 'Enter username: ' username

if [ "$username" == "root" ]; then
  echo "Hey , you are root user"
  else
    echo Hey, you are nonroot user
  fi

  if [ $UID -eq 0 ]; then
    echo you are root user
    else
      you are nonroot user
      fi




