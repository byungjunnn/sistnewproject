package boot.data.service;

import java.util.List;

import boot.data.dto.ReBoardDto;

public interface ReBoardServiceInter {

	public int getTotalCount(String searchcolumn, String searchword);
	public void insertReBoard(ReBoardDto dto);
	public List<ReBoardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage);
	public ReBoardDto getData(int num);
	public void updateRestep(int regroup, int restep);
	public void updateReadCount(int num);
	public int getMaxNum();
	public void deleteReBoard(int num);
	public void likesUpdate(int num);
}
