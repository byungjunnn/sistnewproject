package day0110;

public class ObjectEx_07 {
	String name; //인스턴스 멤버변수.. 반드시 객체생성 후 사용 가능
	static final String MESSAGE="Happy day"; //static멤버변수.. 주로 상수로 선언
	//객체생성없이 바로 클래스명으로 접근가능
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("static 멤버변수는 new생성없이 호출가능");
		System.out.println(MESSAGE); //다른 클래스에서는 클래스명.변수명으로 가져와야함
		//MESSAGE="Nicc day!!"; final은 값 변경 안됨
		
		//인스턴스 변수는 객체생성 무조건
		ObjectEx_07 ob7=new ObjectEx_07();
		System.out.println(ob7.name);//class에서 변수는 자동초기화
		
		ob7.name="홍길동";
		System.out.println(ob7.name);
		
		ObjectEx_07 ob8=new ObjectEx_07();
		ob8.name="이효리";
		System.out.println(ob8.name);
		
		
		
	}

}
