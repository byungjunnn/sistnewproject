package day0108;

import java.util.Scanner;

public class Quiz_18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//quiz_1();
		quiz_2();
		
	}
	public static void quiz_1() {
	
		/*Q. 반복해서 숫자를 입력하여 양수의 갯수와 음수의 갯수를 구하시오(0입력시 종료)
		 * while문은 break필요 , range가 없으므로 while 사용
		 * range가 정해져 있으면 for 문 사용(continue에서 --로 갯수를 빼야함-> 바로 증감식으로 이동하여)
		 * 6
		 * -10
		 * 88
		 * 120
		 * -130
		 * 0
		 * 양수의 갯수: 3개
		 * 음수의 갯수: 2개
		 */
		Scanner sc=new Scanner(System.in);
		int num;
		int pcnt=0;
		int mcnt=0;
		
		while(true) {
			System.out.print("숫자 입력");
			num=sc.nextInt();
			//먼저 break부터 하는 것이 좋음
			if(num==0) {
				System.out.println("종료");
				break;
			}
			if(num>0)
				pcnt++;
			else
				mcnt++;
		}
		System.out.println("양수의 갯수: "+pcnt+"개");
		System.out.println("음수의 갯수: "+mcnt+"개");
		
	}
	public static void quiz_2() {
		//반복해서 점수를 입력하고 (1~100) 0을 입력시 빠져나와 총 갯수와 합계와 평균을 구하시오
		//범위에 맞지않는 점수는 횟수에서 제외되어야 한다
		Scanner sc=new Scanner(System.in);
		int score;
		int cnt = 0, sum=0;
		double avg; //sum으로 구하기 때문에 초기값 없어도 됨
		
		while(true) {
			System.out.print("점수 입력 ");
			score=sc.nextInt();
			
			if(score==0)
				break;
			
			if(score<1 || score>100) {
				System.out.println("잘못 입력하였습니다");
				continue;
			}
			cnt++;
			sum+=score;
		}
		avg=sum/cnt;
		System.out.println("총갯수: "+cnt);
		System.out.println("합계: "+sum);
		System.out.println("평균: "+avg);
	}
		
}
