#!/bin/bash

# This function will wait until the specified port on the specified machine is available
# Parameters: $1 = the IP; $2 = the port; $3 = the name of the service
wait_port() {
  while ! netcat -w 5 "$1" "$2"; do
    echo "Waiting for $3 ..."
    sleep 3
  done
}

# Start memcached container
# echo "Starting memcached container"
# sudo docker run -tid -h memcached --name memcached_container --network              \
#        host memcached-webtier

# wait_port localhost 11211 memcached
# echo "Memcached is up and running!"
# exit 0

# sudo docker run -tid --privileged -h cassandra -e SYSTEM_MEMORY=8 --name cassandra_container --network cassandra_network cassandra-webtier
# wait_port localhost 9042 cassandra
# exit 0

# Start cassandra container
echo "Starting cassandra container"
sudo docker run -tid --privileged -h cassandra -e SYSTEM_MEMORY=8 --name cassandra_container           \
            --network host cassandra-webtier

wait_port localhost 9042 cassandra
echo "Cassandra is up and running!"
exit 0

# Start graphite container
# echo "Starting graphite container"
# sudo docker run -tid -h graphite --name graphite_container --network host \
#             graphite-webtier

# wait_port localhost 80 graphite
# echo "Graphite is up and running!"

# Start uwsgi container
# echo "Starting uwsgi container"
# sudo docker run -tid -h uwsgi --name uwsgi_container --network host        \
#            -e GRAPHITE_ENDPOINT=localhost                    \
#            -e CASSANDRA_ENDPOINT=localhost                                    \
#            -e MEMCACHED_ENDPOINT="localhost:11211"                            \
#            -e SIEGE_ENDPOINT=localhost uwsgi-webtier

wait_port localhost 8000 uwsgi

echo "uWSGI is up and running!"
exit 0
# Start siege container
echo "Starting siege container"
sudo docker run -ti -h siege --name siege_container --volume=/tmp:/tmp --privileged \
           --network host -e ATTEMPTS=10                             \
           -e TARGET_ENDPOINT=localhost -e SIEGE_WORKERS=${WORKERS:-185}     \
           siege-webtier
