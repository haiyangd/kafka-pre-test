package tests;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;

import kafka.consumer.ConsumerConfig;
import kafka.consumer.ConsumerIterator;
import kafka.consumer.KafkaStream;
import kafka.javaapi.consumer.ConsumerConnector;
import kafka.message.MessageAndMetadata;
import kafka.serializer.StringDecoder;
import kafka.utils.VerifiableProperties;
import test.Config;
import test.Scene;

/**
 */
public class Messagesize extends Scene {
	public static String TOPIC = "topic2";
	public static Integer PARTITION = null;

	public Messagesize(int producerCount, int cunsumerCount, int messageLength, boolean auto_commit) {
		super(producerCount, cunsumerCount, messageLength, auto_commit);
	}

	@Override
	public void sends() {
		for (int i = 0; i < producerCount; i++) {
			Thread producer = new Thread(new Runnable() {
				public void run() {
					System.out.println(Thread.currentThread().getName() + "启动");
					try {
						send();
						System.out.println(Thread.currentThread().getName() + "已结束");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(Thread.currentThread().getName() + "异常结束");
					} finally {
						try {
						} catch (Exception e) {
							System.out.println(Thread.currentThread().getName() + "异常结束");
						}
					}
				}
			});
			producer.setName("producer_1");
			producer.start();
		}
	}

	public void send() throws Exception {
		Properties props = Config.configP();
		Producer<String, String> producer = new KafkaProducer<>(props);
		while (isRun) {
			String message = getMessage();
			if (PARTITION != null) {
				producer.send(new ProducerRecord<String, String>(TOPIC, PARTITION, null, message));
			} else {
				producer.send(new ProducerRecord<String, String>(TOPIC, null, message));
			}
			sendProc(message, PARTITION);
		}
		producer.close();
	}

	@Override
	public void receives() {
		for (int i = 0; i < cunsumerCount; i++) {
			Thread cunsumer = new Thread(new Runnable() {
				public void run() {
					System.out.println(Thread.currentThread().getName() + "启动");
					try {
						receive();
						System.out.println(Thread.currentThread().getName() + "已结束");
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(Thread.currentThread().getName() + "异常结束");
					} finally {
						try {
						} catch (Exception e) {
							System.out.println(Thread.currentThread().getName() + "异常结束");
						}
					}
				}
			});
			cunsumer.setName("consumer_1");
			cunsumer.start();
		}
	}

	public void receive() throws Exception {
		Properties props = Config.configC(auto_commit);
		ConsumerConfig config = new ConsumerConfig(props);
		ConsumerConnector consumer = kafka.consumer.Consumer.createJavaConsumerConnector(config);

		Map<String, Integer> topicCountMap = new HashMap<String, Integer>();
		topicCountMap.put(TOPIC, new Integer(1));

		StringDecoder keyDecoder = new StringDecoder(new VerifiableProperties());
		StringDecoder valueDecoder = new StringDecoder(new VerifiableProperties());

		Map<String, List<KafkaStream<String, String>>> consumerMap = consumer.createMessageStreams(topicCountMap, keyDecoder, valueDecoder);
		KafkaStream<String, String> stream = consumerMap.get(TOPIC).get(0);
		ConsumerIterator<String, String> it = stream.iterator();
		while (isRun && it.hasNext()) {
			MessageAndMetadata<String, String> mam = it.next();
			String message = mam.message();
			if (!auto_commit) { // 手动commit
				consumer.commitOffsets();
			}
			receiveProc(message, mam.partition());
		}
	}

}
