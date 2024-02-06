package day0116;

//익명 내부클래스: 클래스 선언과 객체생성을 동시에 하는 이름없는 클래스(일회용)
//이벤트 발생시 생성했다가 끝나면 메모리에서 사라짐(메모리 효율적 관리가 쉬움)

abstract class AbstEx{
	
	abstract public void draw();
}
//////////////////////////////
class OuterEx{
	
	AbstEx ab=new AbstEx() {
		
		@Override
		public void draw() {
			// TODO Auto-generated method stub
			System.out.println("익명내부 클래스");
		}
	};
}
//////////////////////////////
public class Anonymous_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		OuterEx ex=new OuterEx();
		ex.ab.draw();
	}

}
