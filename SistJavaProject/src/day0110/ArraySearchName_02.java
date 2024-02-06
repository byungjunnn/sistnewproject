package day0110;

import java.util.Scanner;

public class ArraySearchName_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] name= {"홍길동","김길동","최길동","김재석","유재석","홍재석","강호동","이호동","유호동","최호동"};

		boolean flag;
		String na;
		Scanner sc=new Scanner(System.in);

		while(true) {
			System.out.println("이름을 입력하세요");
			na=sc.nextLine();

			if(na.equalsIgnoreCase("끝")) {
				System.out.println("종료");
				break;
			}
			flag=false;

			for(int i=0;i<name.length;i++) {
				if(na.equals(name[i])) {
					flag=true;
					System.out.println(i+"번째 이름");
				}
			}
			if(!flag) {
				System.out.println(na+" 이름은 없습니다");
			}

		}
	}

}
