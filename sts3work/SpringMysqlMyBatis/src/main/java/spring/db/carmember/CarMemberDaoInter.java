package spring.db.carmember;

import java.util.List;

public interface CarMemberDaoInter {

	public int getTotalCount();
	public void insertMember(CarMemberDto dto);
	public List<CarMemberDto> getAllMemberDatas();
<<<<<<< HEAD
	public CarMemberDto getOneData(String num);
	public void updateCarMember(CarMemberDto dto);
	public void deleteMember(String num);
=======
>>>>>>> 9378f6f28662beab38a929c3907021905de757d4
}
