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

<title>Insert title here</title>
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
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/adminRentalList.js"></script> 
	
	<!-- date picker -->
	
	<style type="text/css">
		
		#dropdown-m {
			width: 240px;
		}
		#dropdown-y {
			width: 160px;
		}
		#item-months, item-years {
			width: 240px;
		}
		#item-months > span {
			width: 60px;
		}
		#item-years > span:nth-child(odd) {
			width: 60px;
		}
		#item-years > span:nth-child(2) {
			width: 120px;
		}
	
	</style>
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
                        <h3 class="mb-0 text-gray-800">Dashboard</h3>
                    </div>
					
                    <div class="row mb-4">
						<div class="text-center fs-3 mb-4">
							랜트 차량 리스트
						</div>
						<h3 id="rental_title" class="text-center fs-5"></h3>
                    </div>
					
					<!-- 차량 리스트 -->
                    <div class="row my-4" style="padding-bottom: 200px;">
                    	<div class="col-6 mb-3">
							<ul class="nav mb-2 mb-lg-0 ">
								<!-- 년별 -->
								<li class="nav-item dropdown mr-2">
									<input id="dropdown-y" class="dropdown btn btn-outline-secondary" type="button" value="년도별 보기" data-bs-toggle="dropdown"/>
									<ul id="menu-y" class="dropdown-menu">
										<li class="dropdown-item"></li>
										<li class="dropdown-item"></li>
										<li class="dropdown-item"></li>
										<li class="dropdown-item"></li>
										<li class="dropdown-item"></li>
									</ul>
								</li>
								<!-- 월별 -->
								<li class="nav-item dropdown">
									<input id="dropdown-m" class="btn btn-outline-secondary" type="button" value="월별보기"/>
									<div id="menu-m" class="dropdown-menu">
										<div id="item-years" class="d-flex flex-wrap text-center">
											<span class="dropdown-item"><i class="bi bi-chevron-left"></i></span>
											<span id="year-text" class="align-self-center"></span>
											<span class="dropdown-item"><i class="bi bi-chevron-right"></i></span>
										</div>
										<div id="item-months" class="d-flex flex-wrap text-right">
											<span class="dropdown-item">1월</span>
											<span class="dropdown-item">2월</span>
											<span class="dropdown-item">3월</span>
											<span class="dropdown-item">4월</span>
											<span class="dropdown-item">5월</span>
											<span class="dropdown-item">6월</span>
											<span class="dropdown-item">7월</span>
											<span class="dropdown-item">8월</span>
											<span class="dropdown-item">9월</span>
											<span class="dropdown-item">10월</span>
											<span class="dropdown-item">11월</span>
											<span class="dropdown-item">12월</span>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="col-6">
							<div class="d-flex">
							
								<div class="input-group mb-3">
									<span class="input-group-text">차종 별</span>
									<select id="car_type" class=" form-control text-center mr-2"></select>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text">브랜드 별</span>
									<select id="car_maker" class=" form-control text-center mr-2"></select>
								</div>
							</div>
						</div>
                    	<div class="col-lg-12">
	                    	<table class="table table-striped table-hover">
				            	<thead class="table-dark">
				            		<tr class="text-center">
				            			<th>차량번호</th>
				            			<th>브랜드</th>
				            			<th>차량</th>
				            			<th>차종</th>
				            			
				            			<th>대여일자</th>
				            			<th>반납일자</th>
				            			<th>대여일수</th>
				            			<th>1일대여 요금</th>
				            			<th>총 대여비용</th>
				            		</tr>
				            	</thead>
				            	<tbody id="list-item" class="table-group-divider">
				            		<c:forEach var="list" items="${rentalList}">
				            		<tr class="text-center">
				            			<td>${list.carNumber}</td>
				            			<td class="${list.maker}">${list.maker}</td>
										<td>${list.model} ${list.series}</td>
				            			<td class="${list.type}">${list.type}</td>

				            			<td><fmt:formatDate value="${list.rentalDate}" pattern="yy년 MM월 dd일"/></td>
				            			<td><fmt:formatDate value="${list.dueDate}" pattern="yy년 MM월 dd일"/></td>
										<fmt:parseNumber value="${((list.dueDate).time - (list.rentalDate).time) / (1000*60*60*24)}" var="dueDateFmt" pattern="#"/>
										<td>${dueDateFmt}일</td>

				            			<td><fmt:formatNumber value="${list.dayCost}" pattern=",000원"/></td>
				            			<td><fmt:formatNumber value="${list.cost}"    pattern=",000원"/></td>
				            		</tr>
				            		</c:forEach>
				            	</tbody>
				            </table>
                    	</div>
			            <div class="col-10"></div>
			            <div class="col-2">
							<div class="input-group mb-3">
								<span class="input-group-text">매출</span>
								<span id="total_cost" class="form-control text-center"></span>
							</div>
			            </div>
			            <c:forEach items="">
			            <div class="col-3">
			            </div>
			            </c:forEach>
                    </div>

		            </div>
	            </div>
	        </div>
	    </div>
	</div>
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


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

</body>
</html>