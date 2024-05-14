package spring.mvc.data;

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
		return session.selectOne("TotalCountOfBoard");
	}

	@Override
	public int getMaxNum() {
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfBoard", map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		
		int num=dto.getNum(); //0이면 새글, 1보다 크면 답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) {
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else { //답글 일때
			//같은 그룹 중 전달받은 restep보다 큰 글들은 +1
			this.updateRestep(regroup, restep);
			
			//전달받은 step, level은 +1
			restep++;
			relevel++;
		}
		
		//바뀐 값들 다시 dto에 담기
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		session.insert("insertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perPage) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perPage", perPage);
		
		return session.selectList("SelectPagingListOfBoard", map);
	}

	@Override
	public void updateReadCount(int num) {
		session.update("UpdateReadCountOfBoard", num);
	}

	@Override
	public BoardDto getOneData(int num) {
		return session.selectOne("getDataOfBoard", num);
	}

	@Override
	public int getCheckPass(int num, int pass) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("CheckEqualPassOfBoard", map);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		session.update("UpdateOfBoard", dto);
	}

	@Override
	public void deleteBoard(int num) {
		session.delete("DeleteOfBoard", num);
	}
}
