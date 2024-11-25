# Bắt đầu từ image Ubuntu 20.04
FROM ubuntu:20.04

# Thiết lập các biến môi trường để tránh việc gợi ý tương tác trong quá trình cài đặt
ENV DEBIAN_FRONTEND=noninteractive

# Cập nhật hệ thống và cài đặt các gói cần thiết như Node.js, npm, và các công cụ cơ bản
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    gnupg \
    ca-certificates \
    lsb-release \
    build-essential

# Cài đặt Node.js và npm
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Thiết lập thư mục làm việc là /app
WORKDIR /app

# Sao chép package.json và package-lock.json vào thư mục làm việc /app
COPY package*.json ./

# Cài đặt các phụ thuộc của ứng dụng React
RUN npm install

# Sao chép toàn bộ mã nguồn của ứng dụng vào /app
COPY . .

# Mở port mà ứng dụng React sẽ chạy trên
EXPOSE 3000

# Lệnh chạy ứng dụng khi container bắt đầu
CMD ["npm", "start"]
