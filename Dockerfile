# Multi-sep build dockerfile
# Phase 1
FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase 2
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html