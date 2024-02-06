package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Practice {

	public static void read() {
		String fileName="C:\\sist0103\\file\\memo.txt";
		FileReader fr=null;
		BufferedReader br=null;
		int cnt=0;
		int total=0;
		double avg=0;
		
		try {
			fr=new FileReader(fileName);
			br=new BufferedReader(fr);
			while(true) {
				String s=br.readLine();
				if(s==null)
					break;
				
				cnt++;
				total+=Integer.parseInt(s);
			}
			avg=(double)total/cnt;
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
