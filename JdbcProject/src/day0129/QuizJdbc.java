package day0129;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.naming.spi.DirStateFactory.Result;

import oracleDb.DbConnect;

public class QuizJdbc {
	
	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);
	
	public void insertMember() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("사원명?");
		String s_name=sc.nextLine();
		System.out.println("부서?");
		String buseo=sc.nextLine();
		System.out.println("직급?");
		String position=sc.nextLine();
		System.out.println("성별?");
		String gender=sc.nextLine();
		System.out.println("월급여?");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("보너스?");
		int bonus=Integer.parseInt(sc.nextLine());
		
		String sql="insert into sawonmember values(seq_smem.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s_name);
			pstmt.setString(2, buseo);
			pstmt.setString(3, position);
			pstmt.setString(4, gender);
			pstmt.setInt(5, pay);
			pstmt.setInt(6, bonus);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		System.out.println("**추가 성공**");
	}
	
	public void writeMember() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("**사원 정보 출력**");
		System.out.println();
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t\t\t월급여\t\t\t보너스");
		System.out.println("--------------------------------------------------------------------------------------");
		
		String sql="select s_no 사원번호, s_name 사원명, buseo 부서, position 직급, gender 성별, to_char(pay, 'L999,999,999') 월급여, to_char(bonus, 'L999,999,999') 보너스 from sawonmember";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("사원번호")+"\t"
						+rs.getString("사원명")+"\t"
						+rs.getString("부서")+"\t"
						+rs.getString("직급")+"\t"
						+rs.getString("성별")+"\t"
						+rs.getString("월급여")+"\t"
						+rs.getString("보너스"));
			}
			System.out.println();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public void deleteMember() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("삭제할 사원번호를 입력하세요");
		int num=Integer.parseInt(sc.nextLine());

		String sql="delete from sawonmember where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int n=pstmt.executeUpdate();
			if(n==1)
				System.out.println("**삭제 완료**");
			else
				System.out.println(num+"번 학생은 없습니다");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateMember() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 사원번호?");
		String s_no=sc.nextLine();
		if(!isOneData(s_no)){
			System.out.println(s_no+"번 학생은 없습니다");
			return;
		}
		System.out.println("수정할 부서?");
		String buseo=sc.nextLine();
		System.out.println("수정할 직급?");
		String position=sc.nextLine();
		System.out.println("수정할 급여?");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 보너스?");
		int bonus=Integer.parseInt(sc.nextLine());
		
		String sql="update sawonmember set buseo=?, position=?, pay=?, bonus=? where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, buseo);
			pstmt.setString(2, position);
			pstmt.setInt(3, pay);
			pstmt.setInt(4, bonus);
			pstmt.setString(5, s_no);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		System.out.println("**수정 완료**");
	}
	
	public boolean isOneData(String s_no) {
		boolean b=false;
		
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from sawonmember where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s_no);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				b=true;
			else
				b=false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}
	
	public void searchMember() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("검색할 사원명?(일부)");
		String s_name=sc.nextLine();
		
		String sql="select * from sawonmember where s_name like ?";
		
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t월급여\t보너스\t입사일");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+s_name+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("s_no")+"\t"
						+rs.getString("s_name")+"\t"
						+rs.getString("buseo")+"\t"
						+rs.getString("position")+"\t"
						+rs.getString("gender")+"\t"
						+rs.getInt("pay")+"\t"
						+rs.getInt("bonus")+"\t"
						+rs.getDate("ipsaday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	public void process() {
		while(true) {
			System.out.println("1.사원정보입력   2.전체사원출력   3.사원삭제   4.사원수정   5.이름검색   9.시스템종료");
			int n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				insertMember();
			else if(n==2)
				writeMember();
			else if(n==3)
				deleteMember();
			else if(n==4)
				updateMember();
			else if(n==5)
				searchMember();
			else if(n==9) {
				System.out.println("**시스템 종료**");
				break;
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizJdbc sawon=new QuizJdbc();
		sawon.process();
	}

}
