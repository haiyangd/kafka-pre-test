package test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;
import kafka.javaapi.consumer.ConsumerConnector;
import kafka.message.MessageAndMetadata;
import kafka.serializer.StringDecoder;
import kafka.utils.VerifiableProperties;

public class Test {
	public static final String TOPIC = "topic3";

	public static void main(String[] args) throws InterruptedException {
		new P().start();
		new C().start();
	}

	static class P extends Thread {
		@Override
		public void run() {
			Properties props = new Properties();
			props.put("bootstrap.servers", "172.18.163.121:9092,172.18.163.131:9092,172.18.163.141:9092");
			props.put("acks", "all");// 0:不等待任何 1:等待Leader成功写入 all:等待所有成功写入
			props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
			props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
			Producer<String, String> producer = new KafkaProducer<>(props);
			for (int i = 0; i < 3; i++) {
				final String key = "key" + i;
				final String value = "value" + i;
				producer.send(new ProducerRecord<String, String>(TOPIC, i, key, value), new Callback() {
					@Override
					public void onCompletion(RecordMetadata metadata, Exception exception) {
						System.out.printf("P >> %s=%s offset:%s partition:%s\n", key, value, metadata.offset(), metadata.partition());
					}
				});
			}
			producer.close();
		}
	}

	static class C extends Thread {
		@Override
		public void run() {
			Properties props = new Properties();
			props.put("zookeeper.connect", "172.18.163.128:2181,172.18.163.132:2181,172.18.163.149:2181");
			props.put("group.id", "wtf-group");
			props.put("zookeeper.session.timeout.ms", "4000");
			props.put("zookeeper.sync.time.ms", "200");
			props.put("auto.commit.interval.ms", "1000");
			props.put("auto.offset.reset", "smallest");
			props.put("serializer.class", "kafka.serializer.StringEncoder");

			ConsumerConfig config = new ConsumerConfig(props);
			ConsumerConnector consumer = kafka.consumer.Consumer.createJavaConsumerConnector(config);

			Map<String, Integer> topicCountMap = new HashMap<String, Integer>();
			topicCountMap.put(TOPIC, new Integer(1));

			StringDecoder keyDecoder = new StringDecoder(new VerifiableProperties());
			StringDecoder valueDecoder = new StringDecoder(new VerifiableProperties());

			Map<String, List<KafkaStream<String, String>>> consumerMap = consumer.createMessageStreams(topicCountMap, keyDecoder, valueDecoder);
			KafkaStream<String, String> stream = consumerMap.get(TOPIC).get(0);
			ConsumerIterator<String, String> it = stream.iterator();
			while (it.hasNext()) {
				MessageAndMetadata<String, String> mam = it.next();
				System.out.printf("C << %s=%s offset:%s partition:%s\n", mam.key(), mam.message(), mam.offset(), mam.partition());
			}
		}
	}
}
