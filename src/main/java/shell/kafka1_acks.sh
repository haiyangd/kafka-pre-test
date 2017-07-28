#!/bin/bash

TOPIC="topic15"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000 --topics $TOPIC"
echo $TOPIC

echo "P"

$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks -1
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 0
$P --threads 6 --batch-size 1000 --message-size 1000 --request-num-acks 1
