<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인페이지입니다.</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="../css/styles_main.css"/>
    <link rel="stylesheet" href="../css/style_index.css"/>
    
    <script type="text/javascript" src="js/rental.js"></script>
    
	    <style type="text/css">
	    
	    .chk_group label:nth-child(n) {
	    	margin: 2px 3px;
	    }
	    
	    .rental-box {
	    	width: 450px;
	    	border: 1px solid gray;
	    	top: 200px;
	    	right: 0;
	    }
	    
	    .rental-box rental-time {
	    	border: none;
	    }
	    
    	.map #map {
		  /* pointer-events: none; */
		  height: 100%;
		  width: 100%;
		  border: 0;
		}
		
		.content-section {
			padding: 2rem;
		}
		
		.service-icon:hover {
			color: #fff;
			background-color: rgb(236, 184, 7);
		}
		
		.service {
		  padding: 3rem 0;
		  background: linear-gradient(90deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.1) 100%), url("./images/bg-callout.jpg");
		  background-position: center center;
		  background-repeat: no-repeat;
		  background-size: cover;
		}
		
		.service h2, .service .h2 {
		  font-size: 3.5rem;
		  font-weight: 700;
		  display: block;
		  max-width: 30rem;
		}	
		
		.masthead {
    	  height: 100vh;
	  	}
    </style>
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 

</head>
<body>
	<!-- Navigation-->
    <a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
			<li class="sidebar-brand">
            	<c:choose>
				    <c:when test="${sessionScope.memberName == null}">
				    	<a class="menu_title" href="<%= request.getContextPath() %>/login/login.do">로그인</a>
				    </c:when>
				    <c:otherwise>
				    	<a href="<%=request.getContextPath()%>/member/info.do">${sessionScope.memberName} 님</a>
				    	&nbsp;&nbsp;
				    	<a href="<%=request.getContextPath()%>/login/logout.do"><i class="bi bi-box-arrow-right"></i></a>
				    </c:otherwise>
				</c:choose>
            </li>        
            <li class="sidebar-nav-item"><a href="#main">홈으로</a></li>
            <li class="sidebar-nav-item"><a href="<%= request.getContextPath()%>/login/register.do">임시 회원가입</a></li>
            <li class="sidebar-nav-item"><a href="#services">몰루</a></li>
            <li class="sidebar-nav-item"><a href="#promotion">어디루</a></li>
            <li class="sidebar-nav-item"><a href="<%= request.getContextPath()%>/rental/rentalPage">랜트카 조회하기</a></li>
        </ul>
    </nav>
    <a class="scroll-to-top rounded" href="#main"><i class="fas fa-angle-up"></i></a>
    저는 랜탈 페이지입니다.
	<div id="test">${carList}</div>
	<c:set var="carList" value="${carList}"/>
	
	<c:forEach var="car" items="${carList.list}">
		<div class="car-box">
			<div class="p-3 d-flex">
				<div>
					<%-- <img src="upload/maker/${car.maker}" alt="maker 사진"/> --%>
					<h4 class="car_maker">${car.maker}</h4>
					<h3 class="car_model">${car.model}</h3>
				</div>
				<div class="position-relative">
					<img class="car_img"
						src="<%= request.getContextPath()%>/images/car.png"
						width="300px"/>
				</div>
			</div>
			<!-- 차이름 가격 및 예약버튼  -->
			<div>
				<p class="car_series">${car.model} ${car.series}</p>
				<span class="car_option">${car.year}년식 · ${car.seatCount}인승</span>
			</div>
			<div>
				<span class="car_fee">${car.fee}</span>
				<input class="btn btn-primary car_url" type="button" value="예약하기"
					onclick="location.href='<%= request.getContextPath()%>/rental/article?car_idx=${car.car_idx}'">
			</div>
		</div>
	</c:forEach>
	
	
	<div class="form-control position-fixed p-1 rental-box">
		<table class="table-bordered form-control">
			<tr>
				<td>
					<i class="bi bi-clock"></i> 10.18(수) 14:30 ~ 10.19(목) 14:30
				</td>
			</tr>
			<tr>
				<td>
					<i class="bi bi-bell"></i> <span id="chk_result">전체 차량</span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" class="btn-check" id="chk_all" checked="checked">
					<label class="btn btn-outline-primary" for="chk_all">전체</label>
					<span class="chk_group">
						<input type="checkbox" class="btn-check" id="chk_ele">
						<label class="btn btn-outline-primary" for="chk_ele">전기차</label>

						<input type="checkbox" class="btn-check" id="chk_die">
						<label class="btn btn-outline-primary" for="chk_die">경유</label>

						<input type="checkbox" class="btn-check" id="chk_gas">
						<label class="btn btn-outline-primary" for="chk_gas">휘발유</label>
						<br/>
						<input type="checkbox" class="btn-check" id="chk_sm" name="type" value="경형">
						<label class="btn btn-outline-primary" for="chk_sm">경형/소형</label>

						<input type="checkbox" class="btn-check" id="chk_big">
						<label class="btn btn-outline-primary" for="chk_big">중형/대형</label>

						<input type="checkbox" class="btn-check" id="chk_five">
						<label class="btn btn-outline-primary" for="chk_five">5인승</label>

						<input type="checkbox" class="btn-check" id="chk_five_over">
						<label class="btn btn-outline-primary" for="chk_five_over">5인승 이상</label>
					</span>
				</td>
			</tr>
			<tr>	
				<td>
					<div id="search" class="m-3 text-center">조회하기</div>
				</td>
			</tr>				
		</table>
	</div>
	<script type="text/javascript">
		$('.chk_group input').click(() => {
			
			var ele = $('#chk_ele').prop('checked');
			var gas = $('#chk_gas').prop('checked');
			var die = $('#chk_die').prop('checked');
			var sm = $('#chk_sm').prop('checked');
			var big = $('#chk_big').prop('checked');
			var five = $('#chk_five').prop('checked');
			var five_over = $('#chk_five_over').prop('checked');
			var list = [ele, gas, die, sm, big, five, five_over];

			
			/* 검색 옵션 설정 */
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
		/* 전체 옵션 선택시 */
		$('#chk_all').click(() => {
			var all = $('#chk_all').prop('checked');
		
			if(all){
				$('.chk_group input').prop('checked', false);
			}
			$('#chk_all').prop('checked', true);
			$('#chk_result').html('전체 차량');
		});
		/* 조회 버튼 클릭시 submit 실행 */
		$('#search').click(() => {
			console.log('클릭');
			var all = $('#chk_all').prop('checked');

			if(all){
				$('.rental-box').submit();
			}else {
				
				var all = $('#chk_all').prop('checked');	// 전체 체크 여부
/*
				var ele = $('#chk_ele').prop('checked') ? ['전기차'] : [];			// 연료
				var gas = $('#chk_gas').prop('checked') ? ['휘발유'] : [];			// 연료
				var die = $('#chk_die').prop('checked') ? ['경유'] : [];			// 연료
				var sm = $('#chk_sm').prop('checked') ? ['소형', '경형'] : [];		// 차종
				var big = $('#chk_big').prop('checked') ? ['중형', '대형'] : [];	// 차종
				var five = $('#chk_five').prop('checked') ? [2, 3, 4, 5] : [];					// 탑승 인원
				var five_over = $('#chk_five_over').prop('checked') ? [6, 7, 8, 9, 10, 11] : [];// 탑승 인원
				
				var fuel = [...ele, ...gas, ...die];
				var type = [...sm, ...big];
				var seatCount = [...five, ...five_over];
				
				console.log('type', type);
				console.log('fuel', fuel);
				console.log('seatCount', seatCount);

				var data = {
						
					fuel: [{
						ele: ele,
						gas: gas,
						die, die
					}],
					type: [{
						
					}],
					seatCount
						
						
				}
*/	
					
				var data = {
					fuel: [],
					type: [],
					seatCount: []
				};
		
				if ($('#chk_ele').prop('checked')) {
					data.fuel.push('전기차');
				}
		
				if ($('#chk_gas').prop('checked')) {
					data.fuel.push('휘발유');
				}
		
				if ($('#chk_die').prop('checked')) {
				  data.fuel.push('경유');
				}
		
				if ($('#chk_sm').prop('checked')) {
				  data.type.push('소형', '경형');
				}
		
				if ($('#chk_big').prop('checked')) {
				  data.type.push('중형', '대형');
				}
		
				if ($('#chk_five').prop('checked')) {
				  data.seatCount.push('5인승');
				}
		
				if ($('#chk_five_over').prop('checked')) {
				  data.seatCount.push('5인승초과');
				}
					
				console.log(data)
				
				var url = "<%=request.getContextPath()%>/rental/search";
				
				// 렌탈 검색 요청 ajax
				fetch(url, {
					method: "POST",
					headers: {
						"Content-Type": "application/json",
					},
					body: JSON.stringify(data),
				})
				.then(response => {
					console.log('gg');
					return response.json();
				})
				.then(json => {
					if(json.result == "success") {
						
						var carList = JSON.parse(json.carList);
						
						window.location = `<%= request.getContextPath() %>/user/test?carList=${carList}`;
						console.log(typeof JSON.parse(json.carList));
						console.log(JSON.parse(json.carList).list[0].maker);
					}
				})
				.catch((error) => console.log("error:", alert(error)))
				
				
			}				
		});
	</script>
	
    <script src="../js/scripts_main.js"></script>	
</body>
</html>