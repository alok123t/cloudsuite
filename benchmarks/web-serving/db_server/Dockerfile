FROM cloudsuite/mysql:5.7

# Copy the scripts
ADD files/execute.sh /execute.sh
ADD files/elgg_db_dump.sql /elgg_db_dump.sql

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
