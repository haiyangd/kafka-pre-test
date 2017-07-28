#!/bin/bash

TOPIC="topic13"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1 --message-size 1000
$P --threads 3 --batch-size 2 --message-size 1000
$P --threads 3 --batch-size 5 --message-size 1000
$P --threads 3 --batch-size 10 --message-size 1000
$P --threads 3 --batch-size 50 --message-size 1000
$P --threads 3 --batch-size 100 --message-size 1000
$P --threads 3 --batch-size 500 --message-size 1000
$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1 --message-size 1000
$C --threads 3 --batch-size 2 --message-size 1000
$C --threads 3 --batch-size 5 --message-size 1000
$C --threads 3 --batch-size 10 --message-size 1000
$C --threads 3 --batch-size 50 --message-size 1000
$C --threads 3 --batch-size 100 --message-size 1000
$C --threads 3 --batch-size 1000 --message-size 1000
$C --threads 3 --batch-size 500 --message-size 1000