$(() => {

	// 차종 브랜드 옵션 생성 및 이번년도 rentalList 출력
	fetch("/test/admin/car/typeOption", {
		method: "POST",
	})
	.then(response => {
		return response.json();
	})
	.then(json => {
		if(json.result == "success") {
			var typeList = JSON.parse(json.typeList);
			var makerList = JSON.parse(json.makerList);
			
			var type_option_print = '<option value="all">전체보기</option>';
			$.each(typeList, (index, type) => {
				type_option_print +=
					'<option value="' +type+ '">' +type+ '</option>';
			})
			$('#car_type').html(type_option_print);

			var maker_option_print = '<option value="all">전체보기</option>';
			$.each(makerList, (index, maker) => {
				maker_option_print +=
					'<option value="' +maker+ '">' +maker+ '</option>';
			})
			$('#car_maker').html(maker_option_print);
		}
		
		const today = new Date();
		const today_year = today.getFullYear();
		$('#rental_title').text(today_year + '년 랜트 차량');
		
		incomeList_Func();
	})
	
	
//	년별 버튼 클릭
	$('#dropdown-y').click(() => {
		$('#menu-m').hide();	

		const today = new Date();
		const today_year = today.getFullYear();
		
		for(var i = 0; i < 5; i++) {
			$('#menu-y li').eq(i).text(today_year - i);
		}
		
	})	

//	월별 버튼 클릭
	$('#dropdown-m').click(() => {
		const current_year = $('#rental_title').text().slice(0,4);	// 선택된 년도
		
		$('#year-text').text(current_year);
		$('#menu-m').toggle();
	});
	
	//왼쪽 옵션 클릭	
	$('#item-years span:first-child').click(() => {
		var year = Number($('#year-text').text());
		year -= 1;
		
		if(year == 0){
			alert('더이상 뒤로 갈수 없습니다.');
		}else {
			$('#year-text').text(year);
		}
	})
	//오른쪽 옵션 클릭
	$('#item-years span:last-child').click(() => {
		var year = Number($('#year-text').text());
		year += 1;
		$('#year-text').text(year);
	})
	
	
	
	
	
	
	
	

	
	
//	년 옵션 클릭
	$('#menu-y li').click((context) => {

		const target = $(context.currentTarget);
		const year = target.text();
		$('#rental_title').text(year + '년 랜트 차량');
		
		incomeList_Func();

	})	
	

//	1~12월 옵션 클릭
	$('#item-months span').click((context) => {
		const target = $(context.currentTarget);
		
		const year = $('#year-text').text();
		const month = target.text().replace('월', '');
		
		console.log(year, month);
		$('#rental_title').text(year + '년 ' + month+ '월 랜트 차량');
		
		incomeList_Func();
		
		$('#menu-m').hide();
	})
	
	
//	차종별로 보기
	$('#car_type').change(() => {
		incomeList_Func();
	})

	
//	브랜드별로 보기
	$('#car_maker').change(() => {
		incomeList_Func();
	})

	
	
	
// 해당 리스트 DB 조회해 가져오기
	const incomeList_Func = () => {
		
		const title = $('#rental_title').text();

		const type = $('#car_type').val();
		const maker = $('#car_maker').val();
		const year = title.slice(0,4);
		
	//	대제목에 월이 없다면 null를 있다면 가져온다.
		if(title.indexOf('월') != -1){
//			var month = title.slice(6,7);	//	10, 11, 12 2자리수 해결 못함	
			var year_month = title.split('월')[0];	//	2023년 10월
			var month = year_month.slice(6, year_month.length);
		}else{
			var month = null;
		}

		const data = {
				year: year,
				month: month,
				type: type,
				maker: maker
		}
		
		var url = "/test/admin/rentalList/month";
		fetch(url, {
			method: "POST",
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
				
				var rentalList = JSON.parse(json.rentalList);
				console.log(rentalList);
				
				var rental_print = '';	//	리스트 출력
				var total_cost = 0;		//	리스트 대여비용 총계 값
				$.each(rentalList, (index, rental) => {
					total_cost += rental.cost;
					rental_print +=
						'<tr class="text-center list-item">' +
							'<td>' + rental.carNumber + '</td>' +
							'<td class="' +rental.maker+ '">' + rental.maker + '</td>' +
							'<td>' + rental.model + ' ' + rental.series + '</td>' +
							'<td class="' +rental.type+ '">' + rental.type + '</td>' +
							'<td>' + new Intl.DateTimeFormat('ko-KR', { year: '2-digit', month: 'long', day: '2-digit' }).format(rental.rentalDate) + '</td>' +
							'<td>' + new Intl.DateTimeFormat('ko-KR', { year: '2-digit', month: 'long', day: '2-digit' }).format(rental.dueDate) + '</td>' +
							'<td>' + ((rental.dueDate - rental.rentalDate) / (1000 * 60 * 60 * 24)) + '일</td>' +
							'<td>' + rental.dayCost.toLocaleString('ko-KR') + '원' + '</td>' +
							'<td>' + rental.cost.toLocaleString('ko-KR') + '원' + '</td>' +
						'</tr>';
				})
				var cost_fmt = total_cost.toLocaleString('ko-KR') + '원';
				
				$('#total_cost').text(cost_fmt);
				$('#list-item').html(rental_print);
			}
		})
	}
	
//	incomeList_Func()에서 한번에 처리
//	매출 합계 함수
//	const totalCost_Func = () => {
//		
//		const rentalList = $('#list-item').children();	// rentalList
//		var cost = 0;
//		for(var i = 0; i < rentalList.length; i++) {
//			cost += Number(rentalList.eq(i).children().eq(8).text()	// text를 정제하고
//					.replace(',', '').replace('원',''));			// number로 바꾸고 합산한다.
//		}
//		var avg = Math.floor(cost / rentalList.length);				// 평균 후 버림으로 정수로 변환
//		var cost_fmt = cost.toLocaleString('ko-KR') + '원';
//		var avg_fmt = avg.toLocaleString('ko-KR') + '원';
//		$('#total_cost').text(cost_fmt);
//	}
	
	
})

