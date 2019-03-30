    # builder phase
    FROM node:dubnium-alpine as builder
    WORKDIR '/app'
    COPY package.json .
    RUN yarn install
    COPY . .
    RUN npm run build

    # @link: https://hub.docker.com/_/nginx
    FROM nginx
    COPY --from=builder /app/build /usr/share/nginx/html
    # we don't have to specidy start command
    # for nginx - this command is build in in the docker image
