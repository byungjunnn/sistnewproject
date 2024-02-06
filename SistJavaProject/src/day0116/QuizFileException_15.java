package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizFileException_15 {

	public static void fileRead() {
		String fName="C:\\sist0103\\file\\fruitshop.txt";
		FileReader fr=null;
		BufferedReader br=null;
		
		try {
			fr=new FileReader(fName);
			br=new BufferedReader(fr);
			
			System.out.println("\t   **과일입고목록**");
			System.out.println();
			System.out.println("번호\t과일명\t수량\t단가\t총금액");
			System.out.println("---------------------------------------");
			
			int num=0;
			int total=0;
			
			while(true) {
				String s=br.readLine();
				
				if(s==null)
					break;
				//spit 사용 분리
//				String[] data=s.split(",");
//				total=Integer.parseInt(data[1])*Integer.parseInt(data[2]);
//				System.out.println(num+"\t"+data[0]+"\t"+data[1]+"\t"+data[2]+"\t"+total+"원");
				
				//StringTokenizer 사용 분리
				StringTokenizer st=new StringTokenizer(s, ",");
				String name=st.nextToken();
				int su=Integer.parseInt(st.nextToken());
				int dan=Integer.parseInt(st.nextToken());
				total=su*dan;
				System.out.println(++num+"\t"+name+"\t"+su+"개"+"\t"+dan+"원"+"\t"+total+"원");
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fileRead();
	}

}
