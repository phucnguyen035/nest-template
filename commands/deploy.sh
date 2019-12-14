name="api-prod"
existing=$(docker container ls -q -f name=$name)

echo 'Building project'
npm run build

echo 'Building docker image'
docker build --build-arg NODE_ENV=production -t api $(dirname "pwd")

if [ $existing ]
then
  echo 'Stopping existing container'
  docker container stop $existing
fi

echo 'Running image in background'
docker container run --rm --name $name -p 3000:3000 -d api

echo 'Removing dangling images'
docker image prune -f
