FROM nginx:mainline-alpine

# Changes:
#  - create/chown files that need to be modified by nginx as nginx user
#  - copied nginx.conf from original container, removed user declaration as it is redundant when running container as nginx
#  - set user as nginx on image

RUN rm /etc/nginx/conf.d/* && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/cache/nginx && \
    chown nginx:nginx /var/run/nginx.pid
ADD nginx.conf /etc/nginx/nginx.conf
ADD hello.conf /etc/nginx/conf.d/
ADD index.html /usr/share/nginx/html/

USER nginx
