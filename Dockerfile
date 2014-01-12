FROM ubuntu:12.10
MAINTAINER tom@tom-fitzhenry.me.uk

RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nginx

ADD . /src

RUN cp /src/nginx.conf /etc/nginx/conf.d/default.conf
RUN sed -i '1s/^/daemon off;\n/' /etc/nginx/nginx.conf

EXPOSE 80

CMD /usr/sbin/nginx
