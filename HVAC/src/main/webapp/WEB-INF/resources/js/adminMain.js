const incomeFn = (data) => {
	console.log('gdsss');
	
	console.log(data);
	var url = "/test/admin/income";
	fetch(url, {
		method: "POST",
		async: false,
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(data),
	})
	.then(response => {
			return response.json();
	})
	.then(json => {
		if(json.result == "success") {
			if(data.type == 'month'){
				const monthlyIncome = json.income;
				$('#month_name').text(data.year+ '-' +data.month);
				$('#monthlyIncome').text(formatKRW(monthlyIncome));
			} else if(data.type == 'year'){
				const yearlyIncome = json.income;
				$('#year_name').text(data.year);
				$('#yearlyIncome').text(formatKRW(yearlyIncome));
			}
		}
	})
}


var today = new Date();

// 이번년도 이번달 월 매출
let monthData = {
		type: 'month',
		year: today.getFullYear(),
		month: today.getMonth() + 1
};
incomeFn(monthData);

//	이번년도 연 매출
let yearData = {
		type: 'year',
		year: today.getFullYear()
};
incomeFn(yearData);


//	처리되지않은 문의요청 갯수 조회
var url = "/test/adminQuestion/unfinishedCount";

fetch(url, {
	method: "POST",
	async: false,
})
.then(response => {
		return response.json();
})
.then(json => {
	if(json.result == "success") {
		const unfinishedCount = json.unfinishedCount;
		$('#question_input').text(unfinishedCount);
	}
})


//	 왼쪽 버튼
$('.bi-chevron-left').click((context) => {
	console.log('왼쪽');
	
	// 클릭한 요소의 년도가 적인 span을 target으로 설정
	const target = $(context.currentTarget).closest('.card').find('.date');
	
	const dateText = target.text();		// 2023-12 or 2023
	const date = dateText.split('-');	// ['2023', '12'] or ['2023'] 
	const date_length = date.length;	// 1 or 2
	
	
	// 년별
	if(date_length == 1){
		
		let yearData = {
				type: 'year',
				year: Number(date[0]) - 1
		};
		incomeFn(yearData);
	
	// 월별
	} else if(date_length == 2){
		
		let monthData = {
				type: 'month',
				year: Number(date[0]),
				month: Number(date[1]) - 1
		};
		// 1월일경우 년도를 넘겨주는 처리
		if(monthData.month == 0){
			monthData.month = 12;
			monthData.year -= 1;
		}
		incomeFn(monthData);
	}
	
	
})

//	오른쪽  버튼
$('.bi-chevron-right').click((context) => {
	console.log('오른쪽');
	
	// 클릭한 요소의 년도가 적인 span을 target으로 설정
	const target = $(context.currentTarget).closest('.card').find('.date');
	
	const dateText = target.text();		// 2023-12 or 2023
	const date = dateText.split('-');	// ['2023', '12'] or ['2023'] 
	const date_length = date.length;	// 1 or 2
	
	if(date_length == 1){
		
		let yearData = {
				type: 'year',
				year: Number(date[0]) + 1
		};
		incomeFn(yearData);
	
	// 월별
	} else if(date_length == 2){
		
		let monthData = {
				type: 'month',
				year: Number(date[0]),
				month: Number(date[1]) + 1
		};
		// 1월일경우 년도를 넘겨주는 처리
		if(monthData.month == 13){
			monthData.month = 1;
			monthData.year += 1;
		}
		incomeFn(monthData);
	}
})






//한국 돈 numberFormat
function formatKRW(number) {
	return new Intl.NumberFormat('ko-KR').format(number) + '원';
}

