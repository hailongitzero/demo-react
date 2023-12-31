FROM node:latest AS build
WORKDIR /app
COPY . /app

RUN npm install

RUN npm run build

# Base image
FROM nginx:alpine

# Copy source code vao folder nginx/html
COPY --from=build /app/build /usr/share/nginx/html

# Copy source code vào trong image
COPY default.conf /etc/nginx/conf.d/

# Khai báo ứng dụng chạy ở cổng 80 trong container tạo từ image này
EXPOSE 80
