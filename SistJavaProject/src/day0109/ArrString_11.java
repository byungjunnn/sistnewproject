package day0109;

public class ArrString_11 {

	public static void main(String[] args) {
		// 문자열 배열
		String[] str1= {"텀블러","키보드","핸드폰","칫솔","우산"};
		String[] strColors= {"red","pink","blue","yellow","gray","white"};
		
		//str1은 1번째: 텀블러
		System.out.println("str1_출력1_for");
		for(int a=0;a<str1.length;a++)
			System.out.println(a+"번째: "+str1[a]);
		
		System.out.println("str1_출력2_foreach");
		for(String a1:str1)
			System.out.println(a1);
		
		//strColors 0번지색: red
		System.out.println("strColors_출력1_for");
		for(int i=0;i<strColors.length;i++)
			System.out.println(i+"번지색: "+strColors[i]);
		
		System.out.println("strColors_출력2_foreach");
		for(String i1:strColors)
			System.out.println(i1);		
	}

}
