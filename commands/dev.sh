echo 'Building image for development environment'
docker build -t api:dev $(dirname "pwd")

echo 'Running image in development environment'
docker container run --rm -p 3000:3000 \
  -v `pwd`:/usr/src/app --read-only -v /usr/src/app/node_modules \
  api:dev \
  npm run start:dev

