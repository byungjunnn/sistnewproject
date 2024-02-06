package day0109;

public class StringEx_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("String 객체에 대한 메서드 익혀보기");
		
		String str1="apple";
		String str2="Apple";
		String str3="Have a Nice Day";
		String str4="  Today Now  ";
		
		System.out.println("str3의 길이: "+str3.length());
		System.out.println("str4의 길이: "+str4.length());
		
		System.out.println("앞뒤 공백 제거 후 str4의 길이: "+str4.trim().length());
		System.out.println("*"+str4.trim()+"*");
		
		System.out.println("str3에서 0번 문자: "+str3.charAt(0));
		System.out.println("str3에서 7번 문자: "+str3.charAt(7));
		
		System.out.println("str3의 H의 인덱스: "+str3.indexOf('H'));
		System.out.println("str3의 H의 인덱스: "+str3.indexOf('N'));
		
		System.out.println("str3에서 Have 추출: "+str3.substring(0,4));
		System.out.println("str3에서 Nice 추출: "+str3.substring(7,11)); //index시작번호, 끝번호
		System.out.println("str3에서 Nice부터 끝까지: "+str3.substring(7)); //index번호부터 끝까지

		//equals는 같으면 true, 다르면 false
		System.out.println("문자열 비교: "+str1.equals(str2));
		System.out.println("문자열 비교: "+str1.equalsIgnoreCase(str2));
		
		//a.compareTo(b)
		//a와 b가 같으면 0
		//a가 작을 경우 -값
		//a가 클 경우 +값
		System.out.println(str1.compareTo(str2));
		System.out.println(str1.compareTo(str1));
		System.out.println("computer".compareTo("command")); //com 다음의 p와 m비교
		
	}

}
