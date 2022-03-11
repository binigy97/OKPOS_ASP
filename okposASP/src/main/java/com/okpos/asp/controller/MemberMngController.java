package com.okpos.asp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.okpos.asp.service.MemberMngService;

@Controller
public class MemberMngController {
	private MemberMngService memberMngService;

	@Autowired
	public void setMemberMngService(MemberMngService memberMngService) {
		this.memberMngService = memberMngService;
	}
	
	@RequestMapping("/index")
	public String home(@SessionAttribute("userid") String memId, Model model) {
		String auth = memberMngService.selectAuthById(memId);
		model.addAttribute("memId", memId);
		
		if (auth != null) {
			switch(auth) {
			case "ADMIN": return "notExist.html";
			case "MANAGER": return "mngIndex.jsp";
			case "USER": return "userIndex.jsp";
			}
		}
		return "page404.html";
	}
	
}
