package day0109;

import java.util.Scanner;

public class QuizFor_17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz1();
		quiz2();
		quiz3();
	}
	public static void quiz1() {
		/*
		 * 팩토리얼 구할 숫자를 입력하여 해당 숫자에 대한 팩토리얼 구하기
		 * 
		 * 팩토리얼 구할 숫자 입력
		 * 5
		 * 5!=120
		 */
		Scanner sc=new Scanner(System.in);
		int num;
		int fac=1;
		System.out.println("팩토리얼 구할 숫자 입력");
		num=sc.nextInt();
		for(int i=1;i<=num;i++) {
			fac*=i;
		}
		System.out.println(num+"!="+fac);
	}
	public static void quiz2() {
		/*
		 * 두수 x,y를 입력 후 x의 y승_for문 이용해서 구하시오
		 * 
		 * 두수 입력
		 * 3 3
		 * 3의 3승은 27입니다
		 */
		Scanner sc=new Scanner(System.in);
		int x, y;
		int p=1;
		System.out.println("두수 입력");
		x=sc.nextInt();
		y=sc.nextInt();
		
		for(int i=1;i<=y;i++) {
			p*=x;
			//x를 y번 곱한다
			}
		System.out.println(x+"의 "+y+"승은 "+p+"입니다");
		System.out.println();
		}
	public static void quiz3() {
		/*
		 * 1~100까지의 숫자 중 짝수의 합과 홀수의 합을 출력해주세요(for)
		 */
		int sum1=0, sum2=0;
		for(int i=1;i<=100;i++) {
			if(i%2==0)
				sum1+=i;
			else
				sum2+=i;
		}
		System.out.println("짝수의 합: "+sum1+"\n"+"홀수의 합: "+sum2);
	}
}
