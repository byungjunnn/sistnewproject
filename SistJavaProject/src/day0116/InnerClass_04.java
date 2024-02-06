package day0116;

class OuterObj{
	
	public void disp() {
		System.out.println("외부 클래스의 disp메서드");
		System.out.println("외부클래스 메서드에서 내부클래스의 메서드 호출");
		
		innerbObj inObj=new innerbObj();
		inObj.write();
		
		
	}
	
	//outer에서만 기능
	class innerbObj{
		
		public void write() {
			System.out.println("내부 클래스의 write메서드");
		}
	}
}

public class InnerClass_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		OuterObj outObj=new OuterObj();
		outObj.disp();
		System.out.println("--------------------------");
		
		//내부클래스는 외부클래스를 통해서만 생성가능
//		OuterObj.innerObj obj=new OuterObj().new innerObj;
		OuterObj.innerbObj obj=outObj.new innerbObj();
		obj.write();
	}

}