#!/bin/bash

TOPIC="topic261"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic262"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic263"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic264"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic265"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092,ka2:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"
echo $TOPIC

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000