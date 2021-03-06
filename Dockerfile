FROM ubuntu:latest
MAINTAINER Travis Holton <wtholton@gmail.com>

RUN \
  apt-get -qq update && \
  apt-get -qy install supervisor \
                      nginx-full \
                      curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD nginx /etc/nginx/
ADD static  /www/data
RUN \
  ln -sf /dev/stdout /var/log/nginx/access.log && \
  ln -sf /dev/stderr /var/log/nginx/error.log && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  rm /etc/nginx/sites-enabled/default && \
  ln -s /etc/nginx/sites-available/app.conf \
    /etc/nginx/sites-enabled/app.conf

ADD supervisord.conf /etc/supervisor/conf.d/
WORKDIR /usr/local
ADD launch.sh /usr/local/
VOLUME ["/etc/nginx"]

EXPOSE 80 443

ENTRYPOINT ["./launch.sh"]
