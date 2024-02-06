package day0115;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

public class SetRandom_06 {

	public static void main(String[] args) {
		// Set, random 이용해서 1~45중의 서로 다른 난수 6개
		
		Random r=new Random();
		Set<Integer> set=new HashSet<Integer>();
		
		while(true) {
			int n=r.nextInt(45)+1;
			set.add(n);
			
			if(set.size()==6)
				break;
		}
		
		System.out.println("출력_#1");
		for(int n:set)
			System.out.printf("%5d",n);
		System.out.println();
		
		System.out.println("출력_#2");
		Iterator<Integer> inter=set.iterator();
		while(inter.hasNext()) {
			System.out.printf("%5d", inter.next());
		}
		System.out.println();
		
		System.out.println("출력_#3");
		Object[] ob=set.toArray();
		Arrays.sort(ob); //배열값 오름차순
		for(int i=0;i<ob.length;i++) {
			System.out.printf("%5d", ob[i]);
		}
	

	}

}
