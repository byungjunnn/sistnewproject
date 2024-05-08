package spring.db.may;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpringCarDao implements SpringCarDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		return session.selectOne("totalCountOfCar"); //totalCountOfCar: mapper id°ª
	}

	@Override
	public void insertCar(SpringCarDto dto) {
		session.insert("insertOfMyCar", dto);
	}

	@Override
	public List<SpringCarDto> getAllCarDatas() {
		return session.selectList("getAllOfMyCar");
	}

	@Override
	public SpringCarDto getData(String num) {
		return session.selectOne("selectOneOfCar", num);
	}

	@Override
	public void updateCar(SpringCarDto dto) {
		session.update("updateOfcar", dto);
	}

	@Override
	public void deleteCar(String num) {
		session.delete("deleteOfCar", num);
	}
}
