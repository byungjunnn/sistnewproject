package day0112;
//부모클래스
class Car{

	private String carCompany;
	private String carKind;

	public Car() {
		this("현대", "전기차");
	}
	public Car(String carCompany, String carKind) {
		this.carCompany=carCompany;
		this.carKind=carKind;

	}
	public String getCarCompany() {
		return carCompany;
	}
	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}
	public String getCarKind() {
		return carKind;
	}
	public void setCarKind(String carKind) {
		this.carKind = carKind;
	}

	public void writeData() {
		System.out.println("회사명: "+carCompany);
		System.out.println("종류: "+carKind);

	}
}
//////////////////////////////
class MyCar extends Car{

	private String carName;
	private String carColor;
	private int carPrice;

	public MyCar() {
	}
	public MyCar(String cCom, String cK, String cN, String cCol, int cP) {
		super(cCom, cK);
		this.carName=cN;
		this.carColor=cCol;
		this.carPrice=cP;
	}

	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public int getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
	@Override
	public void writeData() {
		super.writeData();
		System.out.println("자동차명: "+carName);
		System.out.println("색상: "+carColor);
		System.out.println("가격: "+carPrice);
	}
}

public class Inherit_08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyCar c=new MyCar();
		c.setCarName("아이오닉");
		c.setCarColor("블랙");
		c.setCarPrice(35000000);
		System.out.println("**디폴트 생성자로 생성**");
		c.writeData();
		System.out.println();

		MyCar c1=new MyCar("기아", "가솔린", "코나", "화이트", 25000000);
		System.out.println("**명시적 생성자로 생성**");
		c1.writeData();

		System.out.println();
		System.out.println("**부모클래스로 생성**");
		Car c2=new Car();
		c2.writeData();
	}
}
