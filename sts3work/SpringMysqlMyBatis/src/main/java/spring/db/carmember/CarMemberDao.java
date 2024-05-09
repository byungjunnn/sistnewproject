package spring.db.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertMember(CarMemberDto dto) {
		session.insert("insertOfMember", dto);
	}

	@Override
	public List<CarMemberDto> getAllMemberDatas() {
		return session.selectList("getAllOfMember");
	}

	@Override
	public int getTotalCount() {
		return session.selectOne("totalCountOfMember");
	}

<<<<<<< HEAD
	@Override
	public CarMemberDto getOneData(String num) {
		return session.selectOne("selectOneOfCarMember", num);
	}

	@Override
	public void updateCarMember(CarMemberDto dto) {
		session.update("updateOfCarMember", dto);
	}

	@Override
	public void deleteMember(String num) {
		session.delete("deleteOfCarMember", num);
	}

=======
>>>>>>> 9378f6f28662beab38a929c3907021905de757d4
}
