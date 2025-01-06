#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install git -y;

repoName="git@github.com:rgera002/Fall-2024-Crystal-Team-CS411W-Code.git"

cloneCommand=$(git clone $repoName)

#echo "cloneCommand = $cloneCommand"

#output=$(eval "$cloneCommand")




if $cloneCommand | grep -q "Permission denied"; then
  echo "ERROR: Invalid or missing SSH key. Please try again."
else
  echo "Successfully connected to repository. Checking for updates...."
fi
