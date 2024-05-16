package boot.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.InfoDto;

@Controller
public class FormReadController {

	@PostMapping("/sist/read1")
	public ModelAndView result1(@RequestParam String name,
			@RequestParam int java,
			@RequestParam int spring) {
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");
		
		return model;
	}
	
	@PostMapping("/sist/show2")
	public String result2(@ModelAttribute("dto") InfoDto dto) {
		
		return "result/result2";
	}
	
	//map으로 읽을 경우, 폼의 name이 key값으로 입력값이 value값으로 저장
	@PostMapping("/sist/write3")
	public ModelAndView result3(@RequestParam Map<String, String> map) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", map.get("name"));
		mview.addObject("blood", map.get("blood"));
		mview.addObject("buseo", map.get("buseo"));
		
		mview.setViewName("result/result3");
		return mview;
	}
}
