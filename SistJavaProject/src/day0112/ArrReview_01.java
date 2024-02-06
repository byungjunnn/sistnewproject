package day0112;

class Food{
	
	private String fName;
	private int fPrice;
	
	static int no;
	
	//명시적 생성자(2개)
	public Food(String fName, int fPrice) {
		this.fName=fName;
		this.fPrice=fPrice;
	}
	
	//출력문
	public void fView() {
		no++;
		System.out.println("[메뉴_"+no+"]");
		System.out.println("음식명: "+fName);
		System.out.println("가격: "+fPrice);
		System.out.println("-----------------------");
	} 
}
///////////////////////////
public class ArrReview_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		Food f1=new Food("마르게리타 피자", 12000);
//		f1.fView();
//		Food f2=new Food("까르보나라 스파게티", 15000);
//		f2.fView();
//		Food f3=new Food("리코타 샐러드", 9000);
//		f3.fView();
		
		//배열 사용할 경우
		//배열선언 및 초기화
		Food[] food= {
				new Food("마르게리타 피자", 12000),
				new Food("까르보나라 스파게티", 15000),
				new Food("리코타 샐러드", 9000)
		};
		//for문 이용
		for(int i=0;i<food.length;i++) {
//			Food f=food[i];
//			f.fView();
			food[i].fView();
		}
		//for~each문 이용
////		for(Food f:food) {
////			f.fView();
//		}
		
	}

}
