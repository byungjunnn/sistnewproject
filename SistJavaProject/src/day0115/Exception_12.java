package day0115;

public class Exception_12 {

	public static void main(String[] args) {
		// 
		
		System.out.println("프로그램 시작");
		try {//예외가 발생할 수 있는 코드
			int num=3/0; //정수를 0으로 나누면 나오는 에러
		}catch (ArithmeticException e) {
			// 예외처리 코드
		}
		System.out.println("프로그램 종료");

	}

}
