package day0105;

import java.util.Scanner;

public class QuizOper_20 {

	public static void main(String[] args) {
		/*
		 * (상품을 5개 이상 구매시 10% 할인하여 계산된다)
		 * 상품명: 키보드
		 * 수량: 5
		 * 가격: 20000
		 * 
		 * ====================
		 * **5개 이상 구매시 10% 할인됩니다
		 * 키보드 5개는 총 90000원 입니다
		 * 할인된 금액: 10000원
		 * 
		 */
		Scanner sc=new Scanner(System.in);
		
		String name;
		int count, price;
		int tot, sale=0;
		
		
		System.out.print("상품명: ");
		name=sc.nextLine();
		System.out.print("수량: ");
		count=sc.nextInt();
		System.out.print("가격: ");
		price=sc.nextInt();
		System.out.println();
		
		tot=count*price;
		if(count>=5)
			sale=tot/10;
		
		System.out.println("=========================");
		System.out.println(name+" "+count+"개는 총 "+(tot-sale)+"원 입니다");
		System.out.println("할인된 금액: "+sale+"원");
		
	}

}
