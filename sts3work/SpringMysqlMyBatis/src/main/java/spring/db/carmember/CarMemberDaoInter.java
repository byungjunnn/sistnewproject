package spring.db.carmember;

import java.util.List;

public interface CarMemberDaoInter {

	public int getTotalCount();
	public void insertMember(CarMemberDto dto);
	public List<CarMemberDto> getAllMemberDatas();
}
