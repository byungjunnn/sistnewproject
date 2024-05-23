package product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import product.dto.ProductDto;

@Mapper
public interface ProductMapper {

	public int getTotalCount();
	public void insertProduct(ProductDto dto);
	
	@Select("select * from product order by pro_num desc")
	public List<ProductDto> getAllDatas();
	
	@Select("select * from product where pro_num=#{pro_num}")
	public ProductDto getData(int pro_num);
	
	@Delete("delete from product where num=#{pro_num}")
	public void deleteProduct(int pro_num);
}
