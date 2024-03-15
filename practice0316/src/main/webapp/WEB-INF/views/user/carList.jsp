<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content=""/>
<meta name="author" content=""/>
<title>HVAC-예약</title>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/rental.js"></script>
    
    <link rel="stylesheet"  href="<%= request.getContextPath()%>/css/style2.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
    
    <style type="text/css">
	    
	    .car-box{
	    	background-color: #E0DFD5;
	    	border-radius: 10px;
	    	padding-bottom: 10px;
	    	
	    }
	    
	    .car-artice{
	    	background-color: #F4F5F6;
	    	color:#313638;
	    	border-radius: 10px;
	    
	    }
	    
   	    .car-artice input[type="button"] {
	    	font-size: 1.1rem;
	    	font-weight:500;
	    	border: none;
	    	background: #F06543;
	    	color: #F4F5F6;
	    }
	    
	    .rental-box {
	    	background-color: white;
	    	border-radius: 10px;
	    	border: #313638;
	    	width: 450px;
	    	top: 200px;
	    	right: 0;
	    }
	    .rental-box tr:last-child{
	    	background: #F06543;
	    	font-weight:500;
	    	color: #F4F5F6;
	    }
	    .rental-box tr:last-child:hover{
	    	cursor: pointer;
	    }
	    
	    .rental-box table {
	    	color: #313638;
	 		order-collapse: collapse;
			border-radius: 10px;
			border-style: hidden;
			box-shadow: 0 0 0 1px #000;

	    }
	    
 	    .rental-box tr, .rental-box td {
	    	border-color: #E0DFD5;
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

</head>
<body>
	<!-- header-->
	<jsp:include page="/WEB-INF/views/layout/userHeader.jsp"/>
	
	<div id="carListContainer" style="width: 800px; margin: 0 auto;">
	</div>
	
	
	
	<div class="position-fixed p-1 rental-box">
		<table class="table-bordered">
			<tr>
				<td>
					<i class="bi bi-bell"></i> <span id="chk_result">전체 차량</span>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" class="btn-check" id="chk_all" checked="checked">
					<label class="btn btn-primary" for="chk_all">전체</label>
					<span class="chk_group">
						<input type="checkbox" class="btn-check" id="chk_ele">
						<label class="btn btn-primary" for="chk_ele">전기차</label>

						<input type="checkbox" class="btn-check" id="chk_die">
						<label class="btn btn-primary" for="chk_die">경유</label>

						<input type="checkbox" class="btn-check" id="chk_gas">
						<label class="btn btn-primary" for="chk_gas">휘발유</label>
						<br/>
						<input type="checkbox" class="btn-check" id="chk_sm">
						<label class="btn btn-primary" for="chk_sm">경형/소형</label>

						<input type="checkbox" class="btn-check" id="chk_big">
						<label class="btn btn-primary" for="chk_big">중형/대형</label>

						<input type="checkbox" class="btn-check" id="chk_five">
						<label class="btn btn-primary" for="chk_five">5인승</label>

						<input type="checkbox" class="btn-check" id="chk_five_over">
						<label class="btn btn-primary" for="chk_five_over">5인승 이상</label>
					</span>
					<!-- hidden -->
					<input type="hidden" name="fuel">
					<input type="hidden" name="type">
					<input type="hidden" name="seatCount">
				</td>
			</tr>
			<tr>	
				<td>
					<div id="search" class="m-3 text-center">조회하기</div>
				</td>
			</tr>				
		</table>
	</div>
	<form id="article" action="/test/car/article" method="post" hidden>
		<input name="car_idx"/>
	</form>
	<div id="data-container" data-carlist_json="${carList_json}"></div>
	
	
<script type="text/javascript">
	const carList = ${carList_json};
	const list = carList.list;
	
	var carBox = '';
	
	var nextSame = false;
	
	for(var i = 0; i < list.length; i ++) {
		var car = list[i];
		
		carBox += nextSame ? onlydata(car) : open(car);
		if(i != list.length - 1){
			
			if(list[i].model == list[i+1].model){
				//같다.
				nextSame = true;
			}else {
				// 다르다. 닫아준다.
				nextSame = false;
				carBox += close();
			}
		}
	}
	
	carBox += close();
	$('#carListContainer').html(carBox);
	
	
	
	const checkedList = $('.rental-box input[type="checkbox"]:checked');
	
	$.each(checkedList, (index, doc) => {
		/* $(doc).next().css('background', '#F09D51').css('color', 'black'); */
	})
	
	const checkboxList = $('.rental-box label');
	
/* 	$.each(checkboxList, (index, doc) => {
		$(doc).hover(
			context => {
				const target = $(context.currentTarget);
				
    			target.css('color', '#F06543');
			},
			context => {
				const target = $(context.currentTarget);
    			target.css('color', '#F09D51');
			}
		
		
		
		)
	}) */
	
	
	
	
	
	
	
	
	/* 차 한건에 대한 예약하기 버튼 클릭시 예약 페이지로 넘어가기*/
	const reservation = car_idx => {
		var userID = "${memberID}";
		
		if(userID == ''){
			if(confirm('로그인이 필요합니다.\r\n 로그인페이지로 이동하시겠습니까?')){
				location.href='<%= request.getContextPath() %>/login/login.do';
			}
			return false;
		} else {
			$('#article input[name=car_idx]').val(car_idx);
			
			$('#article').submit(); 
			
		}
		
	};
	
	
	
    
</script>
	
    <script src="../js/scripts_main.js"></script>	
</body>
</html>