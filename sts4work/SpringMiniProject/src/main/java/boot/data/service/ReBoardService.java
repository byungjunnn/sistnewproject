package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReBoardDto;
import boot.data.mapper.ReBoardMapperInter;

@Service
public class ReBoardService implements ReBoardServiceInter {

	@Autowired
	ReBoardMapperInter mapper;
	
	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapper.getTotalCount(map);
	}

	@Override
	public void insertReBoard(ReBoardDto dto) {
		int num=dto.getNum(); //새글이면 이미 0이 들어가 있음
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) { //새글인 경우
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else { //답글일 경우
			//같은 그룹 중에서 전달받은 restep보다 큰 값들은 모두 +1 해준다
			this.updateRestep(regroup, restep);
			//그리고 전달받은 값보다 +1크게 db에 저장
			restep++;
			relevel++;
		}
		//변경된 값들을 다시 dto에 담음
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//인서트
		mapper.insertReBoard(dto);
	}

	@Override
	public List<ReBoardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage) {
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);
	}

	@Override
	public ReBoardDto getData(int num) {
		return mapper.getData(num);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		Map<String, Integer> map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		mapper.updateRestep(map);
	}

	@Override
	public void updateReadCount(int num) {
		mapper.updateReadCount(num);
	}

	@Override
	public int getMaxNum() {
		return mapper.getMaxNum();
	}

	@Override
	public void deleteReBoard(int num) {
		mapper.deleteReBoard(num);
	}

	@Override
	public void likesUpdate(int num) {
		mapper.likesUpdate(num);
	}

	
}
