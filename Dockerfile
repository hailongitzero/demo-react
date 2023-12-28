FROM node:latest AS build
WORKDIR /project

RUN npm run build

# Base image: có sẵn nodejs version 16 và npm
FROM nginx:alpine

# Copy tệp tin package.json và package-lock.json vào thư mục làm việc của image
COPY ./build /usr/share/nginx/html

# Copy source code vào trong image
COPY default.conf /etc/nginx/conf.d/

# Khai báo ứng dụng chạy ở cổng 3000 trong container tạo từ image này
EXPOSE 80
