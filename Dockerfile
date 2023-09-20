FROM node:20-alpine3.17 AS builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.21.1-alpine AS prod-stage
COPY --from=builder /app/build /usr/share/nginx/html