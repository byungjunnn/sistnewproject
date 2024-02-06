package day0112;

//interface는 상수와 추상메서드만 가질 수 있음
//class가 class를 : extends
//class가 interface를 : implement
//interface가 interface를 : extends

interface FoodShop{
	
	String SHOPNAME="남소관"; //final이 있는 것이 당연. 생략됨
	
	public void order(); //abstract을 안 해줘도 추상메서드로 인식. 구현부 없음
	public void bedal();
}
////////////////////////
//클래스끼리는 상속 가능
class Food2 implements FoodShop{

	@Override
	public void order() {
//		SHOPNAME="왕돈까스"; final 없어도 상수로 인식하여 수정 안됨
		System.out.println("음식을 주문합니다");
	}

	@Override
	public void bedal() {
		System.out.println("음식을 배달합니다");
	}
	
}
/////////////////////
class Food3 implements FoodShop{

	@Override
	public void order() {
		System.out.println("키오스크 주문");
	}

	@Override
	public void bedal() {
		System.out.println("쿠팡이츠 배달");
	}
}
public class Implement_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FoodShop fs;
		
		fs=new Food2();
		fs.order();
		fs.bedal();
		
		fs=new Food3();
		fs.order();
		fs.bedal();
	}

}
