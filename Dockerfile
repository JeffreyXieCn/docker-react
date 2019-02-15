#step 1: build phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

#step 2: run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html