FROM alfg/nginx-rtmp
ENV PATH "${PATH}:/usr/local/nginx/sbin"
ADD nginx.conf /etc/nginx/nginx.conf.template
RUN mkdir -p /opt/data && mkdir -p /www
ADD static /www/static

EXPOSE 1935
EXPOSE 80

CMD envsubst "$(env | sed -e 's/=.*//' -e 's/^/\$/g')" < \
  /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && \
  nginx
