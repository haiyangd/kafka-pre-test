package test;

import java.io.IOException;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 场景
 */
public abstract class Scene {
	public static String[] args;
	public volatile boolean isRun = true;

	public boolean DEBUG = false; // 输出生产消费日志

	public int producerCount = 1; // 生产者个数
	public int cunsumerCount = 1; // 消费者个烽
	public int messageLength = 1000; // 消息大小
	public boolean auto_commit = true;

	public Scene(int producerCount, int cunsumerCount, int messageLength, boolean auto_commit) {
		this.producerCount = producerCount;
		this.cunsumerCount = cunsumerCount;
		this.messageLength = messageLength;
	}

	private volatile long pCount = 0;
	private volatile long cCount = 0;
	private volatile long totalLatency = 0;
	private volatile long maxLatency = 0;
	private volatile long miniLatency = 0;

	public abstract void sends();

	public abstract void receives();

	public void test() {
		System.out.println(String.format("测试开始，%d生产者 %d消费者 %dB消息：", producerCount, cunsumerCount, messageLength));
		final long start = System.currentTimeMillis();
		// 启动监控
		new Timer().schedule(new TimerTask() {
			int count = 0;

			public void run() {
				if (isRun) {
					System.out.println(String.format("[%2d] 生产者：已发送%d\t消费者：已接收%d", ++count, pCount, cCount));
				}
				if (count >= Config.TEST_TIME) {
					end(start);
				}
			}
		}, 1000, 1000);
		// 启动消费者线程
		receives();
		// 启动生产者线程
		sends();
		// 打印结果
		while (isRun) {
			try {
				Integer code = System.in.read();
				if (code != null) {
					end(start);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void end(long start) {
		isRun = false;
		final long end = System.currentTimeMillis();
		int delay = 1000;
		System.out.println("测试结束，延时" + (delay / 1000) + "秒统计结果");
		try {
			Thread.sleep(delay);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		long time = end - start;
		float pTps = 1f * pCount / (time / 1000);
		float pMb = 1f * pCount * messageLength / 1000000;
		float pMbs = 1f * pCount * messageLength / 1000 / time;
		float cTps = 1f * cCount / (time / 1000);
		float cMb = 1f * cCount * messageLength / 1000000;
		float cMbs = 1f * cCount * messageLength / 1000 / time;
		StringBuffer sb = new StringBuffer();
		sb.append(String.format("java -jar kafka.jar %s %s %s %s\n", args[0], args[1], args[2], args[3]));
		sb.append(String.format("测试时间%s毫秒（%.2f秒）\n", time, time / 1000f));
		if (pCount > 0) {
			sb.append(String.format("生产者：共发送%d条 共%.2fMB  %.2f条/秒  %.2fMB/秒\n", pCount, pMb, pTps, pMbs));
		}
		if (cCount > 0) {
			sb.append(String.format("消费者：共接收%d条 共%.2fMB  %.2f条/秒  %.2fMB/秒\n", cCount, cMb, cTps, cMbs));
		}
		// 同时生产和消费时才统计
		if (pCount > 0 && cCount > 0 && messageLength > String.valueOf(System.currentTimeMillis()).length()) {
			sb.append(String.format("端到端延迟：最高%d毫秒 最低%d毫秒 平均%d毫秒\n", maxLatency, miniLatency, totalLatency / cCount));
		}
		System.out.println(sb.toString());
		Config.logfile(sb);
		System.exit(0);
	}

	public synchronized void pAdd(long count) {
		pCount += count;
	}

	public synchronized void cAdd(long count) {
		cCount += count;
	}

	public synchronized void latency(long time) {
		totalLatency += time;
		if (miniLatency > time) {
			miniLatency = time;
		} else if (maxLatency < time) {
			maxLatency = time;
		}
	}

	static Random random = new Random();

	// 消息生成
	public String getMessage() {
		StringBuilder sb = new StringBuilder();
		String timestamp = String.valueOf(System.currentTimeMillis()) + "_";
		if (messageLength > timestamp.length()) {
			sb.append(timestamp);
		}
		for (int i = sb.length(); i < messageLength; i++) {
			sb.append((random.nextInt(2) % 2 == 0 ? 65 : 97) + random.nextInt(26));
		}
		return sb.toString();
	}

	// 生产消息处理
	public void sendProc(String message, Integer partition) throws InterruptedException {
		pAdd(1);
		if (DEBUG) {
			StringBuffer sb = new StringBuffer();
			sb.append(Thread.currentThread().getName()).append(" : ");
			if (partition != null) {
				sb.append(partition).append(" : ");
			}
			sb.append(message);
			System.out.println(sb);
			Thread.sleep(1000);
		}
	}

	// 消费消息处理
	public void receiveProc(String message, int partition) {
		cAdd(1);
		String timestamp = message.substring(0, message.indexOf('_'));
		long time = System.currentTimeMillis() - Long.parseLong(timestamp);
		latency(time);
		if (DEBUG) {
			StringBuffer sb = new StringBuffer();
			sb.append(Thread.currentThread().getName()).append(" : ").append(time).append("ms :");
			sb.append(partition).append(" : ");
			sb.append(message);
			System.out.println(sb);
		}
	}
}
