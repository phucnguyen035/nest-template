# Change these variables for each project
NAME="${NAME:-api}" # Service name
PORT="${PORT:-3000}" # Port used for exposing service to the public

# Constant values, don't change if you don't need to
EXISTING=$(docker container ls -q -f name=$NAME) # Check if service already exists

echo 'Pulling image from registry'
docker pull hoangphuc0305/test-api:latest

# Make sure swarm mode is active in your server (docker swarm init)
# Comment out VIRTUAL_HOST/PORT, LETSENCRYPT_HOST/EMAIL if not using nginx let's encrypt companion
if [ $EXISTING ]
then
  echo 'Updating existing container'
  docker container stop $EXISTING
fi

echo 'Creating and running new container'
docker container run -dit --name $NAME \
  -p $PORT:3000 \
  -e VIRTUAL_HOST=api.nguyenhphuc.com \
  -e VIRTUAL_PORT=$PORT \
  -e LETSENCRYPT_HOST=api.nguyenhphuc.com \
  -e LETSENCRYPT_EMAIL=nguyen.hphuc035@gmail.com \
  --network=webproxy \ 
  --restart=unless-stopped \
  hoangphuc0305/test-api:latest
