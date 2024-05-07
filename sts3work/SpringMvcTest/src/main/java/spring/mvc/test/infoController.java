package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/info") //info�� �����ϴ� ���ϸ� �ҷ���
public class infoController {

	@GetMapping("/info/myform")
	public String myform() {
		return "info/infoform"; //web-inf/info/infoform.jsp�� �ǹ�
	}
	
	@PostMapping("/info/read")
	public String result(@ModelAttribute("dto") infoDto dto) { //@ModelAttribute : infodto�� �ִ� �ɹ����� ������
							//dto��� �̸����� infodto�� �����ϰڴ� ��� �ǹ�, �̿ܿ��� �չ��ڸ� �ҹ��ڷ� �ٲ� ���� 
		return "info/infowrite";
	}
}
