#!/bin/sh
work_dir=$DDS_ROOT/DevGuideExamples/DCPS/Messenger.minimal
cd $work_dir
rm -f /scripts/pub.log
rm -f pub.ini
host_ip=$(hostname -i)
echo $host_ip
cp /scripts/pub.ini pub.ini
sed -i -e "s/repo_ip/$repo_ip/" -e "s/repo_port/$repo_port/" -e "s/host_ip/$host_ip/" -e "s/host_port/$host_port/" pub.ini
./publisher -ORBDottedDecimalAddresses 1 -DCPSDebugLevel 10 -ORBLogFile /scripts/pub.log  -DCPSConfigFile pub.ini
