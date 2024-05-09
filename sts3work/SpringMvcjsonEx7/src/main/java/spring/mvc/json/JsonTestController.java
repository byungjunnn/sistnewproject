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
	@ResponseBody //jsonó�� �� �������� ��½�Ű�� ����(restController�� ���x)
	public Map<String, String> list1(){
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "������");
		map.put("hp", "010-1111-1111");
		map.put("addr", "����� ������");
		
		return map;
	}
	
	@GetMapping("/foodlist2")
	@ResponseBody
	public List<PhotoDto> list2(){
		
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("������ġ", "1.jpg"));
		list.add(new PhotoDto("��ġ����", "2.jpg"));
		list.add(new PhotoDto("�������", "11.jpg"));
		list.add(new PhotoDto("��������", "5.jpg"));
		list.add(new PhotoDto("�丶���", "7.jpg"));
		
		return list;
	}
}
