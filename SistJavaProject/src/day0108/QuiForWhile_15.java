package day0108;

import java.util.Scanner;

public class QuiForWhile_15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test1();
		test2();
		test3();
		test4();
	}
	public static void test1() {
		//문제: 1~100까지의 3의 배수 갯수 구하기
		int n=0;
		int cnt=0;

		while(true) {
			n++;
			//3의 배수이면 cnt변수 1증가
			if(n%3==0)
				cnt++;
			//n이 100이면 while문 종료
			if(n==100)
				break;
		}
		System.out.println("3의 배수 갯수: "+cnt+"개");
	}
	public static void test2() {
		//1~100까지의 짝수 합 구하기
		int n=0;
		int sum=0;

		while(true) {
			n++;
			if(n%2==0)
				sum+=n;
			if(n==100)
				break;
		}
		System.out.println("1~100까지의 짝수의 합: "+sum);
	}

	public static void test3() {
		//for문 이용 1~100까지의 홀수 합 구하기
		int sum=0;
		for(int n=1;n<=100;n++) {
			if(n%2==1) {
				sum+=n;
			}
		}
		System.out.println("1~100까지의 홀수의 합: "+sum);
	}

	public static void test4() {
		/*
		 * 1번 점수: 90
		 * 2번 점수: -70
		 * 		잘못입력했어요
		 * 2번 점수: 85
		 * 3번 점수: 120
		 * 		잘못입력했어요
		 * 3번 점수: 88
		 * 4번 점수: 98
		 * 5번 점수: 75
		 * 총점: ****점
		 */
		Scanner sc=new Scanner(System.in);
		int score;
		int sum=0;

		System.out.println("총 5개의 점수 합계 구하기");

		for(int i=1;i<=5;i++) {
			System.out.print(i+"번 점수: ");
			score=sc.nextInt();

			if(score<1 || score>100) {
				System.out.println("\t잘못 입력했어요");
				i--;
				continue; //i++로 이동
			}
			sum+=score;
		}
		System.out.println("총점: "+sum);



	}
}
