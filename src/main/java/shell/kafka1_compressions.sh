#!/bin/bash

TOPIC="topic14"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 0
$P --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 1
$P --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 2
$P --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 3

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 0
$C --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 1
$C --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 2
$C --threads 3 --batch-size 1000 --message-size 1000 --compression-codec 3