#!/bin/bash

export NVM_DIR=$HOME/.nvm;
. $NVM_DIR/nvm.sh;

cd /home/ec2-user/projects/deploy_nextjs_app
git pull origin master
nvm use v16
yarn install &&
yarn build &&
pm2 restart next_hello_world_app
