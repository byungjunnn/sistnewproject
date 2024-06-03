package com.code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HireController {
	
	@GetMapping("/")
	public String home() {
		return "hire/hirewrite";
	}
	

}
