package day0115;

import java.io.IOException;
import java.io.InputStream;

//Stream: 바이트 단위로 처리
//writer, reader: 문자 단위로 처리
//BufferReader: 해당 클래스는 스트림으로부터 데이터를 읽어올 때 한 줄씩 읽을 수 있는 readline()
//BufferWriter: flush()메서드를 호출해서 버퍼의 내용을 전송하는 작업이 추가로 필요함

public class IOExcep_16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		InputStream is=System.in; //콘솔에서 입력 받기위한 노드 스트림
		int a=0;
		
		System.out.println("한글자 입력");
		try {
			a=is.read(); //1바이트 읽는 것..리턴값은 아스키코드..한글은 못읽음(1바이트이므로, 최소2바이트여야함)
		} catch (IOException e) {
			System.out.println("오류: "+e.getMessage());
		}
		System.out.println("***3초 뒤에 출력합니다***");
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			//e.printStackTrace();
		}
		System.out.println("입력값: "+(char)a); //char 지우면 숫자로 나옴(아스키코드)
	}

}
