# Base image: có sẵn nodejs version 16 và npm
FROM node:16-alpine

# Khai báo thư mục làm việc
WORKDIR /project

# Copy tệp tin package.json và package-lock.json vào thư mục làm việc của image
COPY package.json package-lock.json /project/

# Tải về các thư viện có khai báo trong package.json
RUN npm install

# Copy source code vào trong image
COPY . /project/

# Khai báo ứng dụng chạy ở cổng 3000 trong container tạo từ image này
EXPOSE 3000

# Thực hiện lệnh chạy giống như môi trường Dev
CMD ["npm", "start"]