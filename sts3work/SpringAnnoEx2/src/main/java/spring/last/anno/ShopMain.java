package spring.last.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext1.xml");
		
		OrderController con=(OrderController)app.getBean("orderController");
		con.jumunInsert("�䰡��Ʈ", 35000, "��");
		con.jumunDelete("2");
		con.jumunSelect("�Ʒ�", 20000, "��");
	}

}
