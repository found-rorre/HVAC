$(() => {
	
	
	
//	슬라이더 조작함수
	const slickInsert = (selector) => {
		$(selector).slick({
			slide: 'div',
			autoplay: true,
			variableWidth: true,
			centerMode: true,
			dots: true,
			slidesToScroll: 1,
			autoplaySpeed: 4000,
			nextArrow : '<i class="text-primary fs-3 mx-2 bi bi-arrow-right-circle"></i>',
			prevArrow : '<i class="text-primary fs-3 mx-2 bi bi-arrow-left-circle"></i>'
		});
	}
	
	// 키워드 갯수
	const kw_length = $('.autoplay').length;
	// 키워드의 이미지 갯수
	var img_length = $(selector).find('.keyword_img').length;

	for(var i = 0; i < kw_length; i++) {
		var selector = '#keyword_wrap_' + i;
		
		if(kw_length != 0){
			slickInsert(selector);
		}

		
	}
	
	// 슬라이더 이미지 클릭
	$('.autoplay .active_img').click((context) => {
		const target = $(context.currentTarget).parent().find('.car_idx');
		const car_idx = target.val();
		console.log(car_idx);
		
		const search_form = $('#dynamic_form');
		search_form.attr('action', '/test/car/article');
		search_form.attr('method', 'post');
		
		var input = $('<input type="hidden">');
		input.attr('name', 'car_idx').val(car_idx);
		
		search_form.append(input);
		
		search_form.submit();
		search_form.html('');
	});
	
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
		$('#rental-box .row:last-child').click(() => {
			var all = $('#chk_all').prop('checked');

			var data = {
					fuel: [],
					type: [],
					seatCount: []
			};
			if(!all){
				var ele = $('#chk_ele').prop('checked') ? ['전기차'] : [];			// 연료
				var gas = $('#chk_gas').prop('checked') ? ['휘발유'] : [];			// 연료
				var die = $('#chk_die').prop('checked') ? ['경유'] : [];			// 연료
				var sm = $('#chk_sm').prop('checked') ? ['소형', '경형'] : [];		// 차종
				var big = $('#chk_big').prop('checked') ? ['중형', '대형'] : [];	// 차종
				var five = $('#chk_five').prop('checked') ? ['5인승'] : [];					// 탑승 인원
				var five_over = $('#chk_five_over').prop('checked') ? ['5인승초과'] : [];	// 탑승 인원				
				
				data.fuel.push(...ele, ...gas, ...die);
				data.type.push(...sm, ...big);
				data.seatCount.push(...five, ...five_over);
			}
			console.log("data", data);
			
			const search_form = $('#dynamic_form');
			search_form.attr('action', '/test/car/search');
			
			$.each(data.fuel, (index, fuel) => {
				var input = $('<input type="hidden">');
				input.attr('name', 'fuel'+ index).val(fuel);
				
				search_form.append(input);
			})
			$.each(data.type, (index, type) => {
				var input = $('<input type="hidden">');
				input.attr('name', 'type'+ index).val(type);
				
				search_form.append(input);
			})
			$.each(data.seatCount, (index, seatCount) => {
				var input = $('<input type="hidden">');
				input.attr('name', 'seatCount'+ index).val(seatCount);
				
				search_form.append(input);
			})
			
			search_form.submit();
			search_form.html('');
		});

	
		
	
	
	

	
    
	
});