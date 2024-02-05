package day0126;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

import oracleDb.DbConnect;

public class QuizStuInfo {

	DbConnect db=new DbConnect();
	
	public void insert() {
		Scanner sc=new Scanner(System.in);
		String name, gender, hp;
		int age;
		
		System.out.println("학생명?");
		name=sc.nextLine();
		System.out.println("성별?");
		gender=sc.nextLine();
		System.out.println("나이?");
		age=Integer.parseInt(sc.nextLine());
		System.out.println("연락처?");
		hp=sc.nextLine();
		
		String sql="insert into stuinfo values(seq_info.nextval, '"+name+"', '"+gender+"', '"+age+"', '"+hp+"', sysdate)";
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			
			stmt.execute(sql);
			System.out.println("**데이터 추가**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void select() {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		System.out.println("시퀀스\t학생명\t성별\t나이\t    연락처\t   가입일");
		System.out.println("--------------------------------------------------------------");
		
		String sql="select * from stuinfo order by s_no";
	
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int s_no=rs.getInt("s_no");
				String s_name=rs.getString("s_name");
				String s_gender=rs.getString("s_gender");
				int s_age=rs.getInt("s_age");
				String s_hp=rs.getString("s_hp");
				Date gaipday=rs.getDate("gaipday");
				
				System.out.println(s_no+"\t"+s_name+"\t"+s_gender+"\t"+s_age+"\t"+s_hp+"\t"+gaipday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	
	public void delete() {
		Scanner sc=new Scanner(System.in);
		String no=null;
		
		System.out.println("삭제할 시퀀스 입력");
		no=sc.nextLine();
		
		String sql="delete from stuinfo where s_no="+no;
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);
			
			if(a==0)
				System.out.println("없는 데이터 번호입니다");
			else
				System.out.println("**삭제 완료**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public boolean getONeData(String no) {
		boolean flag=false;
		
		String sql="select * from stuinfo where s_no="+no;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
				flag=true;
			else
				flag=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		return flag;
	}
	
	public void update() {
		Scanner sc=new Scanner(System.in);
		String s_no, s_name, s_gender, s_hp;
		int s_age;
		System.out.println("수정할 시퀀스?");
		s_no=sc.nextLine();
		
		if(!getONeData(s_no)) {
			System.out.println("이 시퀀스는 존재하지 않습니다");
			return;
		}
		System.out.println("수정할 학생명?");
		s_name=sc.nextLine();
		System.out.println("수정할 성별?");
		s_gender=sc.nextLine();
		System.out.println("수정할 나이?");
		s_age=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 연락처?");
		s_hp=sc.nextLine();
		
		String sql="update stuinfo set s_name='"+s_name+"', s_gender='"+s_gender+"', s_age='"+s_age+"', s_hp='"+s_hp+"' where s_no="+s_no;
		System.out.println(sql);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);
			
			if(a==0)
				System.out.println("수정할 데이터가 존재하지 않습니다");
			else
				System.out.println("**수정 완료**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void search() {
		Scanner sc=new Scanner(System.in);
		String name;
		
		System.out.println("검색할 이름?");
		name=sc.nextLine();
		
		String sql="select * from stuinfo where s_name like '%"+name+"%'";

		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int s_no=rs.getInt("s_no");
				String s_name=rs.getString("s_name");
				String s_gender=rs.getString("s_gender");
				int s_age=rs.getInt("s_age");
				String s_hp=rs.getString("s_hp");
				Date gaipday=rs.getDate("gaipday");
				
				System.out.println(s_no+"\t"+s_name+"\t"+s_gender+"\t"+s_age+"\t"+s_hp+"\t"+gaipday);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizStuInfo qs=new QuizStuInfo();
		
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true) {
			System.out.println("1.학생정보 입력  2.정보 출력  3.정보 삭제  4.학생정보 수정  5.학생 검색  9.종료");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				qs.insert();
			else if(n==2)
				qs.select();
			else if(n==3)
				qs.delete();
			else if(n==4)
				qs.update();
			else if(n==5)
				qs.search();
			else if(n==9) {
				System.out.println("프로그램 종료");
				break;
			}
		}
	}

}
