package day0129;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import oracleDb.DbConnect;

public class JdbcPstmt_01 {

	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);
	
	//insert
	public void insertSangpum() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("타입?");
		String type=sc.nextLine();
		System.out.println("상품명?");
		String sangpum=sc.nextLine();
		System.out.println("수량?");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("단가?");
		int dan=Integer.parseInt(sc.nextLine());
		
		//PreparedStatement: 미완의 sql문을 작성할 수 있다
		//변수를 ? 로 표시, 나중에 바인딩 처리
		String sql="insert into sales values(seq1.nextval, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql); //sql을 인자로 넣음, statement와 다른점
			
			//?를 순서대로 바인딩한 후 업데이트, 파라미터인덱스는 1부터
			pstmt.setString(1, type);
			pstmt.setString(2, sangpum);
			pstmt.setInt(3, su);
			pstmt.setInt(4, dan);
			
			//업데이트
			int n=pstmt.executeUpdate();
			
			if(n==1)
				System.out.println("인서트 성공");
			else
				System.out.println("인서트 실패");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//select
	public void select() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from sales order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			System.out.println("시퀀스\t카테고리\t상품명\t수량\t단가\t입고일");
			System.out.println("---------------------------------------------------");
			
			while(rs.next()) {
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("type")+"\t"
						+rs.getString("sangpum")+"\t"
						+rs.getInt("su")+"\t"
						+rs.getInt("dan")+"\t"
						+rs.getDate("ipgo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	//delete
	public void delete() {
		//삭제... 시퀀스번호로 삭제
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("삭제할 시퀀스는?");
		int num=Integer.parseInt(sc.nextLine());
		
		String sql="delete from sales where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, num);
			
			int n=pstmt.executeUpdate();
			if(n==1)
				System.out.println("삭제 성공");
			else
				System.out.println("삭제 실패");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//update.. num을 인자로 받아서 데이터가 있다면 true, 없으면 false를 반환하는 메서드
	public boolean isOneData(String num) {
		boolean b=false;
		
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from sales where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//1개일 경우 if
			if(rs.next()) //데이터가 있는 경우
				b=true;
			else  //데이터가 없는 경우
				b=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}
	//수정.. 시퀀스 입력 후 수정할 데이터 수정
	public void updateSangpum() {
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 시퀀스는?");
		String num=sc.nextLine();
		
		//여기에서 isOneData()를 호출해서 그 번호가 존재하는지 확인
		if(!this.isOneData(num)) {
			System.out.println("해당 번호는 존재하지 않습니다");
			return; //메서드 종료
		}
		
		System.out.println("수정할 상품명");
		String sang=sc.nextLine();
		System.out.println("수정할 수량");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 단가");
		int dan=Integer.parseInt(sc.nextLine());
		
		String sql="update sales set sangpum=?, su=?, dan=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//4개 ?를 순서대로 바인딩
			pstmt.setString(1, sang);
			pstmt.setInt(2, su);
			pstmt.setInt(3, dan);
			pstmt.setString(4, num);
			//업데이트
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//검색
	public void searchName() {
		System.out.println("검색할 이름을 입력하세요(일부)");
		String sang=sc.nextLine();
		
		String sql="select num, sangpum, su, dan from sales where sangpum like ?";
		
		System.out.println("시퀀스\t상품명\t수량\t단가");
		
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, "%"+sang+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("sangpum")+"\t"
						+rs.getInt("su")+"\t"
						+rs.getInt("dan"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JdbcPstmt_01 sales=new JdbcPstmt_01();
		Scanner sc=new Scanner(System.in);
		int n;
		
		while(true) {
			System.out.println("***상품입고***");
			System.out.println("1.상품추가   2.상품전체출력   3.상품삭제   4.상품수정   5.상품검색   9.종료");
			
			System.out.print("선택할 메뉴는?==>");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				sales.insertSangpum();
			else if(n==2)
				sales.select();
			else if(n==3)
				sales.delete();
			else if(n==4)
				sales.updateSangpum();
			else if(n==5)
				sales.searchName();
			else if(n==9) {
				System.out.println("프로그램 종료");
				break;
			}
		}
	}
}
