package day0111;

import java.util.Scanner;
//클래스 생성
class Emp{
	//변수 선언
	private String sName;
	private int gPay;
	private int fSu;
	private int tSu;
	
		//명시적 생성자
////	public Emp(String name, int pay, int fs, int ts) {
////		this.sName=name;
////		this.gPay=pay;
////		this.fSu=fs;
////		this.tSu=ts;
//	}
	
	//setter, getter
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getgPay() {
		return gPay;
	}
	public void setgPay(int gPay) {
		this.gPay = gPay;
	}
	public int getfSu() {
		return fSu;
	}
	public void setfSu(int fSu) {
		this.fSu = fSu;
	}
	public int gettSu() {
		return tSu;
	}
	public void settSu(int tSu) {
		this.tSu = tSu;
	}
	
	//가족수당 메서드 생성
	public int getFamilySudang() {
		int n=0; //가족수당
		if(fSu>=2)
			n=100000;
		else
			n=fSu*50000;
		return n;
	}
	//시간수당
	public int getTimeSudang() {
		int n=0;
		if(tSu>=10)
			n=300000;
		else
			n=tSu*30000;
		return n;
	}
	//총급여
	public int getTotalPay() {
		int n=gPay+getFamilySudang()+getTimeSudang();
		return n;
	}
	//제목
	public static void showTitle() { //간단하고 의미 크지않은 것은 static 사용
		System.out.println("***쌍용 01월 직원 급여현황***");
		System.out.println();
		System.out.println("사원명\t기본급\t자녀수\t초과근무시간\t가족수당\t시간수당\t총급여");
		System.out.println("==============================================================");
	}
}

public class SawonInstanceScanner_15 {
	//메서드로 출력
	public static void writeEmp(Emp[] emp) {
		//제목 출력
		Emp.showTitle();
		//내용 출력
		for(Emp e:emp)
			System.out.println(e.getsName()+"\t"+e.getgPay()+"\t"+e.getfSu()
					+"\t"+e.gettSu()+"\t"+e.getFamilySudang()+"\t"
					+e.getTimeSudang()+"\t"+e.getTotalPay());
	} 
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		//입력값 선언
		int inwon;
		Emp[] emp;
		//최초 입력값
		System.out.println("입력할 직원수?");
		inwon=Integer.parseInt(sc.nextLine());
		
		//배열할당(인스턴스 생성)
		emp=new Emp[inwon]; // 디폴트생성자가 있을 경우 사용
		//emp[i]=new Emp(name,pay,fs,ts); 명시적 생성자가 있을 경우 사용
		
		//인원수만큼 데이터 입력
		for(int i=0;i<inwon;i++) {
			//인스턴스 생성
			emp[i]=new Emp();
			System.out.println("이름");
			String name=sc.nextLine();
			System.out.println("기본급?");
			int pay=Integer.parseInt(sc.nextLine());
			System.out.println("자녀수 입력");
			int fs=Integer.parseInt(sc.nextLine());
			System.out.println("초과근무시간?");
			int ts=Integer.parseInt(sc.nextLine());
			
			//setter로 emp클래스에 데이터 넣기
			emp[i].setsName(name);
			emp[i].setgPay(pay);
			emp[i].setfSu(fs);
			emp[i].settSu(ts);
			
			System.out.println();
		}
		
		//최종값 출력 - static이므로 생성하지 않고 출력 가능, 같은 클래스 내에서 클래스명 생략하고 호출가능
		writeEmp(emp);
	}

}
