#!/usr/bin/sh

# load Opendds images
docker pull yongfu/opendds > /dev/null 2>&1

repo_port=10000
host_port=1234
names=(inforepo publisher subscriber)

# run three docker containers for InfoRepo, publisher
# and subscriber
# todo : upgrade docker and use env-file
echo "run InfoRepo..."
docker run -d  --name inforepo  -v "$PWD/scripts:/scripts" -w /scripts --env "repo_port=$repo_port" yongfu/opendds /scripts/repo.sh > /dev/null 2>&1
repo_ip=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' inforepo)

# run publisher and subscriber
echo "run Publisher..."
docker run -d --name publisher -e "repo_ip=$repo_ip" -e "repo_port=$repo_port" -e "host_port=$host_port"  -v "$PWD/scripts:/scripts"  -w /scripts yongfu/opendds /scripts/publisher.sh > /dev/null 2>&1
echo "run Subscriber..."
docker run -d --name subscriber -e "repo_ip=$repo_ip" -e "repo_port=$repo_port" -e "host_port=$host_port"  -v "$PWD/scripts:/scripts"  -w /scripts yongfu/opendds /scripts/subscriber.sh > /dev/null 2>&1

# need some time to transfer message
echo "wait a moment..."
sleep 10s

# compare the sent and received message
# todo : more tests
rm -f ./scripts/received_message
if diff -q ./scripts/message.txt ./scripts/received_message.txt ; 
then
    echo "passed"
else    
    echo "something wrong!"
fi

# stop and destroy the docker containers
echo "clean up..."
docker stop inforepo > /dev/null 2>&1
docker rm ${names[*]} > /dev/null 2>&1
