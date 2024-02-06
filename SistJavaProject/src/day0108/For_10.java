package day0108;

public class For_10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i;
		for(i=1;i<=10;i++) {
			System.out.print(i+" ");
		}
		System.out.println("\nfor문 빠져나온 i의 값: "+i);
		
		int a=10;
		for(;a<=50;a+=5)
			System.out.print(a+" ");
		System.out.println("\n빠져나온 a값: "+a);
		
		System.out.println("1~10까지 숫자 중에서 짝수만 출력");
		for(int b=1;b<=10;b++) {
			if(b%2==0)
				System.out.print(b+" ");
		}
		System.out.println();
		System.out.println("1~10까지 숫자 중에서 짝수만 출력_continue");
		
		for(int c=1;c<=10;c++) {
			if(c%2==1)
				continue; //조건 맞을 시 스킵하고 증감식으로
			System.out.print(c+" ");
		}
	}
	

}
