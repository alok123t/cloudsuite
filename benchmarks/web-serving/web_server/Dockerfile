FROM cloudsuite/debian:base-os
LABEL maintainer="Mark Sutherland <mark.sutherland@epfl.ch>"

RUN apt-get update \
	&& apt-get install -y \
	software-properties-common \
	gnupg2 \
	build-essential \
	git \
	nginx \
	unzip \
	wget

# Install hhvm
ENV HHVM_VERSION 4.56
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94 \
	&& add-apt-repository "deb http://dl.hhvm.com/debian $(lsb_release -sc)-${HHVM_VERSION} main" \
	&& apt-get update \
	&& apt-get install -y hhvm

# Install php
RUN wget https://packages.sury.org/php/apt.gpg \
	&& apt-key add apt.gpg \
	&& rm apt.gpg \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list \
	&& apt-get update \
	&& apt-get install -y php7.4 php7.4-gd php7.4-mysql php7.4-curl php7.4-fpm php-memcached \
	&& mkdir -p /run/php

RUN rm -rf /var/lib/apt/lists/*

# Increase the open file limit
COPY files/limits.conf.append /tmp/
RUN cat /tmp/limits.conf.append >> /etc/security/limits.conf && rm -f /tmp/limits.conf.append

RUN apt-get update && apt-get install -y vim

# Checkout the Elgg installation
RUN cd /usr/share/nginx/html/ \
	&& wget -q --show-progress --progress=bar:force -O elgg-3.3.6.zip https://elgg.org/about/getelgg?forward=elgg-3.3.6.zip \
	&& unzip elgg-3.3.6.zip \
	&& rm -rf elgg-3.3.6.zip \
	&& mv elgg-3.3.6 elgg

WORKDIR /usr/share/nginx/html
# Copy over the settings.php
COPY files/settings.php elgg/elgg-config/settings.php

# Make the Elgg data directory
RUN mkdir /elgg_data
RUN chmod a+rw /elgg_data

# Copy over the Nginx Server configuration
COPY files/nginx_sites_avail.append /tmp/

# Copy over the Nginx HHVM Server configuration
COPY files/nginx_sites_avail_hhvm.append /tmp/
COPY files/configure_hhvm.sh /tmp/

RUN service nginx restart

# RUN service php7.4-fpm restart

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

EXPOSE 8080

CMD ["/etc/bootstrap.sh", "-d"]
