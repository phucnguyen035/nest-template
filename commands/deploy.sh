# Change these variables for each project 
NAME="${NAME:-api}" # Service name
PORT="${PORT:-3000}" # Port used for exposing service to the public

# Constant values, don't change if you don't need to
EXISTING=$(docker service ls -q -f name=$NAME) # Check if service already exists

echo 'Pulling latest changes from git'
git pull

echo 'Pulling image from registry'
docker pull hoangphuc0305/test-api:latest

# Using docker swarm to deploy
# Make sure swarm mode is active in your server (docker swarm init)
# Comment out VIRTUAL_HOST/PORT, LETSENCRYPT_HOST/EMAIL if not using nginx let's encrypt companion
if [ $EXISTING ]
then
  echo 'Updating existing service'
  docker service update $EXISTING
else
  echo 'Running service for the first time'
  docker service create hoangphuc0305/test-api:latest
    --name $NAME \
    -p $PORT:3000 \
    -e VIRTUAL_HOST=api.nguyenhphuc.com \
    -e VIRTUAL_PORT=$PORT \
    -e LETSENCRYPT_HOST=api.nguyenhphuc.com \
    -e LETSENCRYPT_EMAIL=nguyen.hphuc035@gmail.com \  
    --restart-condition unless-stopped \
    # --replicas-max-per-node 3 \
    # --replicas 3 # Use this to set initial scale
fi
