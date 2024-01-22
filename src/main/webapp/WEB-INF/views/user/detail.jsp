<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 보기</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles_main.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style_index.css">

    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script>
    
    <script type="text/javascript">

		$(() => {
			
			$("#del").click(function () {
			    var delIds = ""; // 초기화

			    delIds = $('input[name=idx]').val(); 
			    console.log(delIds)
			    
			    if (confirm("삭제하시겠습니까?")) {
			        var url = '<%= request.getContextPath() %>/question/delete.do';
			        fetch(url, {
			            method: "DELETE",
			            headers: {
			                'Accept': 'application/json',
			                'Content-Type': 'application/json'
			            },
			            body: JSON.stringify({ delIds: delIds }) // 데이터를 문자열로 변환하여 body에 추가
			        })
			        .then((response) => {
			            return response.json();
			        })
			        .then((json) => {
			            if (json.result == "success") {
			                window.location = '<%= request.getContextPath() %>/user/question.do';
			            }
			        })
			        .catch((error) => console.log("error:", alert(error)));
			    }
			});
		});
    
    </script>
     
</head>
<body>
	
	<c:set var="memberID" value="${sessionScope.memberID}"/>
	<c:set var="userid" value="${dto.userid}"/>
	<c:if test="${memberID != userid || memberID == null}">
		<h1>잘못된 접근입니다. <br/> 로그인 후 이용해주세요!</h1>
	</c:if>
	<c:if test="${memberID == userid && memberID != null}">
	<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12">
						<div class="row mb-3">
							<div class="col-lg-2"></div>
							<div class="col-lg-2"></div>
						</div>
						<form class="comment-form mb-5 bg-grey p-5" action="<%= request.getContextPath()%>/question/delete.do" method="delete">
							<h3 class="mb-4 text-center">문의글 보기</h3>
							<div class="row">
								<!-- 제목 -->
								<div class="col-lg-12">
									<h5 class="mb-3 text-center">제목</h5>
									<c:set var="title" value="${fn:replace(dto.title, '<', '&lt;')}"/>
			               			<c:set var="title" value="${fn:replace(title, '>', '&gt;')}"/>
									<input type="text" class="form-control mb-3" value="${title}"/>
								</div>
								
								<!-- 질의 카테고리 -->
								<div class="col-md-6">
									<h5 class="mb-3 text-center">질의 유형</h5>
									<input type="text" class="form-control mb-3" value="${dto.type}"/>
								</div>
								
								<!-- 답변 여부 -->
								<div class="col-md-6">
									<h5 class="mb-3 text-center">답변 여부</h5>
									<input type="text" class="form-control mb-3" value="${dto.answer}"/>
								</div>

								<!-- 글 내용 -->
								<div class="col-lg-12">
									<h5 class="mb-3 text-center">질의</h5>
									<c:set var="contents" value="${fn:replace(dto.contents, '<', '&lt;')}"/>
			               			<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}"/>
									<textarea class="form-control mb-4" rows="10" cols="30" style="resize: none;" >${contents}</textarea>
								</div>
								<div class="row">
									<div class="col-lg-12 text-center">
										<div class="btn-group">
											<input id="del" class="btn btn-danger" type="button" style="width: 100px;" value="삭제">
											<input class="btn btn-primary" type="button" style="width: 100px;" value="돌아가기" onclick="history.back()"/>
											<input type="hidden" name="idx" value="${dto.idx}" /> 
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:if>
</body>
</html>