package day0112;

class Shop{
	
	private String sName;
	private String sPrice;
	private String sColor;
	
	static int num;
	
	public Shop(String sName, String sPrice, String sColor) {
		this.sName=sName;
		this.sPrice=sPrice;
		this.sColor=sColor;
	}
	
	public static void getsTitle() {
		System.out.println("[쌍용매장 입고상품]");
		System.out.print("번호\t상품명\t가격\t색상\n");
		System.out.println("===========================");
	}
	
	public void getsInfo() {
		num++;
		System.out.println(num+"\t"+sName+"\t"+sPrice+"\t"+sColor);
	}
}

public class ArrReview_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Shop[] s= {
				new Shop("요가매트", "25000", "핑크"),
				new Shop("아령", "30000", "블랙"),
				new Shop("레깅스", "45000", "베이지"),
				new Shop("나시", "22000", "화이트"),
		};
		//for문
		Shop.getsTitle(); //제목 출력
		for(int i=0;i<s.length;i++) {
			s[i].getsInfo();
		}
		//for~each문
//		for(Shop s1:s) {
//			s1.getsInfo();
//		}
	}
}
