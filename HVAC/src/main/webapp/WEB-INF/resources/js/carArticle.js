$(() => {
	/* 날짜창 띄우기 (날짜 클릭)*/
	$('#rental_day').click(() => {
		console.log('gd');
		$('#rental_day').toggle();
		$('#rental_schedule').toggle();
	});
	
	/* 결과창 띄우기 (일정선택완료 클릭)*/
	$('#schedule_select').click(() => {
		
		const rental_str = $('input[name=rentalDate]').val();
		const due_str = $('input[name=dueDate]').val();

		const result = rental_str+ ' ~ ' +due_str;
		
		$('#date_result').html(result);

		
		const rentalDate = new Date(rental_str);
		const dueDate = new Date(due_str);
		const day = ( (dueDate - rentalDate) / 86400000 );
		
		const data = $('#data');
		data.attr('data-rental_date', rental_str);
		data.attr('data-due_date', due_str);
		
		
		const day_cost = $('#day_cost').text().replace('원', '').replace(',','').trim();
		const cost = Number(day_cost) * day;
		const cost_Fmt = cost.toLocaleString('ko-KR') + '원';
		
		const target = $('#total_cost');
		
		
		target.html(cost_Fmt);
		$('#rental_schedule').toggle();
		$('#rental_day').toggle();
	});
	
	/* 대여일 값 변경 시 반납일 조정 함수*/
	$('#rental_start').change(context => {
		var target = $(context.target);
		var dueDateObj = $('#rental_end');
		
		
		var rentalDate = new Date(target.val());
		rentalDate.setDate(rentalDate.getDate() + 1);
		var dueDate = rentalDate;
		var dueDateString = formatDate(dueDate, 'yyyy-MM-dd');

		// 입련되어 있던 값으로 날짜 크기 비교
		var rentalDate = new Date(target.val());
		var dueDate = new Date(dueDateObj.val());
		
		
		if(rentalDate >= dueDate){
			dueDateObj.attr('min', dueDateString);
			dueDateObj.val(dueDateString);
		} else {
			dueDateObj.attr('min', dueDateString);
		}

	});
	
	// simpleFomatDate 메소드
	const formatDate = (date, pattern) => {

		if(pattern ==  'yyyy-MM-dd'){
			const year = date.getFullYear();
			const month = String(date.getMonth() + 1).padStart(2, '0');
			const day = String(date.getDate()).padStart(2, '0');
			const fomatDate = year+ '-' +month+ '-' +day;
			return fomatDate;
		} else if(pattern == 'MM.dd(E)'){
			const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
			const month = date.getMonth() + 1; // 월은 0부터 시작하므로 +1
			const day = date.getDate();
			const dayOfWeek = date.getDay(); // 요일은 0(일요일)부터 6(토요일)까지
			
			// 월과 일이 한 자리 수인 경우 두 자리 수로 변경
			const formatMonth = month < 10 ? '0' + month : month;
			const formatDay = day < 10 ? '0' + day : day;
			
			const fomatDate = formattedMonth+ '.' +formattedDay+ '.(' +daysOfWeek[dayOfWeek]+ ')';
			
			return fomatDate;
		}
	}
	
	/* 결제하기 */
	$('#data').parent().click(() => {
		var is = confirm("예약하는거 확실해?");
		if(!is) {return;}
		
		var target_text = $('#total_cost').text();
		var totalCost = target_text.replace('원', '').replace(',','').trim();
		var tc = parseFloat(totalCost);
		
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp10626336");
	    IMP.request_pay({
	        pg: 'kakaopay',
	        pay_method: 'card',
	        merchant_uid: 'merchant_' + new Date().getTime(),
	        name: '고대일',
	        amount: tc,
	        buyer_email: 'ktym14452@naver.com',
	        buyer_name: '${sessionScope.memberName}',
	        buyer_tel: '010-2563-1675',
	        buyer_addr: 'addr',
	        buyer_postcode: '123-456'
	    }, function (data) {
	        if (data.success) {
	            var msg = "결제 완료";
	            msg += '고유ID : ' + data.imp_uid;
	            msg += '// 상점 거래ID : ' + data.merchant_uid;
	            msg += '// 결제 금액 : ' + data.paid_amount;
	            msg += '// 카드 승인번호 : ' + data.apply_num;
	            execute(totalCost);
	            
	        } else {
	            var msg = "결제 실패: " + data.error_msg;
	            alert(msg);
	        }
	    });
	    
	    function execute(totalCost) {
			
			var target = $('#data');
		    var car_idx = target.data('car_idx');
		    var rentalDate = target.data('rental_date');
		    var dueDate = target.data('due_date');
		    
		    var data = {
	    		car_idx: car_idx,
	    		rentalDate: rentalDate,
	    		dueDate: dueDate,	
	    		totalCost: totalCost
			};
			
		    console.log(data);
		    
		    var url = "/test/rental/rental";
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
					window.location= '/test';
				}
			})
		}
	    
		
	});
	
});


