package com.okpos.asp.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookBoardDTO {
	private int id; // bkb_id
	private String memId; // mem_id
	private String title; //bkb_title
	private LocalDateTime startday; // bkb_startDate
	private LocalDateTime endday; // bkb_endDate
	private LocalDateTime regdate; // bkb_regdate
	
	public String getRegdate() {
		if(this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}	
}
