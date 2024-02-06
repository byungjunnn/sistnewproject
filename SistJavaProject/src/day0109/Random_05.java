package day0109;

import java.nio.file.spi.FileSystemProvider;
import java.util.Random;

public class Random_05 {

	public static void main(String[] args) {
		// Random 클래스 이용

		Random r=new Random();
		
		System.out.println("0~9 사이의 난수 5개 발생");
		for(int i=1;i<=5;i++) {
			int a=r.nextInt(10); // 0~9까지
			System.out.println(a);
		}
		System.out.println("--------------------");
		System.out.println("0~99 사이의 난수 5개 발생");
		for(int i=1;i<=5;i++) {
			int a=r.nextInt(100); // 0~99까지
			System.out.println(a);
		}
		System.out.println("--------------------");
		System.out.println("1~10 사이의 난수 5개 발생");
		for(int i=1;i<=5;i++) {
			int a=r.nextInt(10)+1; // 1~10까지
			System.out.println(a);
		}
		System.out.println("--------------------");
		System.out.println("65~90 사이의 난수 5개 발생");
		for(int i=1;i<=5;i++) {
			int a=r.nextInt(26)+65; // 65~90까지
			System.out.println((char)a);
		}

	}

}
