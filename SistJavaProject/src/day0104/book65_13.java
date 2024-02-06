package day0104;

public class book65_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 문자열을 기본 타입의 값으로 변환
		int value1=Integer.parseInt("10");
		double value2=Double.parseDouble("3.14");
		boolean value3=Boolean.parseBoolean("true");
		
		System.out.println("value: "+value1);
		System.out.println("value: "+value2);
		System.out.println("value: "+value3);
		
		// 기본 타입의 값을 문자열로 변환
		String str1=String.valueOf(10);
		String str2=String.valueOf(3.14);
		String str3=String.valueOf(true);
		
		System.out.println("str1: "+str1);
		System.out.println("str2: "+str2);
		System.out.println("str3: "+str3);
		
	}

}
