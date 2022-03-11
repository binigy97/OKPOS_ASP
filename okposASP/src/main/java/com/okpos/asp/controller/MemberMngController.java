package com.okpos.asp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.okpos.asp.service.MemberMngService;

@Controller
public class MemberMngController {
	private MemberMngService memberMngService;

	@Autowired
	public void setMemberMngService(MemberMngService memberMngService) {
		this.memberMngService = memberMngService;
	}
	
	@RequestMapping("/index")
	public String home() {
		return "/page404.html";
//		return "redirect: /mng/index.do";
//		String auth = memberMngService.checkAuth(memId);
//		System.out.println(auth);
//		
//		
//		
//		switch(auth) {
//		case "ADMIN": return "/admin/index.do";
//		case "MANAGER": return "/mng/index.do";
//		case "USER": return "/user/index.do";
//		}
//		return "page404.html";
	}
	
	@RequestMapping("/admin/index.do")
	public String adminHome() {
		return "page404.html";
	}
	
	@RequestMapping("/mng/index.do")
	public String mngHome() {
		return "mngIndex.jsp";
	}
	
	@RequestMapping("/user/index.do")
	public String userHome() {
		return "userIndex.jsp";
	}
}
