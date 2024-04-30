package spring.di.ex5;

public class Emp {

	SawonInfo info;
	String empname, emploc;
	
	public Emp(String empname) {
		this.empname=empname;
	}

	public SawonInfo getInfo() {
		return info;
	}

	public void setInfo(SawonInfo info) {
		this.info = info;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmploc() {
		return emploc;
	}

	public void setEmploc(String emploc) {
		this.emploc = emploc;
	}
	
	
	public void writeEmp() {
		System.out.println("회사명: "+empname);
		System.out.println("위치: "+emploc);
		System.out.println("사원명: "+info.getName());
		System.out.println("급여: "+info.getPay());
		System.out.println("직급: "+info.getPosition());
		
		System.out.println("부서명");
		for(String b:info.getBuseo()) {
			System.out.println("\t"+b);
		}
	}
}
