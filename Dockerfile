FROM alfg/nginx-rtmp
ENV PATH "${PATH}:/usr/local/nginx/sbin"
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /opt/data && mkdir -p /www
ADD static /www/static

EXPOSE 1935 80

CMD nginx
