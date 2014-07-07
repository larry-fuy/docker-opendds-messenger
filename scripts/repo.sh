#!/usr/bin/sh
work_dir=$DDS_ROOT/DevGuideExamples/DCPS/Messenger.minimal
host_ip = $(hostname -i)
cd work_dir
$DDS_ROOT/bin/DCPSInfoRepo -DCPSDebugLevel 4 -ORBListenEndpoints iiop://$host_ip:$repo_port
