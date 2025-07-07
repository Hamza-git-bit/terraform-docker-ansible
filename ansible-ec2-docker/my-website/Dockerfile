FROM python:3.11-slim

RUN apt update && apt install -y nginx && rm -rf /var/lib/apt/lists/*

COPY index.html /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]

