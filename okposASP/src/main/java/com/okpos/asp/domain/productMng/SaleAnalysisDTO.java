package com.okpos.asp.domain.productMng;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaleAnalysisDTO {
	private LocalDate regdate; // DATE_FORMAT(posOrder_regdate, "%Y-%m-%d")
	private String code; // p.prod_code
	private String name; // p.prod_name
	private int weeks; // DATE_FORMAT(posOrder_regdate, "%w")
	private String week;
	private String month; // DATE_FORMAT(posOrder_regdate, "%m")
	private int money; // sum(posOrder_num * p.prod_money)
	
	// selectSaleAnalysisRegdateBymemId 에서 사용
	public SaleAnalysisDTO(LocalDate regdate, int week, int money) {
		this.regdate = regdate;
		this.week = parseStrWeeks(week);
		this.money = money;
	}
	
	// selectSaleAnalysisCodeBymemId 에서 사용
	public SaleAnalysisDTO(String code, String name, int money) {
		this.code = code;
		this.name = name;
		this.money = money;
	}
	
	// selectSaleAnalysisWeekBymemId 에서 사용
	public SaleAnalysisDTO(int weeks, int money) {
		this.weeks = weeks;
		this.week = parseStrWeeks(weeks);
		this.money = money;
	}
	
	// selectSaleAnalysisMonthBymemId 에서 사용
	public SaleAnalysisDTO(String month, int money) {
		this.month = month;
		this.money = money;
	}
	
	public void setWeeks(int weeks) {
		this.weeks = weeks;
		this.week = parseStrWeeks(weeks);
	}
	
	public void setWeek(int weeks) {
		this.week = parseStrWeeks(weeks);
	}

	public String parseStrWeeks(int weeks) {
		switch(weeks) {
		case 0: return "일";
		case 1: return "월";
		case 2: return "화";
		case 3: return "수";
		case 4: return "목";
		case 5: return "금";
		case 6: return "토";
		}
		return "";
	}
}
