package com.okpos.asp.domain.productMng;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PosorderDTO {
	private int orderId; // posOrder_id
	private String memId; // mem_id
	private String code; // prod_code
	private int num; // posOrder_num
	private LocalDateTime regdate; // posOrder_regdate
	private int returnNum; // posOrder_returnNum

	public String getRegdate() {
		if (this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
