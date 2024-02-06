package day0108;

public class SumTest_11 {

	public static void main(String[] args) {
		// 반복문 안에서 합계 구하기
		
		int sum=0; //sum은 초기값이 무조건 0
		
		for(int i=1;i<=10;i++) {			
			sum+=i; //sum=sum+i
		}
		System.out.println("1~10까지의 합: "+sum+"입니다");

		//while
		int n=1;
		int tot=0;
		
		while(n<=10) {
			tot+=n; //합계변수 tot에 n을 누적시킴
			n++; //증감식 추가
		}
		System.out.println("1~10까지의 합: "+tot+"입니다");
		
		System.out.println("1~10까지 중 2씩 증가할 경우의 합계를 구하시오");
		
		int total=0;
		for(int i=1;i<=10;i+=2) {
			total+=i;
		}
		System.out.println("총합계는 "+tot);
		
			
	}  
		 
}
