package spring.db.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements MemberDaoInter {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int getIdCheck(String id) {
		return session.selectOne("idCheckOfMember", id);
	}

	@Override
	public void insertMember(MemberDto dto) {
		session.insert("insertOfMember", dto);
	}

	@Override
	public List<MemberDto> getAllMemberDatas() {
		return session.selectList("getAllOfMember");
	}

	@Override
	public MemberDto getOneData(String num) {
		return session.selectOne("selectOneOfMember", num);
	}
	
	@Override
	public int passCheck(String num, String pass) {
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("passCheckOfMember", map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		session.update("updateOfMember", dto);
	}

	@Override
	public void deleteMember(String num) {
		session.delete("deleteOfMember", num);
	}

	

}
