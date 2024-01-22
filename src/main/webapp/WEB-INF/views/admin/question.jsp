<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/common.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js"></script> 
	<script type="text/javascript">
		$(() => {
			$("#allCheck").click(function () {
				if ($(this).is(":checked")) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
			
			$(".check").click(function () {
				if (!$(this).is(":checked")) {
					$("#allCheck").prop("checked", false);
				}
			});
			
			$("#del").click(function () {
				var delIds = "";
				$(".check").each(function (index) {
					if ($(this).is(":checked")) {
						delIds += "," + $(this).val();
					}
				});
				
				if (delIds == "") {
					alert("삭제 할 이벤트를 체크하세요.");
				} else {
					if (confirm("삭제하시겠습니까?")) {
						var url = '<%= request.getContextPath() %>/admin/deleteQuest.do';
						
						fetch(url, {
							method: "delete",
							headers: {
				            	'Accept': 'application/json', 
				            	'Content-Type': 'application/json'
				          	},
				          	body: delIds.substr(1, delIds.length)
						})
				  		.then((response) => {
						  	return response.json();
					  	})
					  	.then((json) => {
					  		if (json.result == "success") {
					  			window.location= '<%= request.getContextPath() %>/admin/question.do';
					  		}
					  	})
					  	.catch((error) => console.log("error:", alert(error)));
					}
				}
				
			});
			
			
			
	    });
		
		// 답글 체크
		function repleOK (){
			   
			let reid =  $('input[name=reid]').val();
			let rename =  $('input[name=rename]').val();
			let reple = $('textarea[name=reple]').val();
		   
			if(reid.length == 0 || reid == ''){
				alert('로그인시 이용할 수 있습니다.');
				return false;
			}
		   
			if(rename.length == 0 || rename == ''){
				alert('로그인시 이용할 수 있습니다.');
				return false;
			}
			
			if(reple.length == 0 || reple.trim() == ''){
				alert('내용을 입력하세요.');
				$('textarea[name=reple]').val('');
				$('textarea[name=reple]').focus();
				return false;
			}
		   
		}
		
	</script>
	
	<style type="text/css">
	
		/* table 스타일 */
	    table {
	        table-layout: fixed;
	    }
	
	    th, td {
	        /* 셀 내에서 긴 텍스트를 "..."로 생략하는 스타일 */
	        white-space: nowrap;
	        overflow: hidden;
	        text-overflow: ellipsis; 
	    }
	    
	    /* 모달 스타일 */
		.modal {
	        position: fixed;
	        z-index: 5;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	        background-color: rgba(0, 0, 0, 0.7);
	        display: flex;
	        align-items: center;
	        justify-content: center;
	    }
	    
	    .modal-content {
	        background-color: #fefefe;
	        padding: 20px;
	        border: 1px solid #888;
	        width: 55%;
	        display: inline-block;
	        vertical-align: top;
	    }
	    
	    .close-button {
	        position: absolute;
	        top: 10px;
	        right: 10px;
	        cursor: pointer;
	    }
	</style>
</head>

<body>
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
            <br>
            
            <%-- <%
				out.println(request.getAttribute("list"));
            %>
            회원 --%>
            
            <div class="table-responsive" style="padding: 20px;">
            	<form action="<%= request.getContextPath() %>/admin/question.do" method="get">
            	<div class="input-group" style="margin-bottom: 30px;">
            		<span class="input-group-text">유형</span>
            		<select class="form-select" name="type">
					  	<option value="ALL" ${ param.type == "ALL" ? "selected" : "" }>전체</option>
					    <option value="예약" ${ param.type == "예약" ? "selected" : "" }>예약</option>
					    <option value="불만" ${ param.type == "불만" ? "selected" : "" }>불만</option>
					    <option value="기타" ${ param.type == "기타" ? "selected" : "" }>기타</option>
				  	</select>
			  		<span class="input-group-text">제목</span>
			  		<input type="text" aria-label="title" class="form-control" name="title" value="${param.title}">
			  		<span class="input-group-text">아이디</span>
			  		<input type="text" aria-label="userid" class="form-control" name="userid" value="${param.userid}">
			  		<span class="input-group-text">상태</span>
            		<select class="form-select" name="answer">
					  	<option value="ALL" ${ param.answer == "ALL" ? "selected" : "" }>전체</option>
					    <option value="미확인" ${ param.answer == "미확인" ? "selected" : "" }>미확인</option>
					    <option value="처리중" ${ param.answer == "처리중" ? "selected" : "" }>처리중</option>
					    <option value="답변완료" ${ param.answer == "답변완료" ? "selected" : "" }>답변완료</option>
				  	</select>
				  	<button class="btn btn-primary" type="submit" id="btnSearch" style="width: 100px;">검색</button>
				</div>
				</form>
				
				<div class="float-start" role="group" aria-label="Basic example" style="padding-top: 10px;">
					<span>전체: ${requestScope.totalCount} 개</span>
            	</div>
				<div class="btn-group float-end" role="group" aria-label="Basic example">
				    <button id="del" class="btn btn-danger" style="width: 100px;">삭제</button>
            	</div><br><br>
				
            	<table class="table table-striped table-hover">
	            	<thead class="table-dark">
	            		<tr>
	            			<th width="50"><input type="checkbox" id="allCheck"/></th>
	            			<th>타입</th>
	            			<th>제목</th>
	            			<th>내용</th>
	            			<th>아이디</th>
	            			<th>회원명</th>
	            			<th>전화번호</th>
	            			<th>이메일</th>
	            			<th>상태</th>
	            			<th>등록일</th>
	            			<th>답변일</th>
	            		</tr>
	            	</thead>
	            	<tbody class="table-group-divider">
	            		<c:forEach var="item" items="${list}">
	            		<c:set var="item" value="${item}" />
	            		<tr>
	            			<td width="50"><input type="checkbox" class="check" value="${item.idx}"/></td>
	            			<td>${item.type}</td>
	            			<td align="center">
								<c:set var="title" value="${fn:replace(item.title, '<', '&lt;')}" />
								<c:set var="title" value="${fn:replace(title, '>', '&gt;')}" />
								<c:set var="contents" value="${fn:replace(item.contents, '<', '&lt;')}" />
								<c:set var="contents" value="${fn:replace(contents, '>', '&gt;')}" />
								<a href="javascript:void(0);" onclick="openModal(this)" data-idx="${item.idx}" data-type="${item.type}" data-answer="${item.answer}" data-title="${title}" data-contents="${contents}">${title}</a>
							</td>
							<td align="center">
								${contents}
							</td>
	            			<td>${item.userid}</td>
	            			<td>${item.name}</td>
	            			<td>${item.phone}</td>
	            			<td>${item.email}</td>
	            			<td><span class="questionIds" style="color: blue; cursor: pointer;" onclick="questionget(${item})" data-bs-toggle="modal" data-bs-target="#questionModal">${item.answer}</span></td>
	            			<td align="center">
								<fmt:formatDate value="${item.regdate}" pattern="yyyy:MM:dd(E)" />
							</td>
							<td align="center">
								<fmt:formatDate value="${item.updatedate}" pattern="yyyy:MM:dd(E)" />
							</td>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
	            </table>
	            
            	<nav aria-label="Page navigation">${ paging }</nav>
            </div>
            
        </div>
    </div>
	
	
	<!-- 모달창 -->
	<!-- 모달 내용 -->
	<div id="myModal" class="modal" style="display: none;">
		<div class="modal-content">
		<form class="comment-form mb-5 bg-grey p-5" action="<%= request.getContextPath()%>/adminQuestion/reple.do" method="post" onsubmit="return repleOK()">
				<span onclick="closeModal()" class="close-button">X</span>
				<div id="myHalf1">
        	<h3 class="mb-4 text-center">문의글 보기</h3>
			<div class="row">
				<!-- 제목 -->
				<div class="col-lg-12">
					<h5 class="mb-3 text-center">제목</h5>
					<input id="myTitle" type="text" class="form-control mb-3" readonly="readonly"/>
				</div>
				
				<!-- 질의 카테고리 -->
				<div class="col-md-12">
					<h5 class="mb-3 text-center">질의 유형</h5>
					<input id="myType" type="text" class="form-control mb-3" readonly="readonly"/>
				</div>
				
				<!-- 글 내용 -->
				<div class="col-lg-12">
					<h5 class="mb-3 text-center">질의</h5>
					<textarea id="myContents" class="form-control mb-4" rows="10" cols="30" style="resize: none;" readonly="readonly"></textarea>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="btn-group deletebtn">
							<input id="reply" class="btn btn-primary" type="button" style="width: 100px;" value="답글 달기" onclick="expansionModal()"/>
							<input class="btn btn-primary" type="button" style="width: 100px;" value="닫기" onclick="closeModal()"/>
						</div>
					</div>
				</div>
			</div>
	    </div>
	
	    <div id="myHalf2" style="display: none;">
			
			<h3 class="mb-4 text-center">답글 달기</h3>
			<div class="row">
				
				
				<!-- 답변자 -->
				<div class="col-md-6">
					<h5 class="mb-3 text-center">답변자 이름</h5>
					<input type="text" class="form-control mb-3" name="adminname" value="${sessionScope.Name}" readonly="readonly"/>
				</div>
				<div class="col-md-6">
					<h5 class="mb-3 text-center">답변자 아이디</h5>
					<input type="text" class="form-control mb-3" name="adminid" value="${sessionScope.ID}" readonly="readonly"/>
				</div>
				
				<!-- 답변 여부 -->
				<div class="col-md-12">
					<h5 class="mb-3 text-center">답변 여부</h5>
					<select id="answerSelect" class="form-control mb-3" name="answer">
						<option>미확인</option>
						<option>처리중</option>
						<option>답변완료</option>
					</select>
				</div>

				<!-- 글 내용 -->
				<div class="col-lg-12">
					<h5 class="mb-3 text-center">답변</h5>
					<textarea id="reple" class="form-control mb-4" name="reple" rows="10" cols="30" maxLength = 1000
						placeholder="답변" style="resize: none;" ></textarea>
				</div>
				
			</div>
			<!-- (hidden) 작성자 ID, answer -->
			<input id="hiddenIdx" type="hidden" name="idx"/> 
				
	    </div>
	   	<div class="row">
			<div class="col-lg-12 text-center">
				<div class="btn-group showbtn" style="display: none;">
					<input class="btn btn-primary" type="submit" value="답글달기"/>
					<input class="btn btn-primary" type="button" value="닫기" onclick="closeModal()"/>
				</div>
			</div>
		</div>
		</form>
		</div>
	</div>
	
	<script>
		
	    function openModal(button) {
	        var modal = document.getElementById("myModal");
	        var idx = button.getAttribute("data-idx");
	        var type = button.getAttribute("data-type");
	        var answer = button.getAttribute("data-answer");
	        var title = button.getAttribute("data-title");
	        var contents = button.getAttribute("data-contents");
	    	document.getElementById("myTitle").value = title;
	    	document.getElementById("myType").value = type;
	    	document.getElementById("myContents").value = contents;
	    	document.getElementById("hiddenIdx").value = idx;
	    	console.log(answer)
	    	
	    	// select 요소 가져오기
	    	var selectElement = document.getElementById("answerSelect");
	    	// select 요소 내의 option 요소들 가져오기
	    	var options = selectElement.getElementsByTagName("option");
	    	// type 변수와 일치하는 값을 가진 option 요소를 찾아 선택 설정
	    	for (var i = 0; i < options.length; i++) {
	    	    if (options[i].value === answer) {
	    	        options[i].selected = true;
	    	        break; // 일치하는 값이 발견되면 루프 종료
	    	    }
	    	}
	    	
	    	$('.form-control, .mb-3').eq(0).val(type);
	        modal.style.display = "block";
	        
	        if(answer!='미확인'){
		        var url = '<%= request.getContextPath() %>/adminQuestion/repleSelect.do';
		        fetch(url, {
		            method: "POST",
		            headers: {
		                'Accept': 'application/json',
		                'Content-Type': 'application/json'
		            },
		            body: JSON.stringify({ idx: idx }) // 데이터를 문자열로 변환하여 body에 추가
		        })
		        .then((response) => {
		            return response.json();
		        })
		        .then((json) => {
		            if (json.result == "success") {
		               console.log(json.data);
		               document.getElementById("reple").value = json.data;
		            }
		        })
		        .catch((error) => console.log("error:", alert(error)));
	        }
	    }
	
	    function closeModal() {
	        var modal = document.getElementById("myModal");
	        var modalcontent = document.querySelector(".modal-content");
	        var myHalf = document.getElementById("myHalf2");
	        var deletebtn = document.querySelector(".deletebtn");
	        var showbtn = document.querySelector(".showbtn");
	        var myHalf1 = document.getElementById("myHalf1");
	        modal.style.display = "none";
	        myHalf.style.display = "none";
	        deletebtn.style.display = "block";
	        showbtn.style.display = "none";
	        modalcontent.style.width = "55%";
	        myHalf1.style.width = "100%";
	    }
	    
	    function expansionModal() {
	        var myModal = document.getElementById("myModal");
	        var modalcontent = document.querySelector(".modal-content");
	        var myHalf1 = document.getElementById("myHalf1");
	        var myHalf2 = document.getElementById("myHalf2");
	        var deletebtn = document.querySelector(".deletebtn");
	        var showbtn = document.querySelector(".showbtn");
	        
	    	deletebtn.style.display = "none";
	    	showbtn.style.display = "block";
	        
	        
	        // 모달 너비 변경
	        myModal.style.width = "100%";
	        modalcontent.style.width = "100%";
	        myHalf1.style.width = "47%";
	        myHalf2.style.width = "47%";
	        
	        // myHalf1 및 myHalf2 너비 변경
	        myHalf2.style.display = "inline-block"; // inline-block로 변경
	        myHalf1.style.display = "inline-block";
	       
	    }
	
	    window.onclick = function(event) {
	        var modal = document.getElementById("myModal");
	        if (event.target === modal) {
	            modal.style.display = "none";
	        }
	    };
	</script>
	
</body>
</html>

