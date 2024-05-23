package myshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.mapper.MyShopMapper;

@Service
@AllArgsConstructor
public class MyShopService {

	private final MyShopMapper mapper;
	
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	public void insertMyShop(MyShopDto dto) {
		mapper.insertMyShop(dto);
	}
	
	public List<MyShopDto> getAllSangpums(){
		return mapper.getAllSangpums();
	}
	
	public MyShopDto getData(int num) {
		return mapper.getData(num);
	}
	
	public void deleteMyShop(int num) {
		mapper.deleteMyShop(num);
	}
}
