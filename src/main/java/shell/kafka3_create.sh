#!/bin/bash

G="/SERVICE01/kafka/bin/kafka-topics.sh --create --zookeeper zk1:2181,zk2:2181,zk3:2181"

$G --topic topic31 --partitions 3 --replication-factor 1
$G --topic topic32 --partitions 3 --replication-factor 1
$G --topic topic33 --partitions 3 --replication-factor 1
$G --topic topic34 --partitions 3 --replication-factor 1
$G --topic topic351 --partitions 6 --replication-factor 1
$G --topic topic352 --partitions 6 --replication-factor 1
$G --topic topic353 --partitions 6 --replication-factor 1
$G --topic topic361 --partitions 1 --replication-factor 1
$G --topic topic362 --partitions 2 --replication-factor 1
$G --topic topic363 --partitions 4 --replication-factor 1
$G --topic topic364 --partitions 8 --replication-factor 1
$G --topic topic365 --partitions 10 --replication-factor 1