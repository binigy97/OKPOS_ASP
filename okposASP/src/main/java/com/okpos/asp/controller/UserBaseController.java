package com.okpos.asp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.okpos.asp.service.ProductMngService;

// USER의 기초관리 하위 메뉴
@Controller
@RequestMapping("/base")
public class UserBaseController {
	private ProductMngService productMngService;

	@Autowired
	public void setProductMngService(ProductMngService productMngService) {
		this.productMngService = productMngService;
	}
	
	// 기초관리/상품관리/상품정보일괄변경
	@RequestMapping("/prod/changeAll")
	public String changeAll(@SessionAttribute("userid") String memId, Model model) {
		model.addAttribute("memId", memId);
		
		return "user/base/prodChangeAll.jsp";
	}
}
