package boot.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.ex1.TestDto;

@RestController //json 전용 어노테이션
public class TestController {
	
	@GetMapping("/test")
	public TestDto hello() {
		TestDto dto=new TestDto();
		dto.setName("이병준");
		dto.setAddr("서울시");
		
		return dto;
	}
}
