package day0111;

class MyInfo{
	private String name;
	private String mbti;
	private int age;
	//명시적 생성자
	public MyInfo(String name, String mbti, int age) {
		this.name=name;
		this.mbti=mbti;
		this.age=age;
	}
	
	public static void MyInfoTitle() { //static매서드는 생성 필요x, 인스턴스매서드는 생성해줘야 사용가능
		System.out.println("이름\tMBTI\t나이");
	}
	
	public void MyInfoShow() {
		System.out.println(name+"\t"+mbti+"\t"+age+"세");
	}
}
public class QuizArrObTest_12 {

	public static void main(String[] args) {
		
		MyInfo[] info= {
				new MyInfo("이효리", "ENTP", 26),
				new MyInfo("이상순", "INFJ", 35),
				new MyInfo("이영자", "ENFJ", 29)
		};
		MyInfo.MyInfoTitle();
		System.out.println("----------------------");
		for(int i=0;i<info.length;i++) {
			info[i].MyInfoShow();
		}
	}

}
