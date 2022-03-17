package com.okpos.asp.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysBoardDTO {
	private int id; // sysb_id
	private String memId; // mem_id
	private String title; //sysb_title
	private LocalDateTime regdate; // sysb_regdate
	
	public String getRegdate() {
		if(this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}	
}
