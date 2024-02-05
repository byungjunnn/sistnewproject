package day0125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuizJdbcFoodOrder {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public void foodShop() {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select order_num 주문번호,f.fno 음식번호, order_name 주문자, foodname 음식명, price 가격, shopname 상호명, shoploc 상점위치, order_addr 주문자위치 from foodshop f, jumun j where f.fno=j.fno order by order_name";
		
		try {
			conn=DriverManager.getConnection(URL, "stu", "a1234");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("주문번호\t음식번호\t주문자\t음식명\t가격\t상호명\t상점위치\t주문자위치");
			System.out.println("----------------------------------------------------------------");
			while(rs.next()) {
				int num=rs.getInt("주문번호");
				int fno=rs.getInt("음식번호");
				String name=rs.getString("주문자");
				String foodname=rs.getString("음식명");
				int price=rs.getInt("가격");
				String shopname=rs.getString("상호명");
				String shoploc=rs.getString("상점위치");
				String addr=rs.getString("주문자위치");
				
				System.out.println(num+"\t"+fno+"\t"+name+"\t"+foodname+"\t"+price+"원\t"+shopname+"\t"+shoploc+"\t"+addr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizJdbcFoodOrder fo=new QuizJdbcFoodOrder();
		fo.foodShop();
	}

}
