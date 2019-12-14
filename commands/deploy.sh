echo 'Building project'
npm run build

echo 'Building docker image'
docker build --build-arg NODE_ENV=production -t api $(dirname "pwd")

echo 'Removing dangling images'
docker image prune -f

echo 'Running image in background'
docker container run --rm -p 3000:3000 -d api
