package day0108;

public class For_07 {

	public static void main(String[] args) {
		// while 문과 for 문 비교
		System.out.println("**while문으로 10~0출력**");
		int i=10;
		
		while(i>=0) {
			System.out.print(i--+" ");
		}
		System.out.println();
		
		System.out.println("**for문으로 10~0출력**");
		for(int a=10;a>=0;a--) {
			System.out.print(a+" ");
		}
		System.out.println();
		System.out.println("**for문으로 1~10 종료**");
		for(int a=1;a<=10;a++)
			System.out.print(a+" ");
			System.out.println("종료");
		
		
		System.out.println("**while문으로 1~10 종료**");
		int n=1;
		while(true) {
			System.out.print(n+++" ");
			if(n>10)
				break;
		}
		System.out.println("종료");
		
		System.out.println("**for문으로 1, 4, 7, 10**");
		for(int b=1;b<=10;b+=3) {
			System.out.print(b+" ");
		}
		System.out.println();
		System.out.println("**for문으로 5, 4, 3, 2, 1**");
		for(int c=5;c>=1;c--)
			System.out.print(c+" ");
		System.out.println();
		
		System.out.println("**while문으로 5, 4, 3, 2, 1**");
		int m=5;
		while(m>0) {
			System.out.print(m--+" ");
		}
		System.out.println();
		System.out.println("**for문으로 HelloJava 5번 반복**");
		int d;//변수를 for 문 밖에서도 사용하고 싶은 경우
		for(d=1;d<=5;d++)
			System.out.print("HelloJava"+" ");
	}

}
