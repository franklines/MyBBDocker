FROM php:7.1-apache
MAINTAINER Franklin Escobar <https://github.com/franklines>

# Install required MyBB PHP extensions.
# https://docs.mybb.com/1.8/install/requirements/
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    libxml2-dev \
    libjpeg-dev \
    libpng-dev && \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd mysqli zip mbstring xml 

# Set some custom php.ini configurations.
RUN touch /usr/local/etc/php/conf.d/custom.ini && \
    echo -e "file_uploads = On\nmemory_limit = 264M\nupload_max_filesize = 100M\npost_max_size = 100M\nmax_execution_time = 300"

# We want our data to be persistent so let's use a volume.
VOLUME /var/www/html

# Copy our entrypoint bash script to container.
COPY docker-entrypoint.sh /usr/local/bin/

# Update bash script permissions.
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set our entrypoint.
ENTRYPOINT ["docker-entrypoint.sh"]
