package day0105;

import java.util.Scanner;

public class IfTest_10 {

	public static void main(String[] args) {
		// 숫자 하나를 입력하여 결과를 출력하시오
		/*
		 * 당신이 좋아하는 숫자는?
		 * 99
		 * 
		 * 그 숫자는 홀수입니다
		 * 다음에 만나요
		 */
		
		Scanner sc=new Scanner(System.in);
		
		int num;
		
		System.out.println("당신이 좋아하는 숫자는?");
		num=sc.nextInt();
		System.out.println();
		
		System.out.println("***if문***");
		if(num%2==1)
			System.out.println("그 숫자는 홀수입니다");
		else
			System.out.println("그 숫자는 짝수입니다");
		System.out.println("다음에 만나요");
		
		//switch 문
		System.out.println("***switch문***");
		
		switch(num%2) {
			case 0:
				System.out.println("짝수");
				break;
			case 1:
				System.out.println("홀수");
				break;
		}
		
		

	}

}
