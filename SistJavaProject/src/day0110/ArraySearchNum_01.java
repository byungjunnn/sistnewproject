package day0110;

import java.util.Scanner;

public class ArraySearchNum_01 {

	public static void main(String[] args) {
		// 배열 중에서 숫자를 입력하여 찾기
		// 있는지 찾기, 없으면 없다고 표시, 있으면 몇 번째에 있는지 출력
		// 0 입력시 종료

		int[] data= {68,13,2,6,8,53,99,15,78,54};

		boolean flag;
		int su;
		Scanner sc=new Scanner(System.in);

		while(true) {
			System.out.println("검색할 숫자 입력");
			su=sc.nextInt();

			//0입력시 종료
			if(su==0) {
				System.out.println("프로그램 종료");
				break;
			}

			flag=false;

			//값 찾기
			for(int i=0;i<data.length;i++) {
				if(su==data[i]) {
					flag=true;
					System.out.println((i)+"번째에서 검색");
				}
			}
			if(!flag) //flag==false
				System.out.println(su+"은 데이터에 없습니다");
		}

	}

}
