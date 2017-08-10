#!/bin/bash

TOPIC="topic22"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 1 --batch-size 1000 --message-size 1000
$P --threads 2 --batch-size 1000 --message-size 1000
$P --threads 3 --batch-size 1000 --message-size 1000
$P --threads 4 --batch-size 1000 --message-size 1000
$P --threads 5 --batch-size 1000 --message-size 1000
$P --threads 6 --batch-size 1000 --message-size 1000
$P --threads 7 --batch-size 1000 --message-size 1000
$P --threads 8 --batch-size 1000 --message-size 1000
$P --threads 9 --batch-size 1000 --message-size 1000
$P --threads 10 --batch-size 1000 --message-size 1000
$P --threads 11 --batch-size 1000 --message-size 1000
$P --threads 12 --batch-size 1000 --message-size 1000
$P --threads 13 --batch-size 1000 --message-size 1000
$P --threads 14 --batch-size 1000 --message-size 1000
$P --threads 15 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 1 --batch-size 1000 --message-size 1000
$C --threads 2 --batch-size 1000 --message-size 1000
$C --threads 3 --batch-size 1000 --message-size 1000
$C --threads 4 --batch-size 1000 --message-size 1000
$C --threads 5 --batch-size 1000 --message-size 1000
$C --threads 6 --batch-size 1000 --message-size 1000
$C --threads 7 --batch-size 1000 --message-size 1000
$C --threads 8 --batch-size 1000 --message-size 1000
$C --threads 9 --batch-size 1000 --message-size 1000
$C --threads 10 --batch-size 1000 --message-size 1000
$C --threads 11 --batch-size 1000 --message-size 1000
$C --threads 12 --batch-size 1000 --message-size 1000
$C --threads 13 --batch-size 1000 --message-size 1000
$C --threads 14 --batch-size 1000 --message-size 1000
$C --threads 15 --batch-size 1000 --message-size 1000