# Base development
FROM node:lts-alpine AS dev

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

RUN yarn build

# Production
FROM node:lts-alpine AS prod

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

COPY --chown=node:node --from=dev /usr/src/app/dist ./dist

USER node

EXPOSE 3000

CMD ["node", "dist/main"]