package com.code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HireController {
	
	@GetMapping("/")
	public String home() {
		return "hire/hiremain";
	}

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("hire/insert") public String insert() {
	 * 
	 * }
	 */
}
