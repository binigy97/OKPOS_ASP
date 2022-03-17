package com.okpos.asp.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocBoardDTO {
	private int id; // docb_id
	private String memId; // mem_id
	private String title; //docb_title
	private LocalDateTime regdate; // docb_regdate
	
	public String getRegdate() {
		if(this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}	
}
