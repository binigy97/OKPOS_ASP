package com.okpos.asp.domain.memberMng;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PosmemberDTO {
	private String memId; // mem_id
	private String memPw; // mem_pw
	private int auth; // mem_auth
	private String storeNum; // mem_storeNum
	private LocalDateTime regdate; // mem_regdate

	public String getRegdate() {
		if (this.regdate == null) {
			this.regdate = LocalDateTime.now();
		}
		return this.regdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
