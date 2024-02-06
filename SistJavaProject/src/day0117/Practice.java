package day0117;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Scanner;

public class Practice {

	Scanner sc=new Scanner(System.in);
	static final String FILENAME="C:\\sist0103\\file\\practice.txt";
	FileWriter fw=null;
	FileReader fr=null;
	BufferedReader br=null;
	
	public int getMenu() {
		int num=0;
		System.out.println("1.추가   2.출력   3.삭제   4.종료");
		num=Integer.parseInt(sc.nextLine());
		return num;
	}
	public void pWrite() {
		System.out.println("상품명?");
		String name=sc.nextLine();
		System.out.println("수량?");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("가격?");
		int price=Integer.parseInt(sc.nextLine());
			
		try {
			fw=new FileWriter(FILENAME, true);
			fw.write(name+","+su+","+price+"\n");
			System.out.println("\t추가 완료!!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void pRead() {
		int tot=0;
		int num=0;
		NumberFormat nf=NumberFormat.getCurrencyInstance();
		
		System.out.println("\t\t**상품내역**");
		System.out.println();
		System.out.println("번호\t상품명\t수량\t단가\t금액");
		System.out.println("---------------------------------------");
		
		try {
			fr=new FileReader(FILENAME);
			br=new BufferedReader(fr);
			
			while(true) {
				String s=br.readLine();
				if(s==null)
					break;
				String[] data=s.split(",");
				String sang=data[0];
				int su=Integer.parseInt(data[1]);
				int price=Integer.parseInt(data[2]);
				
				int sum=su*price;
				tot+=sum;
				
				System.out.println(++num+"\t"+sang+"\t"+su+"\t"+nf.format(price)+"\t"+nf.format(sum));
			}
			System.out.println();
			System.out.println("\t\t총금액="+nf.format(tot)+"원");
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
	public void delete() {
		File file=new File(FILENAME);
		if(file.exists())
			file.delete();
		
		System.out.println("\t\t**파일 삭제**");
	}
	public void process() {
		while(true) {
			int num=0;
			num=this.getMenu();
			
			switch(num) {
			case 1:
				System.out.println("\t\t상품정보 입력");
				pWrite();
				break;
			case 2:
				System.out.println("\t\t상품정보 출력");
				pRead();
				break;
			case 3:
				System.out.println("\t\t파일 삭제");
				delete();
				break;
			case 4:
				System.out.println("\t\t프로그램 종료");
			default:
				System.out.println("\t\t재입력 바람");
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Practice p=new Practice();
		p.process();
	}

}
