package day0111;

class Member{
	
	private String stuName;
	private String stuGen;
	private String stuAddr;
	
	static String ban;
	static int cnt;
	
	//멤버 메서드(수정 메서드)
	public void setMemberData(String name, String gender, String addr) {
		stuName=name; //this.은 생략가능
		stuGen=gender;
		stuAddr=addr;
	}
	//출력 메서드
	public void writeMemberData() {
		cnt++;
		System.out.println("**학생 "+cnt+" 정보**");
		System.out.println("소속학급: "+Member.ban);//같은 클래스에서는 클래스명 생략가능
		System.out.println("이름: "+stuName);
		System.out.println("성별: "+stuGen);
		System.out.println("주소: "+stuAddr);
		System.out.println("------------------------------");
	}
}
public class StaticObTest_05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Member mem1=new Member();
		Member mem2=new Member();
		
		mem1.setMemberData("최지우", "여자", "서울시 강남구");
		mem2.setMemberData("이민우", "남자", "서울시 구로구");
		
		Member.ban="쌍용교육센터 JAVA반";
		
		mem1.writeMemberData();
		mem2.writeMemberData();
	}
}