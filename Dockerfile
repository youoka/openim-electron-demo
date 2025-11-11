# 生产阶段
#docker build -t 9zhouim-web .
#docker tag 9zhouim-web yuanjay/9zhouim-web:latest
#docker push yuanjay/9zhouim-web:latest
FROM nginx:alpine

# 复制 nginx 配置文件
COPY nginx.conf /etc/nginx/nginx.conf

# 删除 nginx 默认文件并复制构建产物
RUN rm -rf /usr/share/nginx/html/*
COPY dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]