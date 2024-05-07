package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/info") //info로 시작하는 파일만 불러옴
public class infoController {

	@GetMapping("/info/myform")
	public String myform() {
		return "info/infoform"; //web-inf/info/infoform.jsp를 의미
	}
	
	@PostMapping("/info/read")
	public String result(@ModelAttribute("dto") infoDto dto) { //@ModelAttribute : infodto에 있는 맴버들을 가져옴
							//dto라는 이름으로 infodto를 저장하겠다 라는 의미, 이외에는 앞문자만 소문자로 바꿔 저장 
		return "info/infowrite";
	}
}
