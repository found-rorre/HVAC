<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>문의</title>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
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
			    if (!$(".check:checked").length) {
			        $("#allCheck").prop("checked", false);
			    }
			});

			$("#deleteButton").click(function () {
			    var delIds = "";
			    $(".check:checked").each(function (index) {
			        delIds += "," + $(this).val();
			    });
				console.log(delIds)
			    if (delIds == "") {
			        alert("삭제 할 이벤트를 체크하세요.");
			    } else {
			        if (confirm("삭제하시겠습니까?")) {
			            var url = '<%= request.getContextPath() %>/question/delete.do';

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
			                    window.location = '<%= request.getContextPath() %>/user/question.do';
			                }
			            })
			            .catch((error) => console.log("error:", alert(error)));
			        }
			    }
			});
	    });
		function questionOK (){
		   
			let title =  $('input[name=title]').val();
			let contents = $('textarea[name=contents]').val();
			let type = $('select').eq(0).val();
			let userid =  $('input[name=userid]').val();
		   
			if(title.length == 0 || title == ''){
				alert('제목을 입력하세요.');
				return false;
			}
			
			if(type == '질의 유형'){
				alert('질의 유형을 선택하세요.');
				return false;
			}
		   
			if(contents.length == 0 || contents == ''){
				alert('내용을 입력하세요.');
				return false;
			}
			
			if(userid.length == 0 || userid == ''){
				alert('로그인시 이용할 수 있습니다.');
				return false;
			}
		}
		
		var showChk = "none"
		function contentsShow(link) {
			// 클릭한 링크 요소에서 data-target 속성 값을 읽어옵니다.
		    var dataTarget = link.getAttribute("data-target");
		    var idx = link.getAttribute("data-idx");
		    console.log(dataTarget);
		    console.log(idx);
		    var contentRow1 = document.querySelectorAll(dataTarget)[0];
		    var contentRow2 = document.querySelectorAll(dataTarget)[1];
		    var contentRow3 = document.querySelectorAll(dataTarget)[2];
		    // 해당 행을 보이게 설정합니다.
		    if( showChk == "table-row"){
		    	showChk = "none";
		    }else{
		    	showChk = "table-row"
		    }
		    contentRow1.style.display = showChk;
		    
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
	               if(json.data != null){
	            		// 데이터를 넣을 td 엘리먼트를 선택합니다.
	            	   const tdElement = contentRow2.querySelector('td[colspan="2"]');

	            	   // 데이터를 삽입할 내용을 생성합니다.
	            	   const data = json.data;

	            	   // td 엘리먼트에 데이터를 삽입합니다.
	            	   tdElement.textContent = data;
	            	   contentRow2.style.display = showChk; 
	               }
	            }
	        })
	        .catch((error) => console.log("error:", alert(error)));
		    
		    contentRow3.style.display = showChk; 
		}
	</script> 
	
	<style type="text/css">
	    table {
	        border-collapse: collapse; /* 테두리를 합치고 간격을 없앰 */
	        table-layout: fixed;
	    }
	
	    table, th, td {
	        border: 1px solid black; /* 테두리 스타일 지정 */
	    }
	
	    th, td {
	        padding: 8px; /* 셀 내부 여백 설정 */
	        text-align: center; /* 셀 내용 가운데 정렬 */
	        justify-content: center;
	        
	        /* 셀 내에서 긴 텍스트를 "..."로 생략하는 스타일 */
	        white-space: nowrap;
	        overflow: hidden;
	        text-overflow: ellipsis; 
	        /* 줄 바꿈 */
	 		/* word-wrap: break-word; */
	    }
	
	    thead {
	        background-color: #333; /* 테이블 헤더 배경색 설정 */
	        color: white; /* 헤더 텍스트 색상 설정 */
	    }
	    
	    .bordered-div {
            border: 2px solid #000; /* 테두리 두께와 색상을 지정 */
            padding: 10px; /* 테두리와 내용 사이의 간격을 조절 */
            width: 1000px;
        }
	    
	    .container {
	    	margin-top: 20px;
	    	padding-top: 20px;
			border: 4px solid green;
			display: grid;
			
			grid-template-areas: 
				". header ." 100px
				". main ."	
				". page ." 100px
				". . button" 100px 100px
	    }
	    
	    .btn-group {
		    justify-self: end;
		}
	    
	</style>
	
	
</head>
<body>
	
	<!-- 문의 사항 출력 -->
	<div class="bordered-div container">
		<c:if test="${list != null}">
			<div>
		    	<h3 class="mb-4 text-center item1">문의글 목록</h3>
		    </div>
		    <div style="display: flex; justify-content: center;">
		        <table class="table table-striped table-hover" style="width: 500px;">
		            <thead class="table-dark">
		                <tr>
		                    <th width="50"><input type="checkbox" id="allCheck" /></th>
		                    <th style="width: 100px;">질의</th>
		                    <th style="width: 350px;">제목</th>
		                    <th style="width: 150px;">확인 여부</th>
		                </tr>
		            </thead>
		            <tbody class="table-group-divider">
		                <c:forEach var="item" items="${list}">
		                    <c:set var="item" value="${item}" />
		                    <tr>
		                        <td width="50"><input type="checkbox" class="check" value="${item.idx}" /></td>
		                        <td>${item.type}</td>
		                        <td style="width: 350px;"><a href="#" onclick="contentsShow(this)" data-target=".content-${item.idx}" data-idx="${item.idx}">${fn:escapeXml(item.title)}</a></td>
		                        <td>${item.answer}</td>
		                    </tr>
		                    <tr class="content-${item.idx}" style="display: none;">
		                        <td width="50"></td>
		                        <td>
		                            문의 내용
		                        </td>
		                        <td colspan="2">
		                            ${fn:escapeXml(item.contents)}
		                        </td>
		                    </tr>
		                    <tr class="content-${item.idx}" style="display: none;">
		                        <td width="50"></td>
		                        <td>
		                            답변 내용
		                        </td>
		                        <td colspan="2">
		
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		    </div>
		</c:if>
		
		<div>
			<nav aria-label="Page navigation">${paging}</nav>
		</div>
		<div class="btn-group float-end" role="group" aria-label="Basic example">
		    <button id="deleteButton" class="btn btn-danger" style="width: 100px;">삭제</button>
		    <button type="button" class="btn btn-primary" id="openModalButton" style="width: 100px;">문의 하기</button>
		</div>
	</div>
	
	<!-- 모달 시작 -->
	<div class="modal fade" id="questionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
		       	<form action="<%= request.getContextPath() %>/question/insert.do" method="post" onsubmit="return questionOK()">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">문의 하기</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <!-- 양식 내용 -->
	                    <div class="mb-3">
	                        <label for="title" class="form-label">제목</label>
	                        <input type="text" class="form-control" id="title" name="title" autocomplete="off" placeholder="제목 :" maxLength="100">
	                    </div>
	                    <div class="mb-3">
	                        <label for="type" class="form-label">질의 유형</label>
	                        <select class="form-select" id="type" name="type">
	                            <option>질의 유형</option>
	                            <option>예약</option>
	                            <option>불만</option>
	                            <option>기타</option>
	                        </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="contents" class="form-label">질의</label>
	                        <textarea class="form-control" id="contents" name="contents" rows="10" cols="30" maxLength="1000" placeholder="내용" style="resize: none;"></textarea>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <input type="hidden" name="userid" value="${sessionScope.memberID}" />
	                    <input type="hidden" name="answer" value="미확인" />
	                    <button type="submit" class="btn btn-primary">생성하기</button>
	                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">돌아가기</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	<script>
	    // 모달 띄우기 버튼 클릭
	    document.getElementById('openModalButton').addEventListener('click', function () {
	        // 모달 내용 초기화
	        $('input[name=title]').val('');
	        $('#contents').val('');
	        $('#type').val('질의 유형');
				
	        // 모달 띄우기
	        var myModal = new bootstrap.Modal(document.getElementById('questionModal'), {
	            backdrop: 'static', // 배경 클릭시 모달이 닫히지 않도록 설정
	        });
	        myModal.show();
	    });
	</script>
	<script src="<%= request.getContextPath()%>/js/scripts_main.js"></script>
</body>
</html>