# Change these variables for each project 
NAME=api-prod # Service name
IMAGE=api # Image used for building project
PORT=3000 # Port used for exposing service to the public

# Constant values, don't change if you don't need to
TAG=$(git rev-parse --short HEAD) # Using latest git commit hash as tag
EXISTING=$(docker service ls -q -f name=$NAME) # Check if service already exists

echo 'Building project'
npm run build

echo 'Building docker image'
docker build --build-arg NODE_ENV=production -t $IMAGE:$TAG $(dirname "pwd")

if [ $EXISTING ]
then
  echo 'Updating existing service'
  docker service update --force $EXISTING
else
  echo 'Running service for the first time'
  docker service create --name $NAME -p $PORT:3000 --restart-condition=on-failure $IMAGE:$TAG
fi

echo 'Removing dangling images'
docker image prune -f
