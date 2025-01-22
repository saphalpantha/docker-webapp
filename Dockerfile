FROM node:alpine AS builder

COPY ./package.json ./

RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/ /usr/share/nginx
