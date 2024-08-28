FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./

# Copy local directories to the current local directory of our docker image (/app)
COPY ./src ./src
COPY ./public ./public

RUN npm install \
    && npm install -g serve \
    && npm run build \
    && rm -fr node_modules

EXPOSE 80

CMD [ "nginx","-g", "daemon off" ]