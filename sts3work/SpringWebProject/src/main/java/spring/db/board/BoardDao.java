package spring.db.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		return session.selectOne("totalCountOfBoard");
	}

	@Override
	public int getMaxNum() {
		return session.selectOne("maxNumOfBoard");
	}

	@Override
	public void insertBoard(BoardDto dto) {
		session.insert("insertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getAllDatas() {
		return session.selectList("selectAllOfBoard");
	}

	@Override
	public BoardDto getData(int num) {
		return session.selectOne("selectOneOfBoard", num);
	}

	@Override
	public void updateReadcount(int num) {
		session.update("updateReadCountOfBoard", num);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("selectPagingListOfMember", map);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		session.update("updateOfBoard", dto);
	}

	@Override
	public void deleteBoard(int num) {
		session.delete("deleteOfBoard", num);
	}

	@Override
	public List<BoardDto> getPhotoLists() {
		return session.selectList("selectPhotoOfBoard");
	}
}
