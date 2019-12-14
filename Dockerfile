# build stage
FROM node:lts-alpine AS builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY package.json yarn.lock ./
RUN yarn

# run stage
FROM node:lts-alpine

USER node
WORKDIR /usr/src/app

COPY --from=builder node_modules node_modules
COPY --chown=node:node . .

EXPOSE 3000

CMD [ "node", "dist/main" ]
