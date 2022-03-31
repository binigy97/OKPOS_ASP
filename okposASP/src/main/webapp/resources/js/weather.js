// 사용API doc : https://openweathermap.org/api/one-call-api
$(function(){
	const weatherUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=37.5683&lon=126.9778&exclude=current,minutely,hourly,alerts&appid=f364cb7d1895fe4e6db7694110edf059&units=metric&lang=kr";
	
	$.getJSON(weatherUrl, function(data){
		$.getScript("resources/js/FormattingDate.js", function(){
			
			var weather = new Array();
			
			$.each(data, function(key, value){
				if (key == "daily") {
					$.each(value, function(k, v){
						// 아래에 사용될 변수
						let jsonObj = new Object();
						let today = getNoonUtc(new Date);
						let timestamp = Number(v.dt + "000"); // 제공값에 000이 생략되어져 있음
						let dailyDate = new Date(timestamp);
						let iconId = v.weather[0].icon;
						
						// html에 들어갈 값
						jsonObj.dayHangle = getRowdayHangle(dailyDate, today); // 오늘/내일/모레 중 무엇인지
						let [year, month, date] = getFormattingCurrentDate(dailyDate).split("-");
						jsonObj.month = month;
						jsonObj.date = date;
						jsonObj.week = getFormattingCurrentWeek(dailyDate);
						jsonObj.iconUrl = "http://openweathermap.org/img/wn/" + iconId + "@2x.png"; // 날씨 그림 (img태그 src 속성에 넣어주기)
						jsonObj.tempMin = v.temp.min; // 최저온도
						jsonObj.tempMax = v.temp.max; // 최고온도
						jsonObj.feelTemp = v.feels_like.day
						jsonObj.dgreeHumidity = getDgreeHumidity(v.temp.day, v.humidity); // (습도) 높음/적정/낮음
						
						weather.push(jsonObj);
					}); // end of each(k, v)
				}
			}); // end of each(key, value)
			
			// controller로 결과 전송
			$.ajax({
		        url: "/weatherAjax"
		        ,type:"post"
				,dateType : "json"
		        ,data: JSON.stringify(weather)
		        ,cache: false
		        ,traditional: true
		        ,contentType: "application/json; charset=utf-8"
		        ,error: function(jqXHR) {
		            console.log(jqXHR.responseText);
		        }
			});
			
		}); // end of getScript()
	}); // end of getJSON()
	
}); // end of doucument.ready()

// api에서 날짜가 utc time 정오, 오늘 날짜를 이에 맞게 변환 -> getRowdayHangle()에서 사용
function getNoonUtc(targetDateObj) {
	var targetDate = targetDateObj.getFullYear() + "-";
	targetDate += (targetDateObj.getMonth() + 1) + "-";
	targetDate += targetDateObj.getDate();
	
	return new Date(targetDate + " 12:00:00");
}

function getRowdayHangle(cmpDateObj, stdDateObj = new Date()) {
	const oneDay = 86400000;
	var d1 = stdDateObj.getTime();
	var d2 = cmpDateObj.getTime();
	var i = 0;
	
	// 비교하려는 날(d2)이 기준일(d1)에 대해 오늘/내일/모레 중 어느 것인지
	while (true) {
		if ((d1 + oneDay * i) == d2) {
			switch (i) {
				case 0: return "오늘";
				case 1: return "내일";
				case 2: return "모레";
			}
			return i + "일 후";
		}
		i += 1;
	}
}

function getDgreeHumidity(temperature, humidity) {
	// 습도 분류 기준은 뉴스 참고 (https://www.korea.kr/news/healthView.do?newsId=148780861)
	if (temperature >= 27) {
		if (humidity >= 70) {
			return "높음 (" + humidity + "%)";
		}
		if (humidity > 65) {
			return "적정 (" + humidity + "%)";
		}
		return "낮음 (" + humidity + "%)";
	}
	if (temperature >= 24) {
		if (humidity >= 45) {
			return "높음 (" + humidity + "%)";
		}
		if (humidity > 35) {
			return "적정 (" + humidity + "%)";
		}
		return "낮음 (" + humidity + "%)";
	}
	if (temperature >= 21) {
		if (humidity >= 55) {
			return "높음";
		}
		if (humidity > 45) {
			return "적정 (" + humidity + "%)";
		}
		return "낮음 (" + humidity + "%)";
	}
	if (temperature >= 18) {
		if (humidity >= 65) {
			return "높음 (" + humidity + "%)";
		}
		if (humidity > 55) {
			return "적정 (" + humidity + "%)";
		}
		return "낮음 (" + humidity + "%)";
	}
	if (temperature >= 10) {
		if (humidity >= 75) {
			return "높음 (" + humidity + "%)";
		}
		if (humidity > 65) {
			return "적정 (" + humidity + "%)";
		}
		return "낮음 (" + humidity + "%)";
	}
	// 온도가 10도 이하일때
	if (humidity >= 30) {
		return "높음 (" + humidity + "%)";
	}
	if (humidity > 20) {
		return "적정 (" + humidity + "%)";
	}
	return "낮음 (" + humidity + "%)";
}
