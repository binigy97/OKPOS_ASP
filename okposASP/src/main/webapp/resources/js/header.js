$(function(){
	// 실시간 현재 시간 표시
	setLiveTime("#nowDateTime");	
});

// 실시간 현재 시간 표시
function setLiveTime(targetId) {
	var date = new Date();
	var nowDate = "";
	var nowTime = "";
	
	// String.slice(-2) : 문자열을 뒤에서 2개 자름
	//nowDate += date.getFullYear() + "-";
	nowDate += ("0" + (date.getMonth() + 1)).slice(-2) + "-";
	nowDate += ("0" + date.getDate()).slice(-2);
	
	nowTime += ("0" + date.getHours()).slice(-2) + ":";
	nowTime += ("0" + date.getMinutes()).slice(-2) + ":";
	nowTime += ("0" + date.getSeconds()).slice(-2);
	
	$(targetId).text(nowDate + " " + nowTime);
	
	// setTimeout(func, msec, funcArg) : msec초마다 func 호출(함수의 인자는 3번째 매개변수 이후에 ,로 나열)
	setTimeout(setLiveTime, 1000, targetId);
}
