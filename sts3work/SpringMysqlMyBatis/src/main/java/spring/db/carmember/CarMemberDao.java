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

}
