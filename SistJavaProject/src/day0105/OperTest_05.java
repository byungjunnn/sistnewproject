package day0105;

public class OperTest_05 {

	public static void main(String[] args) {
		// 비교연산자(관계연산자) >, <, >=, <=, !=, ==
		// 논리연산자 &&(and), ||(or), !(not)
		
		int a=5, b=3, c=5;
		
		//결과값은 true, false
		
		System.out.println(a>b);
		System.out.println(a==b);
		System.out.println(!(a==b));
		System.out.println(a!=b);
		System.out.println(a>b&&b>c); //&&는 모든 조건을 만족해야 true
		System.out.println(a>b||b>c); //||는 하나만 만족해도 true
		
		boolean bool=false;
		System.out.println("a="+bool);
		System.out.println("b="+!bool);
		
		boolean bool2=5>3;
		
		System.out.println("c="+bool2);
		System.out.println("b="+!bool2);
		System.out.println("e="+!(5>3));
		
	}

}
