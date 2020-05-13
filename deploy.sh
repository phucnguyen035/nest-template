#!/bin/bash

# INFO: Replace service name
service_name=${1:-nest}

# clear changes
git reset --hard
# pull latest changes
git pull

# Install dependencies to build 
yarn
# Build typescript to javascript server
yarn build
# Install dependencies again to purge dev dependencies
NODE_ENV=production yarn

# Reload service if existing, creating new otherwise
if [[ $(pm2 show $service_name) ]]; then
  echo "Reloading existing service '$service_name'"
  pm2 reload --update-env $service_name
else
  echo "Creating new service '$service_name'"
  pm2 start dist/main.js -n $service_name -i 1
fi