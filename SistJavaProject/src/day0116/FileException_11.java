package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

//FileReader: 경로에 있는 파일을 로드_반드시 Exception 발생
//BufferReader: 버퍼를 사용해서 파일읽기
//무조건 try_catch 사용, 라인이 또 생기면 멀티 catch 사용
public class FileException_11 {

	public static void read() {
		String fileName="C:\\sist0103\\file\\memo.txt";
		BufferedReader br=null;
		FileReader fr=null; //문자단위
		
		//읽기 위해서 파일 열기
		try {
			fr=new FileReader(fileName);
			System.out.println("파일을 열었어요");
			
			br=new BufferedReader(fr);
			
			//여러줄을 읽어야 하므로 while문 읽는다
			while(true) {
				String s=br.readLine(); //다시 오류가 생기면 멀티 catch
				
				//마지막 줄일 경우, null값을 읽는다, null값일 경우, while문을 빠져나감
				if(s==null)
					break;
				
				System.out.println(s);
			}
			
		} catch (FileNotFoundException e) {
			//e.printStackTrace();
			System.out.println("파일이 없어요"+e.getMessage());
		} catch (IOException e) {
			// TODO: handle exception
		}finally {
			try {
				br.close(); //생성한 반대순으로 닫는다
				fr.close();
				System.out.println("파일에 대한 자원을 모두 닫았어요");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		read();
		
		System.out.println("**정상종료**");
	}

}
