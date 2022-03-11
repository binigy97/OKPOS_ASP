package com.okpos.asp.domain.productMng;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {
	private String code; // prod_code
	private String memId; // mem_id
	private String name; // prod_name
	private int money; // prod_moeny
	private int prodNum; // prod_num
	
	private int orderId; // posOrder_id
	private int orderNum; // posOrder_num
	private LocalDateTime orderRegdate; // posOrder_regdate
	private int returnNum; // posOrder_returnNum
	
	private int getId; // get_id '일련번호'
	private LocalDate getDate; // get_date
	private int getNum;	// get_num
	private String vendor;	// get_vendor
	private LocalDateTime getRegdate;	// get_regdate
	
	private int outId; // out_id '일련번호'
	private LocalDate outDate; // out_date
	private int outNnum; // out_num
	private String client; // get_client
	private LocalDateTime outRegdate;	// out_regdate
	
	public String regdateFormatting(LocalDateTime regdate) {
		if (regdate == null) {
			regdate = LocalDateTime.now();
		}
		return regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}

	public String getOrderRegdate() {
		return regdateFormatting(this.orderRegdate);
	}

	public String getGetRegdate() {
		return regdateFormatting(getRegdate);
	}

	public String getOutRegdate() {
		return regdateFormatting(outRegdate);
	}
}
