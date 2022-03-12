package com.okpos.asp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	// 기획에서 구현 범위에 포함되지 않은 페이지
	@RequestMapping({"/remote", "/favorite"})
	public String remote() {
		return "notExist.html";
	}
	
}
