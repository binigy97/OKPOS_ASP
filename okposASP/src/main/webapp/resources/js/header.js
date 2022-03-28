$(function(){
	// 실시간 현재 시간 표시
	setLiveTime("#nowDateTime");
});

// 실시간 현재 시간 표시
function setLiveTime(targetId) {
	var date = new Date();
	
	$.getScript("/resources/js/FormattingDate.js", function(){
		var d = getFormattingCurrentDate(date).slice(-5); // MM-dd 형식을 위해 뒤에 5개 문자만 추출
		var t = getFormattingCurrentTime(date);
		$(targetId).text(d + " " + t);
	});
	
	// setTimeout(() => {func}, msec) : msec 후 func 호출
	setTimeout(() => {setLiveTime(targetId)}, 1000);
}
