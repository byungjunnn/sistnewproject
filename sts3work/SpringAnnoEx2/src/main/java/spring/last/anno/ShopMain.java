package spring.last.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext1.xml");
		
		OrderController con=(OrderController)app.getBean("orderController");
		con.jumunInsert("요가매트", 35000, "블랙");
		con.jumunDelete("2");
		con.jumunSelect("아령", 20000, "블랙");
	}

}
