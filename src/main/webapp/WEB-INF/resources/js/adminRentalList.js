$(() => {
	// 이번달 리스트 출력
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
			$('.car_type').html(type_option_print);

			var maker_option_print = '<option value="all">전체보기</option>';
			$.each(makerList, (index, maker) => {
				maker_option_print +=
					'<option value="' +maker+ '">' +maker+ '</option>';
			})
			$('.car_maker').html(maker_option_print);
		}
		totalCost_Func();
	})
	
//	매출 합계 함수
	const totalCost_Func = () => {
		console.log('확인');
		const rentalList = $('#list-item').children();	// rentalList
		console.log(rentalList);
		var cost = 0;
		for(var i = 0; i < rentalList.length; i++) {
			cost += Number(rentalList.eq(i).children().eq(8).text()	// text를 정제하고
					.replace(',', '').replace('원',''));			// number로 바꾸고 합산한다.
		}
		console.log(cost);
		var avg = Math.floor(cost / rentalList.length);				// 평균 후 버림으로 정수로 변환
		var cost_fmt = cost.toLocaleString('ko-KR') + '원';
		var avg_fmt = avg.toLocaleString('ko-KR') + '원';
		$('#total_cost').text(cost_fmt);
	}
	
	
	
//차종별로 보기
	$('.car_type').change(() => {
		option_Func();
		totalCost_Func();
	})

//	브랜드별로 보기
	$('.car_maker').change(() => {
		option_Func();
		totalCost_Func();
	})
// 차종, 브랜드별 보기 함수
	const option_Func = () => {
		$('#list-item > tr').show();
		const rentalList = $('#list-item').children();	// rentalList
		
		const type = $('.car_type').val();
		const maker = $('.car_maker').val();

		const type_class  = (type  == 'all') ? '*' : '.' +type;	// 선택한 차종
		const maker_class = (maker == 'all') ? '*' : '.' +maker;// 선택한 브랜드
		
		$('#list-item > tr').hide();
		$('#list-item > tr:has('+type_class+'):has('+maker_class+')').show();
		
		// 같은 조건
//		rentalList.find('+type_class+').parent().find('+maker_class+').parent();
//		$('#list-item > tr:has('+type_class+'):has('+maker_class+')').show();
		
	}
	
//	리스트 클릭시 car_idx 가져옴
	$('#list-item tr').click((context) => {
		var tr_target = $(context.currentTarget);
		console.log(tr_target);
		var checkBox = tr_target.find('.check');
		checkBox.prop('checked',!checkBox.prop('checked'));
		
	});
	
//	년별 버튼 클릭
	$('#dropdown-y').click(() => {
		$('#menu-m').hide();	

		const today = new Date();
		const today_year = today.getFullYear();
		
		let year_print = '';
		
		for(var i = 0; i < 5; i++) {
			$('#menu-y li').eq(i).text(today_year - i);
		}
		
	})
	
//	년 옵션 클릭
	$('#menu-y li').click((context) => {

		const target = $(context.currentTarget);
		const year = target.text();
		
		const data = {
				year: year,
				month: null
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
				console.log('gdgd');
				var rentalList = JSON.parse(json.rentalList);
				console.log(rentalList);
				
				var rental_print = '';
				$.each(rentalList, (index, rental) => {
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
				$('#list-item').html(rental_print);
				$('#rental_title').text(data.year + '년 랜트 차량');
				$('.car_type :first-child').prop('selected', true);
				$('.car_maker :first-child').prop('selected', true);
				totalCost_Func();
			}
		})
	})	
	
//	월별 버튼 클릭
	$('#dropdown-m').click(() => {
		const today = new Date();
		const today_year = today.getFullYear(); 
		$('#year-text').text(today_year);
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
	// 1~12월 옵션 클릭
	$('#item-months span').click((context) => {
		const target = $(context.currentTarget);
		
		const year = Number($('#year-text').text());
		const month = target.text().replace('월', '');
		
		console.log(year, month);
		
		const data = {
				year: year,
				month: month
		}
		
		console.log(data);
		
		var url = "/test/admin/rentalList/month";
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
				var rentalList = JSON.parse(json.rentalList);
				console.log(rentalList);
				
				var rental_print = '';
				$.each(rentalList, (index, rental) => {
					rental_print +=
						'<tr class="text-center list-item">' +
							'<td><input type="checkbox" class="check" value="' + rental.car_idx + '"/></td>' +
							'<td>' + rental.carNumber + '</td>' +
							'<td>' + rental.maker + '</td>' +
							'<td>' + rental.model + ' ' + rental.series + '</td>' +
							'<td>' + rental.type + '</td>' +
							'<td>' + new Intl.DateTimeFormat('ko-KR', { year: '2-digit', month: 'long', day: '2-digit' }).format(rental.rentalDate) + '</td>' +
							'<td>' + new Intl.DateTimeFormat('ko-KR', { year: '2-digit', month: 'long', day: '2-digit' }).format(rental.dueDate) + '</td>' +
							'<td>' + ((rental.dueDate - rental.rentalDate) / (1000 * 60 * 60 * 24)) + '일</td>' +
							'<td>' + rental.dayCost.toLocaleString('ko-KR') + '원' + '</td>' +
							'<td>' + rental.cost.toLocaleString('ko-KR') + '원' + '</td>' +
						'</tr>';
					
				})
				$('#list-item').html(rental_print);
				$('#rental_title').text(data.year + '년 ' +data.month+ '월 랜트 차량');
				$('.car_type :first-child').prop('selected', true);
				$('.car_maker :first-child').prop('selected', true);
				totalCost_Func();
			}
		})
		
		
		$('#menu-m').hide();
	})
	
})

