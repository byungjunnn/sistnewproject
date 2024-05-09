package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.data.PhotoDto;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody //json처리 후 브라우저로 출력시키는 역할(restController는 사용x)
	public Map<String, String> list1(){
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "최유리");
		map.put("hp", "010-1111-1111");
		map.put("addr", "서울시 강남구");
		
		return map;
	}
	
	@GetMapping("/foodlist2")
	@ResponseBody
	public List<PhotoDto> list2(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("샌드위치", "1.jpg"));
		list.add(new PhotoDto("꼬치구이", "2.jpg"));
		list.add(new PhotoDto("망고빙수", "11.jpg"));
		list.add(new PhotoDto("리조또이", "5.jpg"));
		list.add(new PhotoDto("토마토습", "7.jpg"));
		
		return list;
	}
}
