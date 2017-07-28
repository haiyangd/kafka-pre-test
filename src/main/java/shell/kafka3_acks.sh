#!/bin/bash

TOPIC="topic351"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
echo $TOPIC

echo "P"

$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks -1
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 0
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 1

TOPIC="topic352"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks -1
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 0
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 1

TOPIC="topic353"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092,ka3:9092 --messages 500000 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks -1
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 0
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 1
