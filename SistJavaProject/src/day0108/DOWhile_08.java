package day0108;

public class DOWhile_08 {

	public static void main(String[] args) {
		//선조건 후조건 차이
		
		int n=1;
		System.out.println("**While문 결과**");
		while(n<5) { // 조건이 맞지 않으면 한 번도 출력이 안될 수 있다
			//System.out.println(n++); 출력 후 n 증가
			System.out.println(n);
			n++;
		}

		System.out.println("**do~While문 결과**");
		
		n=1;
		do { // 조건이 맞지 않아도 do부분 먼저 실행되므로 1번은 수행
			System.out.println(n++);
		} while(n<=5);
		
	}

}
