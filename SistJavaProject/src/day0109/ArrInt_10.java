package day0109;

public class ArrInt_10 {

	public static void main(String[] args) {
		// 배열선언과 동시에 초기값 지정할 수 있다
		
		int[] arr= {2,3,9,8,7,14,65,52,32};
		
		System.out.println("갯수: "+arr.length);
		
		System.out.println("출력1_for");
		for(int a1=0;a1<arr.length;a1++)
			System.out.print(arr[a1]+" ");
		System.out.println();
		
		System.out.println("출력1_foreach");
		for(int a2:arr)
			System.out.print(a2+" ");
	}

}
