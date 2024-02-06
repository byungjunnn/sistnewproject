package day0105;

import java.util.Calendar;
import java.util.Scanner;

public class QuizMyAgeInOut_02 {

	public static void main(String[] args) {
		/*
		 * 당신의 이름은?==>이수연
		 * 당신이 태어난 연도==>1988
		 * 당신이 사는 지역은?==>경기
		 * 
		 * ==================
		 * [이수연 님의 개인정보]
		 * ==================
		 * 이름: 이수연
		 * 태어난년도: 1988
		 * 나이: 세
		 * 지역: 경기
		 */
		//1.import
		Calendar cal=Calendar.getInstance();
		Scanner sc=new Scanner(System.in);
		
		//2.변수
		String name, city;
		int year, curYear, age;
		
		//3.입력
		System.out.print("당신의 이름은?==>");
		name=sc.nextLine();
		System.out.print("당신이 태어난 연도==>");
		year=Integer.parseInt(sc.nextLine()); // String이 int가 됨
		//sc.nextline()은 키보드의 버퍼나 엔터를 먼저 읽어서 없애준다
		System.out.print("당신이 사는 지역은?==>");
		city=sc.nextLine();
		System.out.println();
		
		//4.계산
		curYear=cal.get(cal.YEAR); //2024 반환
		age=curYear-year;
		
		//5.결과출력
		System.out.println("================");
		System.out.println("["+name+" 님의 개인정보]");
		System.out.println("================");
		System.out.println("이름: "+name);
		System.out.println("태어난년도: "+year);
		System.out.println("나이: "+age+"세");
		System.out.println("지역: "+city);
		
	}

}
