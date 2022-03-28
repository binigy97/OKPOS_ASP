package com.okpos.asp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.okpos.asp.service.StoreMngService;

// MANAGER의 시스템 관리 하위 메뉴
@Controller
@RequestMapping("/sys")
public class MngSystemController {
	private StoreMngService storeMngService;

	@Autowired
	public void setStoreMngService(StoreMngService storeMngService) {
		this.storeMngService = storeMngService;
	}
	
	// 시스템 관리/본사마스터/매장환경설정
	@RequestMapping("/hoMaster/env")
	public String env(@SessionAttribute("userid") String memId, Model model) {
		model.addAttribute("memId", memId);
		
		return "/mng/sys/hoMasterEnv.jsp";
	}
}
