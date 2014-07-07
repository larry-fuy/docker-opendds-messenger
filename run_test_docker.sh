#!/usr/bin/sh

# load Opendds images
docker pull yongfu/opendds

repo_port=10000
names=(inforepo, publisher, subscriber)

# run three docker containers for InfoRepo, publisher
# and subscriber
docker run -d --name inforepo -e "REPO_PORT=$REPO_PORT" yongfu/opendds -v ./scripts:/scripts /scripts/repo.sh
docker run -d --name publisher -w "$WORK_DIR" yongfu/opendds -v ./scripts:/scripts /scripts/publisher.sh 
#./publisher -ORBDottedDecimalAddresses 1 -DCPSConfigFile pub.ini
docker run -d --name subscriber -w "$WORK_DIR" yongfu/opendds -v ./scripts:/scrips /scripts/subscriber.sh
#./subscriber -ORBDottedDecimalAddresses 1 -DCPSConfigFile pub.ini > message.txt


# stop and destroy the docker containers
for n in ($names) ; do
    docker stop $n
    docker rm $n
done
