package day0104;

public class QuizDataType_10 {

	public static void main(String[] args) {
		// 변수는 args를 이용할 것
		/* 
		 * 학생명: 김선호 님
		 * 지역: 부산
		 * 나이: 23 세
		 * 
		 * ==============================================
		 * 김선호님의 자바점수는 88점 오라클 점수는 77점 총 165점입니다
		 * 
		 * */
		//1.변수선언
		String name=args[0];
		String city=args[1];
		String age=args[2];
		int java=Integer.parseInt(args[3]);
		int oracle=Integer.parseInt(args[4]);
		
		//2.계산
		int tot=java+oracle;
		
		//3.출력
		System.out.printf("학생명: %s 님\n지역: %s \n나이: %s세\n", name, city, age);
		System.out.println("=====================================");
		System.out.printf("%s님의 자바점수는 %d점 오라클 점수는 %d점 총 %d점입니다", name, java, oracle, tot);

		
	}

}
