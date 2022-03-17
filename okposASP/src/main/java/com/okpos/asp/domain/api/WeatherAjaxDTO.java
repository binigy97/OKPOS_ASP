package com.okpos.asp.domain.api;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeatherAjaxDTO {
	//private String weatherAjax; // json을 원소로 갖는 배열
	private String dayHangle; // 오늘, 내일, 모레, ...
	private String month; // MM
	private String date; // dd
	private String week; // 월, 화, ...
	private String iconUrl;
	private double tempMin;
	private double tempMax;
	private double feelTemp;
	private String dgreeHumidity; // (습도) 높음/적정/낮음
}
