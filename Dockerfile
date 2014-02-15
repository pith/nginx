#
# Nginx Dockerfile
#
# https://github.com/pith/nginx
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Nginx.
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Attach volumes.
VOLUME /etc/nginx/sites-available
VOLUME /etc/nginx/sites-enabled
VOLUME /var/wwww
VOLUME /var/log/nginx

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80 443

# Define default command.
ENTRYPOINT ["nginx"]
