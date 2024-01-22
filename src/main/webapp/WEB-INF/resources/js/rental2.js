$(() => {
	
	/* 전체 옵션 선택시 */
	$('#chk_all').click(() => {
		var all = $('#chk_all').prop('checked');

		if(all){
			$('.chk_group input').prop('checked', false);
		}
		$('#chk_all').prop('checked', true);
		$('#chk_result').html('전체 차량');
	});

	/* 세부 옵션 선택시 */
	 $('.chk_group input').click(() => {
		 
		var ele = $('#chk_ele').prop('checked');
		var gas = $('#chk_gas').prop('checked');
		var die = $('#chk_die').prop('checked');
		var sm = $('#chk_sm').prop('checked');
		var big = $('#chk_big').prop('checked');
		var five = $('#chk_five').prop('checked');
		var five_over = $('#chk_five_over').prop('checked');
		var list = [ele, gas, die, sm, big, five, five_over];

			
		// 검색 옵션 설정
		if (sm == big && big == ele && ele == gas && gas == die && die == five && five == five_over) {
			$('#chk_all').prop('checked', true);
			$('.chk_group input').prop('checked', false);
			$('#chk_result').html('전체 차량');
		} else {
		    $('#chk_all').prop('checked', false);
		    var count = 0;
		    for (var i = 0; i < list.length; i++) {
				if(list[i]){
					count += 1;
				}
		    }
			$('#chk_result').html(count + '개 선택');
		}
	});
	/* 조회 버튼 클릭시 데이터 조회 */
	$('#search_btn').click(() => {

		var fuel = $('#fuel').val() != '전체' ? [$('#fuel').val()] : [];
		var type = $('#type').val() != '전체' ? [$('#type').val()] : [];
		var seatCount = $('#seatCount').val() != '전체' ? [$('#seatCount').val()] : [];
		
		console.log(fuel, type, seatCount);
		
		var data = {
				fuel: [...fuel],
				type: [...type],
				seatCount: [...seatCount]
		};

		console.log(data);
		

		const url = "/test/rental/search";
		// 데이터 조회
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
				var carList = JSON.parse(json.carList);
				console.log(carList);
				return carList.list;
			}
		})
		.then(list => {
			var carBox = '';
			console.log(list);
			
			var rentalDate = $('.rental_start').val();

			var dueDate = $('.rental_end').val();
//			var dueDate = new Date(dueDate);
			
			$.each(list, function (index, car) {
 				carBox +=
			    	'<div class="car-box col-md-6 col-lg-4">' +
		        		'<div class="row m-2">' +
			        		'<div class="col-6">' +
			        			'<h4 class="car_maker">' + car.maker + '</h4>' +
			        			'<h3 class="car_model">' + car.model + '</h3>' +
		        			'</div>' +
		        			'<div class="col-6 text-end">' +
		        				'<img style="width: 180px; height: 90px;" src="/test/images/logo/' +car.maker+ '.png" width="300px"/>' +
		        			'</div>' +
		        		'</div>' +
		        		'<div class="row m-2">' +
		        			'<div class="col-12 text-center">' +
		        				'<img class="car_img" src="/upload/' +car.image+ '" width="100%"/>' +
		        			'</div>' +
		        		'</div>' +
			        	
			        	'<div class="row m-2">' +
			        		'<h3 class="car_series">' + car.model + ' ' + car.series + '</h3>' +
			        	'</div>' +
			        	'<div class="row m-2">' +
				        	'<div class="col-8">' +
				        		'<span class="car_option">' + car.year + '년식 · ' + car.seatCount + '인승 · ' +car.type+ '</span>' +
				        	'</div>' +
				        	'<div class="col-4 text-end">' +
								'<span class="car_dayCost" style="font-size: 25px;">' +car.dayCost+ '원</span>' +
								'<input class="btn btn-primary"' +
									'style="margin-left: 13px;"' +
									'type="button" value="자세히보기"' +
									'onclick="reservation(' +car.car_idx+ ')"/>' +
					        '</div>' +
				        '</div>' +
					'</div>';
			});
			$('#carListContainer').html(carBox);
		})
	});
	
});



// simpleFomatDate 메소드
const formatDate = (date, pattern) => {

	if(pattern ==  'yyyy-MM-dd'){
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, '0');
		const day = String(date.getDate()).padStart(2, '0');
		
		const fomatDate = `${year}-${month}-${day}`;
		
		return fomatDate;
	} else if(pattern == 'MM.dd(E)'){
		const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
		const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
		const day = date.getDate();
		const dayOfWeek = date.getDay(); // 요일은 0(일요일)부터 6(토요일)까지
		
		// 월과 일이 한 자리 수인 경우 두 자리 수로 변경
		const formatMonth = month < 10 ? `0${month}` : month;
		const formatDay = day < 10 ? `0${day}` : day;
		
		const fomatDate = `${formattedMonth}.${formattedDay}.(${daysOfWeek[dayOfWeek]})`;
		
		return fomatDate;
	}
}












