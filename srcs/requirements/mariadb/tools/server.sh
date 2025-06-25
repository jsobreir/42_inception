#!/bin/bash/

service mariadb start

CREATE USER $USER@'%' IDENTIFIED BY $USER_PASSWORD;
GRANT REPLICATION REPLICA ON *.* TO $USER@'%';
RESET MASTER;

#TODO :: Need to setup mariadb correctly