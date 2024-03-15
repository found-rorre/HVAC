<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>차량관리</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
	<!-- Custom styles for this template -->
    <link href="<%= request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/adminCarList.js"></script> 
	<!-- bootstrap toggle -->    
	<link href="https://cdn.jsdelivr.net/npm/bootstrap5-toggle@5.0.4/css/bootstrap5-toggle.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap5-toggle@5.0.4/js/bootstrap5-toggle.ecmas.min.js" defer="defer"></script>
	
	<style type="text/css">
		
	#radio_box label {
		width: 100px;
		
	}
	#carInsert_form input[type="checkbox"]{
	}
	
	</style>
	<script type="text/javascript">
	
	</script>
		
</head>
<body id="page-top">
    <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
       	<div class="border-end bg-white" id="sidebar-wrapper">
            <jsp:include page="/WEB-INF/views/layout/side.jsp"/>      
        </div>
    <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
            </nav>
    
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-5">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

					<!-- 차량 리스트 -->

                    <div class="row mb-4" style="padding-bottom: 200px;">
                    
						<div class="d-flex mb-3">
							<div class="btn-group me-auto">
								<div id="car_delete_btn" class="me-auto btn btn-danger">삭제하기</div>
								<div id="status_show_modal" class="btn btn-warning" data-bs-toggle="modal">차량상태 변경하기</div>
								
								<!-- Button trigger modal -->
							</div>
							<div class="btn-group">
								<div id="total_btn"   class="btn btn-outline-dark">전체보기</div>
								<div id="summary_btn" class="btn btn-outline-dark">요약보기</div>
							</div>
						</div>
                    	<div id="summary_table_center" class="col-lg-12 d-flex justify-content-center">
	                    	<table id="carTable" class="table table-striped table-hover">
				            	<thead class="table-dark">
				            		<tr class="text-center">
				            			<th><input type="checkbox" id="allCheck"/></th>
				            			<th>차량번호</th>
				            			<th>년식</th>
				            			<th class="summary">브랜드</th>
				            			<th>모델</th>
				            			<th>시리즈</th>
				            			<th class="summary">차종</th>
				            			<th class="summary">연료</th>
				            			<th class="summary">연비</th>
				            			<th class="summary">트랜지션</th>
				            			<th class="summary">승차인원</th>
				            			<th>총 출고일</th>
				            			<th>상태</th>
				            		</tr>
				            	</thead>
				            	<tbody class="table-group-divider">
				            		<c:forEach var="list" items="${carList.list}">
				            		<tr class="text-center list-item">
				            			<td><input type="checkbox" class="check" value="${list.car_idx}"/></td>
				            			<td>${list.carNumber}</td>
				            			<td>${list.year}</td>
				            			<td class="summary">${list.maker}</td>
										<td>${list.model}</td>
				            			<td>${list.series}</td>
				            			<td class="summary">${list.type}</td>
				            			<td class="summary">${list.fuel}</td>
				            			<td class="summary">${list.fuelRatio}</td>
				            			<td class="summary">${list.transmission}</td>
				            			<td class="summary">${list.seatCount}인승</td>
				            			<td>${list.rentalCount}일</td>
				            			<td class="status">${list.status}</td>
				            		</tr>
				            		</c:forEach>
				            	</tbody>
				            </table>
                    	</div>
                    	<div class="col-lg-12 text-right">
                    		<input id="show_modal" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#modal" value="추가하기"/>
                    	</div>
                    </div>
                    
	            </div>
	        </div>
	    </div>
	</div>
</div>
	<!-- bootstrap 모달 -->



<!-- Modal -->
<div class="modal fade" id="status_modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">차량 상태 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
		
			<div class="modal-body">
				<div class="container-fluid">
					<div id="radio_box" class="row my-2">
						<div class="col-10 d-flex justify-content-between">
							<input id="in_car" class="btn-check" type="radio" name="status_radio" value="입고" checked>
							<label class="btn btn-outline-success" for="in_car">입고</label>
							
							<input id="out_car" class="btn-check" type="radio" name="status_radio" value="출고">
							<label class="btn btn-outline-danger" for="out_car">출고</label>
							
							<input id="repair_car" class="btn-check" type="radio" name="status_radio" value="정비">
							<label class="btn btn-outline-primary" for="repair_car">정비</label>
						</div>
						
					</div>
				</div>
			</div>
		
			<div class="modal-footer">
				<button id="car_update_btn" type="button" class="btn btn-primary">변경하기</button>
			</div>
		</div>
	</div>
</div>
	
<!-- Modal -->
<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">차량 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
		  
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row my-2"> 
						<div class="col-lg-4 col-md-4 col-sm-5">
							기존 차량 정보
							<select id="info_select" class="form-control"></select>
						</div>
						<div class="col-lg-2 col-md-2 col-2">
							<br/>
							<input id="info_select_btn" type="button" class="btn btn-primary" value="선택">
							<input id="info_delete_btn" type="button" class="btn btn-danger" value="삭제" style="display: none;">
						</div>
						<div class="col-lg-6 col-md-6 col-3  text-right">
							<br/>
							<input id="info_add_btn" type="button" class="btn btn-warning" value="새로운 차량추가">
							<div id="back_put_group" class="btn-group" style="display: none;">
								<input id="info_put_btn" type="button" class="btn btn-danger" value="새로운 차량등록" >
								<input id="info_back_btn" type="button" class="btn btn-warning" value="돌아가기">
							</div>
						</div>
					</div>
					<div class="row my-2">
						
						<div class="col-12">
							<div id="keyword_box" class="row">
								<div class="col-10 my-5 d-flex justify-content-between"></div>
							</div>
							<form id="infoInsert_form" action="<%= request.getContextPath()%>/admin/infoInsert" method="post" enctype="multipart/form-data" target="form_ifr">
								<table class="table table-striped table-hover" style="table-layout: fixed;">
					            	<thead class="table-dark">
					            		<tr class="text-center">
					            			<th>브랜드</th>
					            			<th>모델</th>
					            			<th>시리즈</th>
					            			<th>차종</th>
					            			<th>연료</th>
					            			<th>연비</th>
					            			<th>트랜지션</th>
					            			<th>승차인원</th>
					            		</tr>
					            	</thead>
					            	<tbody class="table-group-divider">
					            		<tr id="selectedCar" class="text-center">
					            			<td></td>
											<td></td>
					            			<td></td>
					            			<td></td>
					            			<td></td>
					            			<td></td>
					            			<td></td>
					            			<td></td>
					            		</tr>
					            	</tbody>
					            </table>
				            	<input name="keyword" type="hidden">
								<!-- 차량 이미지 -->
								<div id="image_box" class= "row my-3">
							    	<div class="col-md-2"></div>
							    		<div class="col-md-8">
							         		<input class="form-control" type="file" accept="image/*" name="fileName" onchange="photoView(event)"/>
							      		</div>
							      	<div class="col-md-2"></div>
							   	</div>
		            		</form>
							   	<div class="row my-3 justify-content-center">
									<div class="col-6">
										<img id="output" class="img-fluid w-100"/><br/>
									</div>
							   	</div>
							<form id="carInsert_form" action="<%= request.getContextPath()%>/admin/carInsert" method="post" target="form_ifr" style="display: none;">
								<div class="row my-2">
									<div class="col-lg-4 col-md-12">
										차량 번호
										<input name="carNumber" type="text" class="form-control">
									</div>
									<div class="col-lg-4 col-md-12">
										연식
										<input name="year" type="text" class="form-control">
									</div>
									<div class="col-lg-4 col-md-12">
										1일 대여 요금
										<input name="dayCost" type="text" class="form-control">
									</div>
									<input name="carInfo_idx" type="hidden">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button id="carInsert_btn" class="btn btn-primary" type="button" style="display: none;">차량 등록하기</button>
			</div>
		</div>
	</div>
</div>	
<iframe name="form_ifr" hidden></iframe>
<!-- bootstrap modal -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>




<script type="text/javascript">
const statusGroup = $('.status');

console.log(status);

$.each(statusGroup, function (index, status) {
	if($(status).text() == '출고'){
		$(status).css({"color" : "red", "font-weight" : "bold"});
	}else if($(status).text() == '정비'){
		$(status).css({"color" : "blue", "font-weight" : "bold"});
		
	}
	
})


</script>
    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath()%>/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%= request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%= request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
    <script src="<%= request.getContextPath()%>/js/demo/chart-pie.js"></script>

</body>
</html>