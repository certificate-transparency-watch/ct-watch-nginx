FROM ubuntu:15.10
MAINTAINER tom@tom-fitzhenry.me.uk

RUN apt-get update
RUN apt-get install -y nginx

ADD . /src

RUN cp /src/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/conf
RUN rm /etc/nginx/sites-enabled/default
RUN sed -i '1s/^/daemon off;\n/' /etc/nginx/nginx.conf

EXPOSE 80

CMD /usr/sbin/nginx
