package day0111;

class Shop{
	private String sangpum;
	private int price;
	private String sangColor;
	
	//명시적 생성자
	public Shop(String s, int p, String c) {
		sangpum=s;
		price=p;
		sangColor=c;
	}

	//제목
	public static void showTitle() {
		System.out.println("상품명\t가격\t색상");
		System.out.println("=========================");
	}
	//생성한 갯수만큼 출력 메서드
	public void showShop() {
		System.out.println(sangpum+"\t"+price+"원\t"+sangColor);
	}
}
public class ArrObTest_11 {

	public static void main(String[] args) {
		// 4개 생성해서 출력
		Shop[] shop = {
				new Shop("갤럭시", 1000, "블랙"),
				new Shop("아이폰", 500, "화이트"),
				new Shop("컴퓨터", 1500, "레드"),
				new Shop("노트북", 2500, "블루")
		};
		//출력
		System.out.println("출력1");// for
		Shop.showTitle();
		for(int i=0;i<shop.length;i++) {
			shop[i].showShop();
		}
		System.out.println("==================================");

		System.out.println("출력2"); //for each
		Shop.showTitle();
		for(Shop s1:shop) {
			s1.showShop();
		}
	}
}