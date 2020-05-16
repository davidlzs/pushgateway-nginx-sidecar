FROM ubuntu

ENV TZ=America/Regina
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y tzdata && \
    apt-get install -y nginx-extras ca-certificates gettext-base curl lua-zlib && \
    rm -rf /var/cache/apt && rm -rf /var/lib/apt

ADD default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
ADD inflate_body.lua /opt/lua/

EXPOSE 80
CMD nginx