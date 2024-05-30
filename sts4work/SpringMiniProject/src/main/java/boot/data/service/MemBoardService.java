package boot.data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemBoardDto;
import boot.data.mapper.MemBoardMapperInter;

@Service
public class MemBoardService implements MemBoardServiceInter {

	@Autowired
	MemBoardMapperInter mapperInter;
	
	@Override
	public int getTotalCount() {
		return mapperInter.getTotalCount();
	}

	@Override
	public void insertMemBoard(MemBoardDto dto) {
		mapperInter.insertMemBoard(dto);
	}

	@Override
	public List<MemBoardDto> getList(int start, int perpage) {
		
		HashMap<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getList(map);
	}

	@Override
	public MemBoardDto getData(String num) {
		return mapperInter.getData(num);
	}

	@Override
	public void updateReadCount(String num) {
		mapperInter.updateReadCount(num);
	}

	@Override
	public int getMaxNum() {
		return mapperInter.getMaxNum();
	}

}
