package day0112;

interface InterA{
	public void singasong();
	public void draw();
}
////////////////////////////
interface InterB{
//interface InterB extends InterA{
	public void playgame();
	public void write();
}
///////////////////////////
class Imple implements InterA, InterB{

	@Override
	public void playgame() {
		System.out.println("게임을 하자");
	}

	@Override
	public void write() {
		System.out.println("공부를 하자");
	}

	@Override
	public void singasong() {
		System.out.println("노래를 하자");
	}

	@Override
	public void draw() {
		System.out.println("그림을 그리자");
	}
}
///////////////////////////
public class InterImpl_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//하위클래스 생성
//		Imple im=new Imple();
//		im.singasong();
//		im.draw();
//		im.playgame();
//		im.write();
		//다형성 생성
//		InterB inb=new Imple();
		
		//다형성, 다중
		InterA inter1;
		InterB inter2;
		
		inter1=new Imple();
		inter1.draw();
		inter1.singasong();
		
		inter2=new Imple();
		inter2.playgame();
		inter2.write();
		
		
	}
}
