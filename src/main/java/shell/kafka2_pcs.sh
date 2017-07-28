#!/bin/bash

TOPIC="topic22"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 1 --batch-size 1000 --message-size 1000
$P --threads 2 --batch-size 1000 --message-size 1000
$P --threads 5 --batch-size 1000 --message-size 1000
$P --threads 10 --batch-size 1000 --message-size 1000
$P --threads 50 --batch-size 1000 --message-size 1000
$P --threads 100 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 1 --batch-size 1000 --message-size 1000
$C --threads 2 --batch-size 1000 --message-size 1000
$C --threads 5 --batch-size 1000 --message-size 1000
$C --threads 10 --batch-size 1000 --message-size 1000
$C --threads 50 --batch-size 1000 --message-size 1000
$C --threads 100 --batch-size 1000 --message-size 1000