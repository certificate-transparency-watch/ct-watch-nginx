FROM ubuntu:14.04
MAINTAINER tom@tom-fitzhenry.me.uk

RUN apt-get update
RUN apt-get install -y nginx

ADD . /src

RUN cp /src/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/ssl
RUN cp /src/blog.tom-fitzhenry.me.uk.crt /etc/nginx/ssl
RUN cp /src/blog.tom-fitzhenry.me.uk.key /etc/nginx/ssl
RUN sed -i '1s/^/daemon off;\n/' /etc/nginx/nginx.conf


EXPOSE 80
EXPOSE 443

CMD /usr/sbin/nginx
