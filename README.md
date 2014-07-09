docker-opendds-messenger
========================

This project deployed [OpenDDS](www.opendds.org) example Messenger on Docker containers

Requirement
-----------
Docker (>= 0.9)

Install and run
---------------
1. Download 

  ```git clone https://github.com/larry-fuy/docker-opendds-messenger.git``` 
  
2. Run tests
  
  ```cd docker-opendds-messenger &&   ./run_test_docker.sh```
  
  If output is ```... passed ...```, the test runs successfully. Otherwise please check the log files for InfoRepo, Publisher and Subscriber (repo.log, pub.log, sub.log).
