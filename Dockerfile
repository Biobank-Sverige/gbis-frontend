FROM node:9 AS builder

# Create app directory

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /

RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app

WORKDIR /ng-app

COPY . .

RUN npm run-script build --prod

FROM nginx:1.13.3-alpine
RUN apk add --no-cache curl

COPY nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /ng-app/dist /usr/share/nginx/html

HEALTHCHECK --interval=1m --timeout=10s --start-period=30s\
  CMD curl -f http://localhost:4200 || exit 1

EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
