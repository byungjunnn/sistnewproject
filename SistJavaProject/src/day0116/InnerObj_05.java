package day0116;

class Outer{
	
	String name="조혜영";
	int age=22;
	
	//멤버 내부1
	class Inner1{
		
		//내부클래스에서는 외부클래스의 멤버변수 사용 가능
		public void disp() {
			System.out.println("**Inner1 내부클래스**");
			System.out.println("이름: "+name+", 나이: "+age+"세");
		}
	}
	//멤버 내부2
	class Inner2{
		
		public void disp2() {
			System.out.println("**Inner2 내부클래스**");
			System.out.println("이름: "+name+", 나이: "+age+"세");
		}
	}
	
	//외부클래스의 메서드
	public void write() {
		//외부클래스 메서드에서 내부클래스 인스턴스 생성 및 메서드 호출
		Inner1 in1=new Inner1();
		in1.disp();
		
		Inner2 in2=new Inner2();
		in2.disp2();
	}
}

public class InnerObj_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//외부클래스의 생성
		Outer out=new Outer();
		out.write();
		
		System.out.println("---------------------------------------------");
		System.out.println("다른 클래스에서 외부클래스를 통하지 않고 직접 내부클래스 메서드 호출");
		
		Outer.Inner1 in1=new Outer().new Inner1();
		in1.disp();
		
		Outer.Inner2 in2=out.new Inner2();
		in2.disp2();
	}

}
