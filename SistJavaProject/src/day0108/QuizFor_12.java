package day0108;

import java.util.Scanner;

public class QuizFor_12 {

	public static void main(String[] args) {

		System.out.println("1. 1  2  4  5  7  8  10(continue 활용)");
		
		for(int a=1;a<=10;a++) {
			if(a%3==0)
				continue;
		System.out.print(a+" ");
		}
		System.out.println();
		
		System.out.println("2. 홀수값:1  홀수값:3  홀수값:5  홀수값:7  홀수값:9");
		for(int b=1;b<=10;b+=2)
			System.out.print(b+" ");
		
		System.out.println();
		
		System.out.println("3. 점수를 입력 후 합계를 구하는데 0을 입력하면 빠져나오면서 합계출력_while(true)");
		Scanner sc=new Scanner(System.in);
		int score;
		int sum=0;
		
		while(true) {
			System.out.println("점수를 입력하세요");
			score=sc.nextInt();
			
			if(score==0)
				break;
			
			if(score<0 || score>100) {
				System.out.println("다시 입력해주세요(1~100)");
				continue;
			}
			
			sum+=score;
		}
		System.out.println("총합계: "+sum);
		
	}

}
