package spring.day0430.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	@Autowired //�������̽��� ������ Ŭ���� �Ѱ� �� ���� �ڵ������� �Ǵµ� ���� ������ Ŭ������ 2�� �̻��̸� �ڵ����Կ� ������ ����
	//��Ȯ�ϰ� bean�� �̸����� �����Ϸ���..resource ���
	@Resource(name="vietnamManggo")
	Manggo mg;

	public void writeManggo() {
		System.out.println("**���� �����ϴ� �����**");
		mg.writeMangoName();
	}
}
