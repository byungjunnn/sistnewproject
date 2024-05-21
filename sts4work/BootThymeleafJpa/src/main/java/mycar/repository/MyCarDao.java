package mycar.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import mycar.data.MyCarDto;

@Repository
@AllArgsConstructor //autowired 대체
public class MyCarDao {

	MyCarDaoInter daoInter;
	
	//db저장
	public void insertMyCar(MyCarDto dto) {
		daoInter.save(dto);
	}
	
	//전체출력
	public List<MyCarDto> getAllCars(){
		return daoInter.findAll();
		//return daoInter.findAll(Sort.by(Sort.Direction.DESC,"carprice")); //가격 비싼 것부터 출력
	}
	
	//num에 대한 dto 반환
	public MyCarDto getData(Long num) {
		return daoInter.getReferenceById(num);
	}
	
	//삭제
	public void deleteMyCar(Long num) {
		daoInter.deleteById(num);
	}
	
	//수정
	public void updateMyCar(MyCarDto dto) {
		daoInter.save(dto); //num이 포함되어있으므로 수정
	}
	
	public void updateMycarNoPhoto(MyCarDto dto) {

		Long num=dto.getNum();
		String carname=dto.getCarname();
		String carcolor=dto.getCarcolor();
		int carprice=dto.getCarprice();
		
		daoInter.updateMycarNoPhoto(num, carname, carprice, carcolor);
	}
}
