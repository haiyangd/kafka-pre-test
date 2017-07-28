#!/bin/bash

TOPIC="topic13"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 100
$P --threads 3 --batch-size 1000 --message-size 200
$P --threads 3 --batch-size 1000 --message-size 400
$P --threads 3 --batch-size 1000 --message-size 600
$P --threads 3 --batch-size 1000 --message-size 800
$P --threads 3 --batch-size 1000 --message-size 1000
$P --threads 3 --batch-size 1000 --message-size 2000
$P --threads 3 --batch-size 1000 --message-size 4000
$P --threads 3 --batch-size 1000 --message-size 6000
$P --threads 3 --batch-size 1000 --message-size 8000
$P --threads 3 --batch-size 1000 --message-size 10000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 100
$C --threads 3 --batch-size 1000 --message-size 200
$C --threads 3 --batch-size 1000 --message-size 400
$C --threads 3 --batch-size 1000 --message-size 600
$C --threads 3 --batch-size 1000 --message-size 800
$C --threads 3 --batch-size 1000 --message-size 1000
$C --threads 3 --batch-size 1000 --message-size 2000
$C --threads 3 --batch-size 1000 --message-size 4000
$C --threads 3 --batch-size 1000 --message-size 6000
$C --threads 3 --batch-size 1000 --message-size 8000
$C --threads 3 --batch-size 1000 --message-size 10000