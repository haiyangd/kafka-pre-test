package test;

import tests.Messagesize;

public class Kafka {
	public static void main(String[] args) {
		if (args.length != 4) {
			help();
		}
		int producer = 1, cunsumer = 1, datalength = 1000;
		boolean auto_commit = true;
		try {
			producer = Integer.parseInt(args[1].trim());
			cunsumer = Integer.parseInt(args[2].trim());
			datalength = Integer.parseInt(args[3].trim());
		} catch (Exception e) {
			help();
		}
		Scene.args = args;
		switch (args[0]) {
		case "S1":
			new Messagesize(producer, cunsumer, datalength, auto_commit).test();
			break;
		/*case "S2":
			new Scenes2(producer, cunsumer, datalength).test();
			break;
		case "S3":
			new Scenes3(producer, cunsumer, datalength).test();
			break;
		case "S4":
			new Scenes4(producer, cunsumer, datalength).test();
			break;
		case "S5":
			new Scenes5(producer, cunsumer, datalength).test();
			break;*/
		default:
			help();
			break;
		}
	}

	static void help() {
		System.out.println("scene=S1-S5 producer=N cunsumer=N datalength=N");
		System.out.println("java -jar kafka.jar S1 1 1 1000");
		System.exit(0);
	}
}
