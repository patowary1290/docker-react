FROM node:alpine AS builder

WORKDIR /app

COPY package.json .
RUN NODE_ENV=development npm i

COPY . .

RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html