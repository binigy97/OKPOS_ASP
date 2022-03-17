// yyyy-MM-dd
// dateObj : new Date() 객체
function getFormattingCurrentDate(dateObj, delimiter = "-") {
	var nowDate = "";
	
	// String.slice(-2) : 문자열을 뒤에서 2개 자름
	nowDate += dateObj.getFullYear() + delimiter;
	nowDate += ("0" + (dateObj.getMonth() + 1)).slice(-2) + delimiter;
	nowDate += ("0" + dateObj.getDate()).slice(-2);
	
	return nowDate;
}

// HH:mm:ss
function getFormattingCurrentTime(dateObj, delimiter = ":") {
	var nowTime = "";
	
	nowTime += ("0" + dateObj.getHours()).slice(-2) + delimiter;
	nowTime += ("0" + dateObj.getMinutes()).slice(-2) + delimiter;
	nowTime += ("0" + dateObj.getSeconds()).slice(-2);
	
	return nowTime;
}

// 요일
function getFormattingCurrentWeek(dateObj) {
	const WEEK = new Array('일', '월', '화', '수', '목', '금', '토');
	var day = dateObj.getDay();
	
	switch(day) {
		case 0: return WEEK[0];
		case 1: return WEEK[1];
		case 2: return WEEK[2];
		case 3: return WEEK[3];
		case 4: return WEEK[4];
		case 5: return WEEK[5];
		case 6: return WEEK[6];
	}
}
