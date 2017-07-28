#!/bin/bash

G="/SERVICE01/kafka/bin/kafka-topics.sh --create --zookeeper zk1:2181,zk2:2181,zk3:2181"

$G --topic topic11 --partitions 3 --replication-factor 1
$G --topic topic12 --partitions 3 --replication-factor 1
$G --topic topic13 --partitions 3 --replication-factor 1
$G --topic topic14 --partitions 3 --replication-factor 1
$G --topic topic15 --partitions 6 --replication-factor 1
$G --topic topic161 --partitions 1 --replication-factor 1
$G --topic topic162 --partitions 2 --replication-factor 1
$G --topic topic163 --partitions 4 --replication-factor 1
$G --topic topic164 --partitions 8 --replication-factor 1
$G --topic topic165 --partitions 10 --replication-factor 1