#!/bin/bash

export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh;

cd /home/ec2-user/projects/deploy_nextjs_app

# Check the current branch and pull from the appropriate branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" == "production" ]; then
  git pull origin production
else
  git pull origin main
fi

nvm use v16
yarn install &&
yarn build &&
pm2 restart next_hello_world_app
