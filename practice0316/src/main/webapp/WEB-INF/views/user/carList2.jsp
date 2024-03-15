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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/rental.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/rental2.js"></script>

	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
    저는 carList 페이지입니다.
    
    
    <div id="search_box" class="row my-5">
    	<div class="col d-flex justify-content-center ">
    		<div class="input-group" style=" width: 60%;">
				<span class="input-group-text">연료</span>
				<select class="form-select" id="fuel">
					<option value="전체" >전체</option>
					<option value="휘발유">휘발유</option>
					<option value="경유">경유</option>
					<option value="전기">전기</option>
				</select>
				<span class="input-group-text">차종</span>
				<select class="form-select" id="type">
					<option value="전체" >전체</option>
					<option value="경형" >경형</option>
					<option value="소형" >소형</option>
					<option value="중형" >중형</option>
					<option value="대형" >대형</option>
				</select>
				<span class="input-group-text">시승인원</span>
				<select class="form-select" id="seatCount">
					<option value="전체">전체</option>
					<option value="5인승 이하">5인승 이하</option>
					<option value="5인승 이상">5인승 초과</option>
				</select>
				<input id="search_btn" class="btn btn-primary" type="button" style="width: 100px;" value="검색"/>
			</div>
    	</div>
    	
    
    </div>
    
    
    
    
    
    
    
    
    
	<div id="carListContainer" class="row">
	</div>
	
	
	
<script type="text/javascript">
	/* 차 한건에 대한 예약하기 버튼 클릭시 예약 페이지로 넘어가기*/
	const reservation = (car_idx) => {
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