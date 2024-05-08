package spring.mysql.coffee;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //bean에 등록
public class MyshopDao implements MyshopDaoInter {

	@Autowired //자동주입 시켜줌(메서드를 다 가져다가 쓰도록)
	private SqlSession session;
	
	@Override
	public List<MyshopDto> getAllList() {
		// TODO Auto-generated method stub
		return session.selectList("getAllMyShop");
	}
}
