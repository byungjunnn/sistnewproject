package day0110;

class Info{
	
	private String stuName;
	private int stuAge;
	
	//setter메서드
	//1.데이터를 수정할 목적_set변수명
	//2.저장용도이므로 결과값return값이 없다
	//3.리턴값이 없으므로 void라고 지정해야 됨
	public void setName(String stuName) {
		this.stuName=stuName; //이름이 다를 경우엔 this 생략 가능
	}
	public void setAge(int stuAge) {
		this.stuAge=stuAge;
	}
	//getter메서드
	//1.데이터를 조회할 목적 _get변수명
	//2.데이터를 얻는 목적이므로 인자값 없음
	//3.실행결과값을 돌려주므로 return결과값으로 지정
	public String getName() {
		return stuName;
	}
	public int getAge() {
		return stuAge;
	}
}

public class WokerMethod_12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Info in1=new Info();
		//in1.stuName="홍길동"; 인스턴스변수에 private이 붙으면 변수접근이 안된다(생성해도)
		//in1.stuAge=33;
		
		//setter메서드 이용 값 수정
		in1.setName("최민영");
		in1.setAge(22);
		
		//getter메서드 이용 값 얻기
//		String name=in1.getName();
//		int age=in1.getAge();
//		System.out.println(name+","+age);
		in1.getName();
		System.out.println(in1.getName());
		System.out.println(in1.getAge());
		
	}

}
