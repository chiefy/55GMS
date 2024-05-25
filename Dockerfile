FROM node:current-bookworm AS builder

WORKDIR ${WORKDIR:-/home/node/app}

COPY ./package.json .
COPY ./package-lock.json .

RUN npm install

FROM node:bookworm-slim

WORKDIR ${WORKDIR:-/home/node/app}

COPY . .
COPY --from=builder ${WORKDIR:-/home/node/app}/node_modules ./node_modules

EXPOSE 8080

CMD [ "node", "index.js" ]