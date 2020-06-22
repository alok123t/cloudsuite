FROM cloudsuite/debian:base-os
LABEL maintainer="Mark Sutherland <mark.sutherland@epfl.ch>"

RUN apt-get update \
	&& apt-get install -y \
	gnupg2 \
	software-properties-common

# Install MySQL
ENV MYSQL_MAJOR 5.7
ENV root_password root
RUN { \
	echo mysql-community-server mysql-community-server/root-pass password ''; \	
	echo mysql-community-server mysql-community-server/re-root-pass password ''; \	
	} | debconf-set-selections \	
	&& echo "deb http://repo.mysql.com/apt/debian/ $(lsb_release -sc) mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list \	
	&& apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com 0x8C718D3B5072E1F5 \	
	&& apt-get update && DEBIAN_FRONTEND=noninteractive \	
	&& apt-get install -y mysql-server \
	&& rm -rf /var/lib/apt/lists/*

# Allow it to listen from outer world
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Copy the scripts
ADD files/execute.sh /execute.sh

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
