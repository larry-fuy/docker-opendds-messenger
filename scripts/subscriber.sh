#!/bin/sh
work_dir=$DDS_ROOT/DevGuideExamples/DCPS/Messenger.minimal
cd $work_dir
rm -f /scripts/sub.log
rm -f sub.ini
host_ip=$(hostname -i)
cp /scripts/sub.ini sub.ini
sed -i -e "s/repo_ip/$repo_ip/" -e "s/repo_port/$repo_port/" -e "s/host_ip/$host_ip/" -e "s/host_port/$host_port/" sub.ini
./subscriber -ORBDottedDecimalAddresses 1 -DCPSDebugLevel 10 -ORBLogFile /scripts/sub.log  -DCPSConfigFile sub.ini > /scripts/received_message.txt
