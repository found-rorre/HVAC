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
	
//	생성하기 버튼 ( 추가하기버튼생성 )
	$('#show_modal').click(() => {
		$('#keywordInsert_btn').show();
	})
//	수정하기 버튼
	$('#update_btn').click(() => {
		
		const box_checked = $('.check:checked');
		if(box_checked.length == 0 || box_checked.length != 1){
			alert('수정할 키워드를 하나만 선택하세요.');
			return;
		}
		const is = confirm('수정하시겠습니까?');
		if(!is){return;}
		
		const target_tr = box_checked.closest('tr');
		$('input[name=name]').val(target_tr.children().eq(1).text());
		$('input[name=title]').val(target_tr.children().eq(2).text());
		$('#keywordUpdate_btn').show();
		$("#modal").modal('show');
		
	})
	$('#keywordUpdate_btn').click(() => {
		
		const keyword_idx = $('.check:checked').val();
		const name = $('input[name=name]').val();
		const title = $('input[name=title]').val();
		
		const data = {
				keyword_idx: keyword_idx,
				name: name,
				title: title
		}
		
		console.log(data);
		
		const url = "/test/admin/keywordUpdate";
		
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
					alert('수정완료');
					location.reload();
				}, 500);
			}
		})
		
	})
	
	
//	삭제
	$('#delete_btn').click(() => {
		console.log('delete_btn');
		
		const box_checked = $('.check:checked');
		
		
		if(box_checked.length == 0){
			alert('삭제할 키워드를 선택하세요.');
			return;
		}
		const is = confirm('삭제하시겠습니까?');
		if(!is){return;}
		
		const data = {
				keyword_idx: []
		}
		
		$.each(box_checked, function (index, elm) {
			data.keyword_idx.push($(elm).val());
		})
		
		
		const url = "/test/admin/keywordDelete";
		
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
//	생성하기
	$('#keywordInsert_btn').click(() => {
		$('#insert_form').submit();
		setTimeout(() => {
			alert('키워드가 추가되었습니다.');
			location.reload();
		}, 500);
	})
	
//	Close
	$('#modal_close').click(() => {
		
		$('input[name=name]').val('');
		$('input[name=title]').val('');
		
		$('#keywordInsert_btn').hide();
		$('#keywordUpdate_btn').hide();
	})
	
	
});