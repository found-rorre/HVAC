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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<link rel="stylesheet"  href="../css/styles_main.css"/>
    <link rel="stylesheet" href="../css/style_index.css"/>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/carArticle.js"></script>
    <style type="text/css">


	#rental_schedule {
	}

	.img_wrap img {
		height: 300px;
	}
	.name_wrap img {
		width: 120px;
		height: 120px;
	}
	.detail_wrap span {
		font-size: 0.8rem;
	}
	.detail_wrap strong {
		font-size: 1.3rem;
	}

    
/* rental-box */
    #rental-box {
    	width: 100%;
    }
    
	#rental-box .row {
		padding: 10px 0;
		border: 1px solid black;
	
	}
	#rental-box .row:first-child {
		border-top-left-radius: 10px; 
		border-top-right-radius: 10px;
		cursor: pointer;
	}
	#rental-box #rental_schedule {
		border-top-left-radius: 10px; 
		border-top-right-radius: 10px;
		padding-bottom: 0;
	}
	#rental-box .row:last-child {
		border-bottom-left-radius: 10px; 
		border-bottom-right-radius: 10px;
		cursor: pointer;
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

	<div class="container">
		<div class="row">
			<!-- 메인 contents -->
			<div class="col-lg-8 mr-4">
			
				<div class="contents">
					<div class="title_wrap my-3">
						<h2>차량상세</h2>
					</div>
					<div class="img_wrap mb-3">
						<img class="rounded mx-auto d-block"
							src="/upload/${car.image}"/>
					</div>
					<div class="name_wrap d-flex">
						<img src="<%= request.getContextPath()%>/images/logo/${car.maker}.png"/>
						<div class="align-self-center">
							<div class="fs-4">${car.maker} <strong>${car.model}</strong></div>
							<div class="fs-5">${car.model}${car.series}</div>
						</div>
					</div>
					<div class="detail_wrap row gx-5 mb-3">
						<div class="col border p-3 mx-3 bg-light">
							<i class="bi bi-car-front-fill"></i><br/>
							<span>
								연료<br/>
								<strong>${car.year}</strong>년식
							</span>
							
						</div>
						
						<div class="col border p-3 mx-3 bg-light">
							<i class="bi bi-people-fill"></i><br/>
							<span>
								승차인원<br/>
								<strong>${car.seatCount}</strong>인승
							</span>
							
						</div>
						
						<div class="col border p-3 mx-3 bg-light">
							<i class="bi bi-droplet-fill"></i><br/>
							<span>
								연료<br/>
								<strong>${car.fuel}</strong>
							</span>
						</div>
						
						<div class="col border p-3 mx-3 bg-light">
							<i class="bi bi-fuel-pump-fill"></i><br/>
							<span>
								연비<br/>
								<strong>${car.fuelRatio}</strong>
							</span>
						</div>
					</div>
					<!-- 차이름 가격 및 예약버튼  -->
				</div>
				
				
			</div>
			<!-- 사이드바 -->
			<div class="col-lg-4">
				
				<div id="rental-box" class="p-3 fs-5">
				
					<div id="rental_day" class="row">
						<div class="d-flex justify-content-between">
							<div>
								<i class="bi bi-alarm"></i>
								<span id="date_result">
									${rentalDate} ~ ${dueDate}
								</span>
							</div>
							<span class="text-end align-self-center fs-6" style="text-decoration: underline;">수정</span>
						</div>
					</div>

					<div id="rental_schedule" class="row" style="display: none;">
						<div class="col-12 text-center mb-3">
							대여<input id="rental_start" class="form-control" type="date" name="rentalDate" min="${rentalDate}" value="${rentalDate}">
						</div>
						<div class="col-12 text-center mb-3">
							반납<input id="rental_end" class="form-control" type="date" name="dueDate" min="${dueDate}" value="${dueDate}">
						</div>
						<div class="col-12" style="background-color: gray; color: white; cursor: pointer; ">
							<div id="schedule_select" class="text-center m-2">일정 선택완료</div>
						</div>
					</div>

					<div class="row">	
						<span><i class="bi bi-bell"></i> ${car.model} ${car.series}</span>
					</div>
					<div class="row">
						<div class="col-6">
							1일 대여 요금
						</div>
						<div id="day_cost" class="col-6 text-end">
							${car.dayCost}원
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							총 요금
						</div>
						<div id="total_cost" class="col-6 text-end">
							${car.dayCost}원
						</div>
					</div>
					<div class="row">
						<div id="data"
							data-car_idx="${car.car_idx}"
							data-rental_date="${rentalDate}"
							data-due_date="${dueDate}"
							class="m-3 text-center">예약하기</div>
					</div>
					
				</div>
					
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
			
	</script>
    <script src="../js/scripts_main.js"></script>	
</body>
</html>