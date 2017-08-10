package test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Properties;

public class Config {
	protected static final int TEST_TIME = 30;
	static final String LOG_FILE = "kafka.log";

	public static final String BOOTSTRAP_SERVERS = "localhost:9092";
	public static final String ZOOKEEPER_CONNECT = "localhost:2181";
	// public static final String BOOTSTRAP_SERVERS="172.18.163.121:9092,172.18.163.131:9092,172.18.163.141:9092";
	// public static final String ZOOKEEPER_CONNECT = "172.18.163.128:2181,172.18.163.132:2181,172.18.163.149:2181";

	public static Properties configP() {
		Properties props = new Properties();
/*
--batch-size <Integer: size>
--broker-list <hostname:port,.., hostname:port>
--compression-codec <Integer: supported codec: NoCompressionCodec as 0, GZIPCompressionCodec as 1, SnappyCompressionCodec as 2, LZ4CompressionCodec as 3>
--date-format <date format>
--hide-header
--initial-message-id <Integer: initial message id>
--message-send-gap-ms <Integer: message send time gap>
--message-size <Integer: size>
--messages <Long: count>
--metrics-dir <metrics dictory>
--new-producer
--producer-num-retries <Integer>
--producer-retry-backoff-ms <Integer>
--reporting-interval <Integer: size>
--request-num-acks <Integer>
--request-timeout-ms <Integer>
--show-detailed-stats
--sync
--threads <Integer: number of threads>
--topics <topic1,topic2..>
--vary-message-size
*/
		props.put("bootstrap.servers", BOOTSTRAP_SERVERS);
		props.put("acks", "-1");
		props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		return props;
	}

	public static Properties configC(boolean auto_commit) {
		Properties props = new Properties();
/*
--batch-size <Integer: size>
--compression-codec <Integer: supported codec: NoCompressionCodec as 0, GZIPCompressionCodec as 1, SnappyCompressionCodec as 2, LZ4CompressionCodec as 3>
--date-format <date format>
--fetch-size <Integer: size>
--from-latest
--group <gid>
--hide-header
--message-size <Integer: size>
--messages <Long: count>
--num-fetch-threads <Integer: count>
--reporting-interval <Integer: size>
--show-detailed-stats
--socket-buffer-size <Integer: size>
--threads <Integer: count>
--topic <topic>
--zookeeper <urls>
*/
		props.put("zookeeper.connect", ZOOKEEPER_CONNECT);
		props.put("group.id", "default-group");
		props.put("zookeeper.session.timeout.ms", "4000");
		props.put("zookeeper.sync.time.ms", "200");
		props.put("auto.commit.interval.ms", "1000");
		props.put("auto.offset.reset", "smallest");
		props.put("serializer.class", "kafka.serializer.StringEncoder");
		props.put("enable.auto.commit", auto_commit);
		return props;
	}

	public static void logfile(StringBuffer sb) {
		try {
			File file = new File(LOG_FILE);
			PrintWriter pw = new PrintWriter(new FileOutputStream(file, true));
			pw.println(sb);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
