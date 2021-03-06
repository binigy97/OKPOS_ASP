package com.okpos.asp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.okpos.asp.domain.api.WeatherAjaxDTO;
import com.okpos.asp.domain.board.BookBoardDTO;
import com.okpos.asp.domain.board.DocBoardDTO;
import com.okpos.asp.domain.board.SysBoardDTO;
import com.okpos.asp.domain.productMng.SaleAnalysisDTO;
import com.okpos.asp.service.BoardService;
import com.okpos.asp.service.MemberMngService;
import com.okpos.asp.service.ProductMngService;

@Controller
public class HomeController {
	
	private MemberMngService memberMngService;
	private ProductMngService productMngService;
	private BoardService boardService;

	@Autowired
	public void setMemberMngService(MemberMngService memberMngService) {
		this.memberMngService = memberMngService;
	}

	@Autowired
	public void setProductMngService(ProductMngService productMngService) {
		this.productMngService = productMngService;
	}
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	// 기획에서 구현 범위에 포함되지 않은 페이지
	@RequestMapping({"/remote", "/favorite"})
	public String remote() {
		return "notExist.html";
	}
	
	@RequestMapping("/index")
	public String home(@SessionAttribute("userid") String memId, HttpServletRequest request, Model model) {
		// login user id
		model.addAttribute("memId", memId);
		
		// get authority for view page
		String auth = memberMngService.selectAuthById(memId);
		
		// Open Weather Map API data
		HttpSession session = request.getSession();
		WeatherAjaxDTO[] w = (WeatherAjaxDTO[])session.getAttribute("weatherList");
		if (w != null) {
			System.out.println("/index->" + w[0].toString());
			model.addAttribute("weatherList", w);
		}
		
		// redirect view page
		if (auth != null) {
			switch(auth) {
			case "ADMIN": return "notExist.jsp";
			case "MANAGER":
				List<SysBoardDTO> sdto = boardService.selectSysboard();
				List<BookBoardDTO> bdto = boardService.selectBookboard();
				List<DocBoardDTO> ddto = boardService.selectDocboard();
				
				model.addAttribute("sysBoard", sdto);
				model.addAttribute("bookBoard", bdto);
				model.addAttribute("docBoard", ddto);
				
				return "mng/index.jsp";
			case "USER":
				List<SysBoardDTO> sdto2 = boardService.selectSysboard();
				List<SaleAnalysisDTO> sadtoRegdate = productMngService.selectSaleAnalysisRegdateBymemId(memId);
				List<SaleAnalysisDTO> sadtoCode = productMngService.selectSaleAnalysisCodeBymemId(memId);
				List<SaleAnalysisDTO> sadtoWeek = productMngService.selectSaleAnalysisWeekBymemId(memId);
				List<SaleAnalysisDTO> sadtoMonth = productMngService.selectSaleAnalysisMonthBymemId(memId);
				
				model.addAttribute("sysBoard", sdto2);
				model.addAttribute("saBoardRegdate", sadtoRegdate);
				model.addAttribute("saBoardCode", sadtoCode);
				model.addAttribute("saBoardWeek", sadtoWeek);
				model.addAttribute("saBoardMonth", sadtoMonth);
				
				return "user/index.jsp";
			}
		}
		return "page404.jsp";
	}
	
	// weather.js에서 해당 메서드로 redirect -> session에 data 담아서 index redirect
	@PostMapping("/weatherAjax")
	public String weatherAjax(@RequestBody WeatherAjaxDTO[] weatherList, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("weatherList", weatherList);
		
		System.out.println("/weatherAjax->" + weatherList[0].toString());
		
		return "redirect:/index";
	}
}
