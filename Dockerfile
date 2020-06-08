FROM node:lts-alpine

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

USER node
WORKDIR /home/node/app

COPY package.json yarn.lock ./

RUN yarn --frozen-lockfile
RUN yarn cache clean

COPY . .

EXPOSE 3000

CMD [ "node", "dist/main.js" ]
