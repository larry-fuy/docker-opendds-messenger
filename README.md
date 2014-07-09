docker-opendds-messenger
========================

This project deploys a Messenger example of [OpenDDS](opendds.org) on Docker containers. The example includes three processes, DCPSInfoRepo, Publisher and Subscriber. DCPSInfoRepo works as discovery service. Publisher transmits message to Subscriber. Each of processes runs on a Docker container. 

Requirement
-----------
[Docker](https://docs.docker.com/installation/#installation) (version >= 0.9)

[docker-opendds](https://github.com/larry-fuy/docker-opendds) (Only necessary if you need to build the container image by yourself, which is not recommended)

Install and run
---------------
1. Download 

  ```git clone https://github.com/larry-fuy/docker-opendds-messenger.git``` 
  
2. Run tests
  
  ```cd docker-opendds-messenger &&   ./run_test_docker.sh```
  You may wait a few minutes (depends on your network) to pull the image of the container from Docker's public repository. 
  
  If output include ```... passed ...```, the example runs successfully. Otherwise please check the log files for InfoRepo, Publisher and Subscriber (repo.log, pub.log, sub.log) for details.
