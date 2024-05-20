package data.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.dto.ShopDto;
import jakarta.servlet.http.HttpSession;

@Controller //bean에 등록
public class HelloThController {

	List<ShopDto> list=new ArrayList<>();
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/hello1")
	public String hello1(Model model) {
		
		System.out.println("hello1 controller");
		
		model.addAttribute("message", "Have a Nice Day!!");
		model.addAttribute("today", new Date());
		
		ShopDto dto=ShopDto.builder()
				.num(100)
				.sangpum("요가매트")
				.su(5)
				.dan(10000)
				.color("blue")
				.build();
		
		model.addAttribute("dto", dto);
		return "hello1";
	}
	
	@GetMapping("/hello2")
	public String hello2(String name, int age, Model model) {
		
		model.addAttribute("hello2_msg", name+"님의 나이는 "+age+"세 입니다");
		return "hello2";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		
		list.add(new ShopDto(1,"이불",10,8000,"black"));
		list.add(new ShopDto(2,"베개",11,9000,"white"));
		list.add(new ShopDto(3,"침대",12,6000,"brown"));
		list.add(new ShopDto(4,"담요",13,7000,"gray"));
		ShopDto dto5=ShopDto.builder()
				.num(5)
				.sangpum("책상")
				.su(3)
				.dan(5000)
				.color("blue")
				.build();
		
		list.add(dto5);
		
		model.addAttribute("list", list);
		return "list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int index, Model model) {
		
		model.addAttribute("dto", list.get(index));
		return "detail";
	}
	
	@GetMapping("/login1")
	public String login1(HttpSession session) {
		
		session.setAttribute("myid", "admin");
		return "login";
	}
	
	@GetMapping("/login2")
	public String login2(HttpSession session) {
		
		session.setAttribute("myid", "lee");
		return "login";
	}
}
