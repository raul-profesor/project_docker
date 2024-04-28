FROM nginx:1.14

#FROM nginx:1.25.5

COPY ./nginx/vhost.conf /etc/nginx/conf.d/default.conf