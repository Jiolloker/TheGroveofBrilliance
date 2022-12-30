#! /bin/bash

#Usage of script... 
#Syntax
#bash git.sh username access_token
#script requires username and access_token from github

USER=$1
GITHUB_TOKEN=$2
echo "Process of clonning repositories."
echo "This script clones all repositories, this includes the private repositories."
sleep 3
readarray array <<< $(curl -X GET -u $GITHUB_TOKEN:x-oauth-basic https://api.github.com/users/$USER/repos | grep -e 'clone_url*' | cut -d \" -f 4)

mkdir -p ~/git && cd ~/git

for element in ${array[@]}
do
  echo "clonning $element"
  git clone $element
done

