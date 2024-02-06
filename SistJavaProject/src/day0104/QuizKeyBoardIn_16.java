package day0104;

import java.util.Scanner;

public class QuizKeyBoardIn_16 {

	public static void main(String[] args) {
		/*
		 * 상품명을 입력하세요==>아이폰15
		 * 가격은 얼마입니까?==>1200000
		 * 수량은 몇개입니까?==>5
		 * 
		 * 상품입고
		 * ======================
		 * 입고상품명: 아이폰15
		 * 수량: 5개
		 * 가격: 1200000원
		 * ======================
		 * 총가격: 6000000원
		 * 
		 */
		//1.import
		Scanner sc=new Scanner(System.in);
		
		//2.변수
		String iphone;
		int price, count, tot;
		
		//3.입력
		System.out.print("상품명을 입력하세요==>");
		iphone=sc.nextLine();
		System.out.print("가격은 얼마입니까?==>");
		price=sc.nextInt();
		System.out.print("수량은 몇개입니까==>");
		count=sc.nextInt();
		System.out.println();
		
		//4.계산
		tot=price*count;
		
		//5.최종출력
		System.out.println("상품입고");
		System.out.println("=====================");
		System.out.println("입고상품명: "+iphone);
		System.out.println("수량: "+count+"개");
		System.out.println("가격: "+price+"원");
		System.out.println("=====================");
		System.out.println("총가격: "+tot+"원");
		
	}

}
