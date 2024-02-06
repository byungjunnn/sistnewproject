package day0115;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ShopArrayList {

	List<Shop> shop=new ArrayList<Shop>();

	public void ipgo() {
		Scanner sc=new Scanner(System.in);

		System.out.println("상품명");
		String sangName=sc.nextLine();
		System.out.println("가격");
		int su=sc.nextInt();
		System.out.println("수량");
		int dan=sc.nextInt();

		Shop s=new Shop();
		s.setSangName(sangName);
		s.setDan(dan);
		s.setSu(su);

		shop.add(s);
		System.out.println(shop.size()+"개의 상품을 입고했어요!!");
	}

	public void jego() {
		System.out.println("**상품 재고 현황**");
		System.out.println();
		System.out.println("번호\t상품명\t가격\t수량\t총액");
		System.out.println("=================================");
		for(int i=0;i<shop.size();i++) {
			Shop sh=shop.get(i);
			System.out.println((i+1)+"\t"+sh.getSangName()+"\t"+sh.getDan()
			+"\t"+sh.getSu()+"\t"+sh.getTot());
			System.out.println("---------------------------------------------");
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ShopArrayList sa=new ShopArrayList();

		Scanner sc=new Scanner(System.in);
		int num;

		while(true) {
			System.out.println("1. 상품입고   2.재고현황   9.종료");
			num=Integer.parseInt(sc.nextLine());

			if(num==1)
				sa.ipgo();
			else if(num==2)
				sa.jego();
			else if(num==9) {
				System.out.println("종료합니다");
				break;
			}
		}
	}

}
