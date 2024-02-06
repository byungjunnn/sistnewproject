package day0104;

import java.util.Scanner;

public class KeyBoardIn_140 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		
		System.out.println("이름을 입력하세요");
		String name=sc.nextLine();
		System.out.println("나이를 입력하세요");
//		int age=sc.nextInt();
		int age=Integer.parseInt(sc.nextLine());
		System.out.println("거주지를 입력하세요");
		String city=sc.nextLine();
		
		System.out.println(name+"님의 나이는 "+age+"이고, 거주지는 "+city+" 입니다");
		
	}

}
