package day0108;

public class For_09 {

	public static void main(String[] args) {
		// 가로로 1~10까지 출력
		for(int a=1;a<=10;a++)
			System.out.print(a+" ");
		//10~1까지 출력
		System.out.println();
		for(int a=10;a>=1;a--)
			System.out.print(a+" ");
		System.out.println();
		//5씩 증가
		for(int a=0;a<=50;a+=5)
			System.out.print(a+" ");
		System.out.println();
		
		// continue
		for(int a=1;a<=20;a++) {
			//5의 배수는 제외하고 출력
			if(a%5==0)
				continue; //continue아래 문장은 수행하지 않고 a++로 이동
			System.out.print(a+" ");
		}
		
	}

}
