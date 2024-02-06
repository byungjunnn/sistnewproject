package day0104;

public class QuizDataType_14 {

	public static void main(String[] args) {
		// 실행단계에서(args 이용) 상품명, 단가를 입력한 후 다음과 같이 출력하세요
		/* 
		 * 상품명: 아이폰15
		 * 수량:2개
		 * 단가:1200000원
		 * 총금액:2400000원
		 * */
		//1.변수선언
		String hp=args[0];
		int count=Integer.parseInt(args[1]); //계산할 값은 기본형으로 변환
		int price=Integer.parseInt(args[2]);
		
		//2.계산
		int tot=price*count; //; 꼭 붙히기
				
		//3.출력
		System.out.println("상품명: "+hp);
		System.out.println("수량: "+count+"개");
		System.out.println("단가: "+price+"원");
		System.out.println("총금액: "+tot+"원");
		
	}

}
