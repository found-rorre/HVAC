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

<title>키워드 관리</title>
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
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/adminKeyword.js"></script> 
	<!-- bootstrap toggle -->    
	<link href="https://cdn.jsdelivr.net/npm/bootstrap5-toggle@5.0.4/css/bootstrap5-toggle.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap5-toggle@5.0.4/js/bootstrap5-toggle.ecmas.min.js" defer="defer"></script>
	
		
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
                        <h1 class="h3 mb-0 text-gray-800">키워드 관리</h1>
                    </div>
	
					<!-- 차량 리스트 -->
                    <div class="row mb-4" style="padding: 0 300px 200px 300px;">
                    
						<div class="d-flex mb-3">
							<div class="btn-group me-auto">
								<div id="update_btn" class="me-auto btn btn-warning">수정하기</div>
								<div id="delete_btn" class="me-auto btn btn-danger">삭제하기</div>
							</div>
							
							<div class="btn-group">
								<!-- <div id="insert_btn" class="btn btn-primary">생성하기</div> -->
							</div>
						</div>
                    	<div id="summary_table_center" class="col-lg-12 d-flex justify-content-center">
	                    	<table id="carTable" class="table table-striped table-hover">
				            	<thead class="table-dark">
				            		<tr class="text-center">
				            			<th><input type="checkbox" id="allCheck"/></th>
				            			<th>키워드</th>
				            			<th>제목</th>
				            		</tr>
				            	</thead>
				            	<tbody class="table-group-divider">
				            		<c:forEach var="list" items="${keywordList}">
				            		<tr class="text-center list-item">
				            			<td><input type="checkbox" class="check" value="${list.keyword_idx}"/></td>
				            			<td>${list.name}</td>
				            			<td>${list.title}</td>
				            		</tr>
				            		
				            		</c:forEach>
				            	</tbody>
				            </table>
                    	</div>
                    	<div class="col-lg-12 text-right">
                    		<input id="show_modal" class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#modal" value="생성하기"/>
                    	</div>
                    </div>
                    
	            </div>
	        </div>
	    </div>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">키워드 생성</h5>
				<button id="modal_close" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
		  
			<div class="modal-body">
				<form id="insert_form" action="<%= request.getContextPath()%>/admin/keywordInsert" method="post" target="form_ifr">
					<div class="row my-2"> 
					
						<div class="col-3 mb-4">
							<label class="form-label">키워드</label>
							<input type="text" name="name" class="form-control"/>
						</div>
						
						<div class="col-9 mb-4">
							<label class="">제목</label>
							<input type="text" name="title" class="form-control"/>
						</div>
					
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button id="keywordInsert_btn" class="btn btn-primary" type="button"
					style="display: none;">추가하기</button>
					
				<button id="keywordUpdate_btn" class="btn btn-primary" type="button"
					style="display: none;">수정하기</button>
			</div>
		</div>
	</div>
</div>	
<iframe name="form_ifr" hidden></iframe>

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

    <!-- Page level custom scripts -->
    <script src="<%= request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
    <script src="<%= request.getContextPath()%>/js/demo/chart-pie.js"></script>

</body>
</html>