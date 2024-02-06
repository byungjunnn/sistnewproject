package day0109;

import java.util.Scanner;

public class WhileReview_03 {

	public static void main(String[] args) {
		/*
		 * 반복적으로 나이를 입력, 0이 되면 종료
		 * 나이가 50세 이상이면 a변수 증가
		 * 나이가 30세 이상이면 b변수 증가
		 * 그 이외에는 c변수 증가
		 * 
		 * 빠져나온 후 출력내용
		 * 50세 이상: 3명
		 * 30세 이상: 2명
		 * 그외: 3명
		 */

		Scanner sc=new Scanner(System.in);
		int age;
		int a=0, b=0, c=0;

		while(true) {
			System.out.println("나이 입력");
			age=sc.nextInt();
			
			if(age==0) {
				System.out.println("종료");
				break;
			}

			if(age>=50)
				a++;
			else if(age>=30)
				b++;
			else
				c++;
		}
		System.out.println("50세 이상: "+a+"명");
		System.out.println("30세 이상: "+b+"명");
		System.out.println("그외: "+c+"명");

	}

}
