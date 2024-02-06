package day0105;

import java.util.Scanner;

public class OperTest_04 {

	public static void main(String[] args) {
		// 두 수를 입력해서 산술연산자를 이용하여 출력해봅시다(+,-,*,/,%)
		/*
		 * 두 수 입력해주세요
		 * 6
		 * 2
		 * 
		 * [산술연산자 결과]
		 * 더하기: 8
		 * 빼기: 4
		 * 곱하기:
		 * 나누기:
		 * 나머지값:
		 */
		Scanner sc=new Scanner(System.in);
		
		int a,b;
		
		System.out.println("두 수 입력해주세요");
		a=sc.nextInt();
		b=sc.nextInt();
		
		System.out.println();
		System.out.println("[산술연산자 결과]");
		System.out.println("더하기: "+(a+b));
		System.out.println("빼기: "+(a-b));
		System.out.println("곱하기: "+(a*b));
		System.out.println("나누기: "+(double)a/b);
		System.out.println("나머지값: "+(a%b));
		
	}

}
