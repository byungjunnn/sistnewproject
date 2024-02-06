package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileException_12 {

	//점수의 총개수, 합계, 평균
	public static void scoreRead() throws FileNotFoundException, IOException{
		String fileName="C:\\sist0103\\file\\score.txt";
		FileReader fr=null;
		BufferedReader br=null; //try_catch에 의해 에러가 나도 변수를 사용하기 위해서 선언
		int cnt=0; //개수
		int total=0;
		double avg=0;
		
		//파일 읽기
		fr=new FileReader(fileName);
		System.out.println("파일 정상적으로 읽음");
		
		br=new BufferedReader(fr);
		while(true) {
			String s=br.readLine(); //계산하려면 형변환 필요
			if(s==null)
				break;
			
			// 문자열 점수를 int로 변환해서 합계랑 갯수 구하기
			cnt++;
			total+=Integer.parseInt(s);
		}
		//평균 구하기
		avg=(double)total/cnt;
		
		System.out.println("총갯수: "+cnt);
		System.out.println("총점: "+total);
		System.out.printf("평균: %.2f\n", avg);
		
		//자원들 닫기
		br.close();
		fr.close();
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			scoreRead();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("**정상종료**");
	}

}
