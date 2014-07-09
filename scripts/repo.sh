#!/bin/sh
repo_ip=$(hostname -i)
echo $repo_ip
work_dir=$DDS_ROOT/DevGuideExamples/DCPS/Messenger.minimal
cd $work_dir
pwd
rm -f repo.log repo.ior
rm -f /scripts/repo.log /scripts/repo.ior
$DDS_ROOT/bin/DCPSInfoRepo -DCPSDebugLevel 10 -ORBLogFile /scripts/repo.log  -ORBListenEndpoints iiop://"$repo_ip:$repo_port"
