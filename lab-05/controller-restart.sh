#!/bin/sh

echo "Stop ONOS docker container"
sudo docker stop onos
sleep 1

echo "Remove ONOS docker container"
sudo docker rm onos
sleep 1

echo "Start ONOS docker container"
sudo docker run -t -d --name onos onosproject/onos
sleep 60

echo "Configure ONOS docker container"
./lab-05-05-controller-configuration.sh


