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
public class OutproductDTO {
	private int id; // out_id '일련번호'
	private String memId;	// mem_id
	private LocalDate date; // get_date
	private int num;	// get_num
	private String client;	// get_client
	private LocalDateTime regdate;	// get_regdate
	
	public String getRegdate() {
		if (this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
