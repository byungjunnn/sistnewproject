package day0112;

import java.util.Scanner;

class Quiz{
	private String name;
	private int java;
	private int oracle;
	private int html;
	static String schoolName="쌍용교육센터";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getOracle() {
		return oracle;
	}
	public void setOracle(int oracle) {
		this.oracle = oracle;
	}
	public int getHtml() {
		return html;
	}
	public void setHtml(int html) {
		this.html = html;
	}
	
	public int getTotal() {
		int n=java+oracle+html;
		return n;
	}
	public double getAverge() {
		double n=getTotal()/3.0;
		return n;
	}
	public String getPyungga() {
		String n;
		if(getAverge()>=90)
			n="장학생";
		else if(getAverge()>=80)
			n="합격";
		else
			n="불합격";
		return n;
	}
	public static void schoolName() {
		System.out.println("학교명: "+schoolName);
		System.out.println();
		System.out.println("이름\tJAVA\tORACLE\tHTML\t총점\t평균\t평가");
		System.out.println("==========================================");
	}
	public void showData() {
		System.out.println(getName()+"\t"+getJava()+"\t"+getOracle()+"\t"
				+getHtml()+"\t"+getTotal()+"\t"+getAverge()+"\t"
				+getPyungga());
	}
}

public class QuizMain_15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc=new Scanner(System.in);
		int inwon;
		Quiz[] stu;
		
		System.out.println("인원수?");
		inwon=Integer.parseInt(sc.nextLine());
		
		stu=new Quiz[inwon];
		
		for(int i=0;i<inwon;i++) {
			stu[i]=new Quiz();
			System.out.println("이름");
			String name=sc.nextLine();
			System.out.println("JAVA");
			int java=Integer.parseInt(sc.nextLine());
			System.out.println("ORACLE");
			int oracle=Integer.parseInt(sc.nextLine());
			System.out.println("HTML");
			int html=Integer.parseInt(sc.nextLine());
			
			stu[i].setName(name);
			stu[i].setJava(java);
			stu[i].setOracle(oracle);
			stu[i].setHtml(html);
			
			System.out.println();
		}
		Quiz.schoolName();
		for(int i=0;i<inwon;i++) {
			stu[i].showData();
		}
	}

}
