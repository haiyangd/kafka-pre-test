#!/bin/bash

TOPIC="topic161"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic162"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic163"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic164"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000

TOPIC="topic165"
P="/SERVICE01/kafka/bin/kafka-producer-perf-test.sh --broker-list ka1:9092 --messages 500000  --compression-codec 3 --topics $TOPIC"
C="/SERVICE01/kafka/bin/kafka-consumer-perf-test.sh --zookeeper zk1:2181,zk2:2181,zk3:2181 --messages 500000 --topic $TOPIC"

echo "P"

$P --threads 3 --batch-size 1000 --message-size 1000

echo "C"

$C --threads 3 --batch-size 1000 --message-size 1000