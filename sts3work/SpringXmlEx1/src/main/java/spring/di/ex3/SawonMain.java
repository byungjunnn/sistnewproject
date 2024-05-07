package spring.di.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SawonMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("appContext3.xml");
		
		//sawon
		Sawon sawon=(Sawon)context.getBean("sawon");
		sawon.writeData();
		
		//sawon2
		Sawon sawon2=context.getBean("sawon2", Sawon.class);
		sawon2.writeData();
	}

}
