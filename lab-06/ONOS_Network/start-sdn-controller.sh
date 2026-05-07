#!/bin/bash

# stop previous ONOS container
sudo docker stop onos

# remove previous ONOS container
sudo docker rm onos

# start the ONOS controller docker attached to the docker0
sudo docker run -t -d --privileged --name onos onosproject/onos

