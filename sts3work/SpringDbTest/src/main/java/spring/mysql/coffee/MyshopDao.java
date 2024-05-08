package spring.mysql.coffee;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //bean�� ���
public class MyshopDao implements MyshopDaoInter {

	@Autowired //�ڵ����� ������(�޼��带 �� �����ٰ� ������)
	private SqlSession session;
	
	@Override
	public List<MyshopDto> getAllList() {
		// TODO Auto-generated method stub
		return session.selectList("getAllMyShop");
	}
}
