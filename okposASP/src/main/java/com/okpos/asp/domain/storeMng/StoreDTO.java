package com.okpos.asp.domain.storeMng;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDTO {
	private String memId; // mem_id
	private String name; // store_name
	private int type; // store_type
	private LocalTime openTime; // store_openTime
	private LocalTime closeTime; // store_closeTime

	public String getOpenTime() {
		return this.openTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	}

	public String getCloseTime() {
		return this.closeTime.format(DateTimeFormatter.ofPattern("HH:mm"));
	}
}
