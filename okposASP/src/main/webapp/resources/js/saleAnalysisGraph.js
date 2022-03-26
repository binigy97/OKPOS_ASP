const SABOARD = $("#saleAnalysisTable .saBoard");
const SABOARD_REGDATE = $("#saleAnalysisTable .saBoardRegdate");
const SABOARD_CODE = $("#saleAnalysisTable .saBoardCode");
const SABOARD_WEEK = $("#saleAnalysisTable .saBoardWeek");
const SABOARD_MONTH = $("#saleAnalysisTable .saBoardMonth");

const RADIO = $('#saleAnalysis input[type="radio"]:checked');
const BTN = $("#saleAnalysis input[type='button']");
const BTN_ACTIVE = $("#saleAnalysis input[type='button'].active");

const TITLE0 = "일자별 매출내역 (1주간)";
const TITLE1 = "상품별 매출내역 (1주간)";
const TITLE2 = "요일별 매출내역 (4주간)";
const TITLE3 = "월별 매출내역 (1년)";

// chart.js는 javascript를 위한 method로 정의되어 있음 (가급적 js 사용)
// drawing space
var canvas_wrapper = $('#saleAnalysisGraph');
var canvas = document.querySelector('#saleAnalysisGraph > canvas');
var context = reset_canvas();

// drawing chart
let graphType = RADIO.val();
let [dataLabels, datasetData] = getLabels(BTN_ACTIVE.val());
new Chart(context, myGraphConfig(graphType, dataLabels, TITLE0, datasetData));

// input[radio] click event for defining chart type
$('#saleAnalysis input[type="radio"]').click(function(){
	context = reset_canvas();
	
	graphType = $(this).val();
	let [dataLabels, datasetData] = getLabels(BTN_ACTIVE.val());
	switch(BTN_ACTIVE.val()) {
		case BTN.eq(0).val():
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE0, datasetData));
			break;
		case BTN.eq(1).val():
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE1, datasetData));
			break;
		case BTN.eq(2).val():
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE2, datasetData));
			break;
		case BTN.eq(3).val():
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE3, datasetData));
	}
});

// input[button] click event for changing table/chart data
SABOARD.css("display", "none");
SABOARD_REGDATE.css("display", "");

BTN.click(function(){
	// 활성화 버튼 모양 바꾸기
	BTN.removeClass("active");
	$(this).addClass("active");
	// 표 내용 바꾸기
	var tableTitle = $('#saleAnalysisTable tr:first-child td:nth-child(2)');
	switch($(this).val()) {
		case BTN.eq(0).val():
			SABOARD.css("display", "none");
			SABOARD_REGDATE.css("display", "");
			tableTitle.text("일자");
			
			context = reset_canvas();
			[dataLabels, datasetData] = getLabels($(this).val());
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE0, datasetData));
			break;
		case BTN.eq(1).val():
			SABOARD.css("display", "none");
			SABOARD_CODE.css("display", "");
			tableTitle.text("상품코드");
			
			context = reset_canvas();
			[dataLabels, datasetData] = getLabels($(this).val());
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE1, datasetData));
			break;
		case BTN.eq(2).val():
			SABOARD.css("display", "none");
			SABOARD_WEEK.css("display", "");
			tableTitle.text("요일");
			
			context = reset_canvas();
			[dataLabels, datasetData] = getLabels($(this).val());
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE2, datasetData));
			break;
		case BTN.eq(3).val():
			SABOARD.css("display", "none");
			SABOARD_MONTH.css("display", "");
			tableTitle.text("월");
			
			context = reset_canvas();
			[dataLabels, datasetData] = getLabels($(this).val());
			new Chart(context, myGraphConfig(graphType, dataLabels, TITLE3, datasetData));
	}
});

/* ---------------------------------------------------------- */
// canvas 재생성 : hover -> 이전 chart, 새로운 chart가 계속 바뀌는 문제 해결
function reset_canvas() {
	canvas.remove();
	canvas_wrapper.append($('<canvas></canvas>'));
	canvas = document.querySelector('#saleAnalysisGraph > canvas');
	var context = canvas.getContext('2d');
	
	context.canvas.width = canvas_wrapper.width();
  	context.canvas.height = canvas_wrapper.height();
	
	return context;
}

// data label & datasets label
function getLabels(btn_active_val) {
	let dataLabels = []; // 차트의 x축 값
	let datasetData = []; // 자료의 y축 값
	
	switch(btn_active_val) {
		case BTN.eq(0).val(): // 일자별(1주)
			var regdate = $('#saleAnalysisTable .saBoardRegdate > .regdate').get(); // get() : 선택한 요소를 배열(Array)로 가져옴
			var money = $('#saleAnalysisTable .saBoardRegdate > .money').get();
			for (var i = 0; i < money.length; i++) {
				dataLabels.push(regdate[i].textContent.slice(5, 10)); // html(), text() 사용시 에러
				var m = money[i].textContent.replace(",", "");
				datasetData.push(parseInt(m));
			}
			break;
		case BTN.eq(1).val(): // 상품별(1주)
			var codeName = $('#saleAnalysisTable .saBoardCode > .codeName').get();
			money = $('#saleAnalysisTable .saBoardCode > .money').get();
			for (var i = 0; i < money.length; i++) {
				dataLabels.push(codeName[i].textContent);
				m = money[i].textContent.replace(",", "");
				datasetData.push(parseInt(m));
			}
			break;
		case BTN.eq(2).val(): // 요일별(4주)
			var codeWeek = $('#saleAnalysisTable .saBoardWeek > .codeWeek').get();
			money = $('#saleAnalysisTable .saBoardWeek > .money').get();
			for (var i = 0; i < money.length; i++) {
				dataLabels.push(codeWeek[i].textContent);
				m = money[i].textContent.replace(",", "");
				datasetData.push(parseInt(m));
			}
			break;
		case BTN.eq(3).val(): // 월별(1년)
			var month = $('#saleAnalysisTable .saBoardMonth > .month').get();
			money = $('#saleAnalysisTable .saBoardMonth > .money').get();
			for (var i = 0; i < money.length; i++) {
				dataLabels.push(month[i].textContent);
				m = money[i].textContent.replace(",", "");
				datasetData.push(parseInt(m));
			}
	}
	
	return [dataLabels, datasetData];
}

function myGraphConfig(graphType, dataLabels, optionTitle, datasetData) {
	let config = {
	    type: graphType, // 차트의 형태(bar, doughnut, ...)
	    data: { // 차트에 들어갈 데이터
	        labels: dataLabels, // x축
	        datasets: [{ //데이터
				label: optionTitle, // 범례 (그래프에 hover하면 범례와 값이 뜸)
	            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	            data: datasetData, // y축
	            backgroundColor: [
                    '#aecbe0', // 연하늘
                    '#e7c864', // 겨자
                    '#a9c35b', // 연녹
                    '#e7a983', // 연주황
                    '#5dadac', // 청녹
                    '#e2a9a8', // 연분홍
                    '#b88fb9', // 연보라
                    '#a9c35b' // 연녹
                ],
	            borderColor: [
                    '#a8bed4',
                    '#d8b237',
                    '#91af2b',
                    '#e0986a',
                    '#167070',
                    '#c76d6e',
                    '#683968',
                    '#91af2b'
                ],
	            borderWidth: 1 //경계선 굵기
	        }]
	    },
	    options: {
			plugins: {
				legend: { display: false },  // 범례 제거
				title: { // 차트 제목
				    display: true,
				    text: optionTitle,
					font: { 
						size: 15,
						weight: 'bold'
					},
					padding: {
	                    top: 0,
	                    bottom: 20
	                }
				},
				responsive: false,
		        scales: {
		            yAxes: [{
		                ticks: {beginAtZero: true}
		            }]
		        },
		    }
	    }
	};
	
	return config;
}
