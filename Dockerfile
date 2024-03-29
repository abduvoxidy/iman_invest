FROM node:14.17.6-alpine as builder
RUN apk update && apk add npm 

RUN mkdir app
WORKDIR app


COPY package*.json ./
RUN npm install
COPY . ./

RUN npm run-script build
ENV NODE_ENV=production
ENV HOST=0.0.0.0

EXPOSE 3000
ENTRYPOINT ["npm", "start"]
