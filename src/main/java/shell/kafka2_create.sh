#!/bin/bash

G="/SERVICE01/kafka/bin/kafka-topics.sh --create --zookeeper zk1:2181,zk2:2181,zk3:2181"

$G --topic topic21 --partitions 3 --replication-factor 1
$G --topic topic22 --partitions 3 --replication-factor 1
$G --topic topic23 --partitions 3 --replication-factor 1
$G --topic topic24 --partitions 3 --replication-factor 1
$G --topic topic251 --partitions 6 --replication-factor 1
$G --topic topic252 --partitions 6 --replication-factor 1
$G --topic topic261 --partitions 1 --replication-factor 1
$G --topic topic262 --partitions 2 --replication-factor 1
$G --topic topic263 --partitions 4 --replication-factor 1
$G --topic topic264 --partitions 8 --replication-factor 1
$G --topic topic265 --partitions 10 --replication-factor 1