package product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import product.dto.ProductDto;
import product.mapper.ProductMapper;

@Service
@AllArgsConstructor
public class ProductService {

	private final ProductMapper mapper;
	
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	
	public void insertProduct(ProductDto dto) {
		mapper.insertProduct(dto);
	}
	
	public List<ProductDto> getAllDatas(){
		return mapper.getAllDatas();
	}
	
	public ProductDto getData(int pro_num) {
		return mapper.getData(pro_num);
	}
	
	public void deleteProduct(int pro_num) {
		mapper.deleteProduct(pro_num);
	}
}
