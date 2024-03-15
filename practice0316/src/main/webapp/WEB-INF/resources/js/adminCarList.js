// 파일 업로드 함수
function photoView(event) {
	$('#output').attr('src', URL.createObjectURL(event.target.files[0]));
}

function updateValue(value) {
    document.getElementById("limitValue").textContent = value;
}

// 키워드 생성
fetch("/test/adminkeyword/keywordOpstion", {
	method: "POST",
})
.then(response => {
	return response.json();
})
.then(json => {
	if(json.result == "success") {
		var keywordList = JSON.parse(json.keywordList);
		
		console.log(keywordList);
		
		var keyword_print = "<h4>키워드 적용</h4>";
		
		$.each(keywordList, function (index, list) {
			keyword_print += '<input type="checkbox" value="'+list+'" data-toggle="toggle" data-width="120" data-height="40" data-on="' +list+ '" data-off="' +list+ '"/>';
		})
		
		$('#keyword_box').hide();
		$('#keyword_box > div').html(keyword_print);
		
	}
})


$(() => {
//	전체 체크박스 클릭
	$('#allCheck').click((context) => {
		var target_is = $(context.currentTarget).prop('checked');
		
		$('.check').prop('checked', target_is);
	})
	
	
//	리스트 클릭시 car_idx 가져옴
	$('.list-item').children().click((context) => {
		const target = $(context.currentTarget);
		const $check = target.siblings().addBack().first();
		const checkBox = $check.find('.check');
		
		if(!target.is($check)){
			checkBox.prop('checked',!checkBox.prop('checked'));
		}
		
		if (!checkBox.prop('checked')) {
			$("#allCheck").prop("checked", false);
		}
		
	});

	
	
//	추가하기 버튼 클릭 모달창 생성 select박스로 option 전달
	$('#show_modal').click(() => {
		
		create_opstions();
		
		$('#output').removeAttr('src');
		
		$('#keyword_box').hide();
		$('#info_add_btn').show();
		$('#info_select_btn').show();
		$('#infoInsert_form').hide();
		$('#carInsert_form').hide();
		$('#back_put_group').hide();
		$('#info_delete_btn').hide();
		$('#carInsert_btn').hide();
		
	});
	
	
//	선택한 차량 정보를 Table에 띄우기
	$('#info_select_btn').click(() => {
		
		const data = select_option_idx();
		
		const url = "/test/admin/selectedCarinfo";
		
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},
			body: data.toString()
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var carInfo = JSON.parse(json.carInfo);

				
				var carInfo_print = "";
				carInfo_print += 
					'<input id="carInfo_idx" value="' +carInfo.carInfo_idx+ '" hidden/>' +
					'<td>' +carInfo.maker+ '</td>' +
					'<td>' +carInfo.model+ '</td>' +
					'<td>' +carInfo.series+ '</td>' +
					'<td>' +carInfo.type+ '</td>' +
					'<td>' +carInfo.fuel+ '</td>' +
					'<td>' +carInfo.fuelRatio+ '</td>' +
					'<td>' +carInfo.transmission+ '</td>' +
					'<td>' +carInfo.seatCount+ '</td>';

				$('#selectedCar').html(carInfo_print);
				$('#output').attr('src', '/upload/' +carInfo.image)
				
				$('#carInsert_form').show();
				$('#infoInsert_form').show();
				$('#info_add_btn').show();
				$('#carInsert_btn').show();
				$('#info_delete_btn').show();
				$('#back_put_group').hide();
				$('#image_box').hide();
			}
		})
	})
	
	
//	새로운 차량 추가를 위해 창 띠우기
	$('#info_add_btn').click((context) => {	
		
		const is = confirm('새로운 차량을 추가하시겠습니까?');
		if(!is){
			return;
		}
		
		$('#output').removeAttr('src');
		
		var carInfo_print = "";
		var keyword_print = "";
		
		carInfo_print += 
			'<td><input class="form-control" name="maker" placeholder="기아,제네시스..."></td>' +
			'<td><input class="form-control" name="model" placeholder="K3,G70..."></td>' +
			'<td><input class="form-control" name="series" placeholder="올뉴,안적으셔도 됩니다."></td>' +
			'<td>' +
				'<select class="form-control text-center" name="type">' +
					'<option>소형</option>' +
					'<option>중형</option>' +
					'<option>대형</option>' +
				'</select>' +
			'</td>' +
			'<td>' +
				'<select class="form-control text-center" name="fuel">' +
					'<option>휘발유</option>' +
					'<option>경유</option>' +
					'<option>전기</option>' +
				'</select>' +
			'</td>' +
			'<td><input class="form-control" name="fuelRatio" placeholder="8.8 ~ 11.2km"></td>' +
			'<td>' +
				'<select class="form-control text-center" name="transmission">' +
					'<option>자동</option>' +
					'<option>수동</option>' +
				'</select>' +
			'</td>' +
			'<td><input class="form-control" type="text" name="seatCount" autocomplete="off"></td>';
			
		keyword_print +=
			'<h4>키워드 적용</h4>';
		
		
		$('#selectedCar').html(carInfo_print);
		
		$('#image_box').show();
		$('#keyword_box').show();
		$('#infoInsert_form').show();
		$('#back_put_group').show();
		$('#carInsert_form').hide();
		$('#info_add_btn').hide();
		$('#carInsert_btn').hide();
		$('#info_select_btn').hide();
		$('#info_delete_btn').hide();
	})
	
//	돌아가기 버튼
	$('#info_back_btn').click(() => {
		
		$('#output').removeAttr('src');
		
		$('#keyword_box').hide();
		$('#info_add_btn').show();
		$('#info_select_btn').show();
		$('#infoInsert_form').hide();
		$('#carInsert_form').hide();
		$('#back_put_group').hide();
		$('#info_delete_btn').hide();
	})
	
//	새로운 차량정보 등록하기
	$('#info_put_btn').click(() => {
		
		const form_list = $('#selectedCar').find('input.form-control');
		
		var form_is = false;
		
		$.each(form_list, function (index, list) {
			console.log($(list).val());
			if(index == 2){
				return true;
			}	
			if($(list).val().length == 0){
				form_is = true;
				return;
			}
		})
		
		if(form_is){
			alert('정보를 입력해주세요');
			return;
		}
		
		const is = confirm('차량정보를 등록하시겠습니까?'); 
		if(!is){return;}
		

		$('#infoInsert_form').submit();
		
		fetch("/test/admin/car/lastCarinfo_idx", {
			method: "POST",
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var carinfo_idx = json.carinfo_idx;
				
				var keywordList = $('#keyword_box input[type=checkbox]:checked');
				console.log(keywordList);
				
				var data = {
						name: [],
						carinfo_idx: carinfo_idx
				}
				
				$.each(keywordList, (index, list) => {
					data.name.push($(list).val());
				});
				keywordInsert(data);
			}
		})
//		

			
		
//		
//		
//		키워드 저장
		setTimeout(() => {
			alert('등록되었습니다.');
			
			$('#output').removeAttr('src');
			
			$('#keyword_box').hide();
			$('#infoInsert_form').hide();
			$('#info_select_btn').show();
			$('#info_delete_btn').hide();
			
			$('#info_add_btn').toggle();
			$('#back_put_group').toggle();
			create_opstions();
		}, 500);
			
	});
	
//	새로운 차 등록하기

	$('#carInsert_btn').click(() => {
		
		if(!$('input[name=carNumber]').val()){
			alert('차량번호를 입력하세요');
			return;
		};
		if(!$('input[name=year]').val()){
			alert('차량연식을 입력하세요');
			return;
		};
		if(!$('input[name=dayCost]').val()){
			alert('1일 대여 요금을 입력하세요');
			return;
		};
		if(isNaN($('input[name=dayCost]').val())){
			alert('숫자만 입력해주세요');
			return;
		}
		
		const is = confirm('차량을 등록하시겠습니까?');
		if(!is){
			return;
		}
		
		const data = select_option_idx();
		
		const url = "/test/admin/selectedCarinfo";
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},
			body: data.toString()
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var carInfo = JSON.parse(json.carInfo);
				const carInfo_idx = carInfo.carInfo_idx;
//				졸라신기함
//				console.log(carNumber, year, dayCost, carInfo_idx);
				console.log(carInfo_idx);
				$('input[name=carInfo_idx').val(carInfo_idx);
				
				$('#carInsert_form').submit();
				
				setTimeout(() => {
					alert('차량 등록완료');
					location.reload();
				}, 500);

				
			}
					
		})
	})
//	차량상태 변경하기 (모달)버튼
	$('#status_show_modal').click(() => {
		
		const box_checked = $('.check:checked');
		
		if(box_checked.length == 0){
			alert('변경할 차량을 선택하세요.');
			$('#status_modal').modal('hide');
			return;
		}
		$('#status_modal').modal('show');
	});
	
//	(차량상태) 변경하기 버튼
	$('#car_update_btn').click(() => {

		const select_option = $('#radio_box input:checked').val();
		const is = confirm('차량 상태를 ' +select_option+ '로 변경하시겠습니까?');
		if(!is){return;}
		
		const box_checked = $('.check:checked');
		const data = {
				car_idx: [],
				status: select_option
		}
		$.each(box_checked, function (index, elm) {
			data.car_idx.push($(elm).val());
		})
		
		const url = "/test/admin/carUpdate";
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
				
				setTimeout(() => {
					alert('변경완료');
					location.reload();
				}, 500);
			}
		})

	});

		
		
		
		

	

//	차량 삭제하기
	$('#car_delete_btn').click(() => {
		const box_checked = $('.check:checked');
		
		if(box_checked.length == 0){
			alert('삭제할 차량을 선택하세요.');
			return;
		}
		
		const is = confirm('삭제하시겠습니까?');
		if(!is){return;}
		
		const data = {
			car_idx: []
		}
		
		$.each(box_checked, function (index, elm) {
			data.car_idx.push($(elm).val());
		})
		
		const url = "/test/admin/carDelete";
		
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
				
				setTimeout(() => {
					alert('삭제완료');
					location.reload();
				}, 500);
			}
		})
		
		
	})
	
	
	
//	차량정보 삭제
	$('#info_delete_btn').click(() => {
		const is = confirm('차량정보를 삭제하시겠습니까?');
		if(!is){
			return;
		}
		
		
		const carInfo_idx = $('#carInfo_idx').val();
		console.log(carInfo_idx);
		const data = carInfo_idx;
		console.log(typeof data);
		const url = "/test/admin/carInfoDelete";
		fetch(url, {
			method: "POST",
			headers: {
				"Content-Type": "text/plain",
			},	
			body: data
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				setTimeout(() => {
					alert('삭제완료');
					
					$('#output').removeAttr('src');
					
					$('#infoInsert_form').hide();
					$('#carInsert_form').hide();
					$('#info_delete_btn').hide();
					
					create_opstions();
				}, 500);
			}
		})
		
		
	})
//	carList 전체보기
	$('#total_btn').click(() => {
		
		const summarys = $('.summary');
		
		$.each(summarys, function (index, summary) {
			$(summary).show();
		})
		
		$('#carTable').removeAttr('style');
		$('#carTable').parent().attr('class', 'col-lg-12');
		
	})
//	carList 요약보기
$('#summary_btn').click(() => {
		
	const summarys = $('.summary');
	
	$.each(summarys, function (index, summary) {
		$(summary).hide();
	})

	$('#carTable').attr('style', 'width: 600px;');
	$('#carTable').parent().attr('class', 'col-lg-12 d-flex justify-content-center');
	
})
	const keywordInsert = data => {
		console.log(data);
		const url = '/test/adminkeyword/keywordInsert';
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
				console.log('키워드 성공');
			}
		})
		
	}
	
	
	
	
	const create_opstions = () => {
		const url = "/test/admin/carinfo";
		// 데이터 조회
		fetch(url, {
			method: "POST"
		})
		.then(response => {
			return response.json();
		})
		.then(json => {
			if(json.result == "success") {
				var infoList = JSON.parse(json.infoList);
				console.log(infoList);
				return infoList.list;
			}
		})
		.then(list => {
			const target = $('#info_select');

			var option = '';
			
			$.each(list, function (index, info) {
				option += '<option>' +info.model+ ' ' +info.series+ '</option>';
			})
			
			target.html(option);
		})
	}
	
	const select_option_idx = () => {
		var idx;
		const options = $('#info_select').children();
		const selected = $('#info_select').val();
		$.each(options, function (index, option) {
			
			if($(option).val() == selected){
				idx = index + 1;
				return;
			}
			
		})
		return idx;
	}
	
	
});

