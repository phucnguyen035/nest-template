# Change these variables for each project 
NAME=api # Service name
PORT=3000 # Port used for exposing service to the public

# Constant values, don't change if you don't need to
EXISTING=$(docker service ls -q -f name=$NAME) # Check if service already exists

echo 'Pull image from registry'
docker pull hoangphuc0305/test-api:latest

# Using docker swarm to deploy
# Make sure swarm mode is active in your server (docker swarm init)
if [ $EXISTING ]
then
  echo 'Updating existing service'
  docker service update $EXISTING
else
  echo 'Running service for the first time'
  docker service create \
    --name $NAME \
    -p $PORT:3000 \
    --restart-condition unless-stopped \
    # --replicas-max-per-node 3 \
    # --replicas 3 # Use this to set initial scale
    hoangphuc0305/test-api:latest
fi

echo 'Removing dangling images'
docker image prune -f
