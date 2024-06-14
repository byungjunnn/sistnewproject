package com.code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.code.dto.HireDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class HireController {
	
	@GetMapping("/")
	public String home() {
		return "hire/hirewrite";
	}

	@ResponseBody
	@PostMapping("hire/insert")
	public String hireInsert(@ModelAttribute("hdto") HireDto dto, HttpSession session) {
		
		return null;
	}
}
