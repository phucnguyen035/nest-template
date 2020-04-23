# Base development
FROM node:lts-alpine AS dev

ARG ENV

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

EXPOSE 3000

RUN if [ "$ENV" != "development" ]; then yarn build ; fi

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
