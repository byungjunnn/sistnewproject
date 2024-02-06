package day0110;

class Mart{
	private String sangpum;
	int su;
	int dan;
	static String SHOPNAME="롯데마트"; //상수

	//sangpum은 메서드가 아니면 다른 클래스에서 접근불가
	//su, dan은 private이 아니므로 다른 클래스에서 생성시 변수접근 가능
	//static은 다른 클래스에서 접근시 클래스명.변수명 으로 접근 가능
	
	public void setSangpum(String sangpum) {
		this.sangpum=sangpum;
	}
	public void setShopname(String SHOPNAME) {
		this.SHOPNAME=SHOPNAME;
	}
	public String getSangpum() {
		return sangpum;
	}
	public String getShopname() {
		return SHOPNAME;
	}
}
public class QuizClass_16 {

	public static void main(String[] args) {
		
		Mart m1=new Mart();
		m1.setSangpum("쵸코파이");
		m1.su=10;
		m1.dan=4500;
		
		Mart m2=new Mart();
		m2.setSangpum("엄마손파이");
		m2.su=5;
		m2.dan=2500;
		
//		Mart m1=new Mart("쵸코파이", 10, 4500, "롯데마트");
//		String sangpum=m1.getSangpum();
//		int su=m1.getSu();
//		int dan=m1.getDan();
//		String SHOPNAME=m1.getShopname();
//		
//		Mart m2=new Mart("엄마손파이", 5, 2500, "롯데마트");
//		String sangpum2=m2.getSangpum();
//		int su2=m2.getSu();
//		int dan2=m2.getDan();
//		String SHOPNAME2=m2.getShopname();
		
		System.out.println("**"+Mart.SHOPNAME+"입고상품**");
		System.out.println("===================");
		System.out.println("상품명: "+m1.getSangpum());
		System.out.println("수량: "+m1.su+"개");
		System.out.println("가격: "+m1.dan+"원");
		System.out.println("===================");
		System.out.println("상품명: "+m2.getSangpum());
		System.out.println("수량: "+m2.su+"개");
		System.out.println("가격: "+m2.dan+"원");
	}

}
