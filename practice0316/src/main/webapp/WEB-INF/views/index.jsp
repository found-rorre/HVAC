<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content=""/>
<meta name="author" content=""/>
<title>HVAC</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet"/>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">	
    <!-- css -->
    <link rel="stylesheet"  href="./css/styles_main.css" />
    <link rel="stylesheet" href="./css/style_index.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet"  href="<%= request.getContextPath()%>/css/style2.css"/>

	
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<!-- slider -->	
	
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/index.js" defer="defer"></script> 
	
	
	<style type="text/css">
		
		#rental-box {
			/* 
			position: fixed;
			right: 90px;
			top: 300px;
			 */
	    	width: 420px;
	    	
	    }
	    
	    
	    .autoplay .active_img:hover {
	    	
	    	cursor: pointer;
	    
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
		#rental-box .row:last-child {
			background-color: #ED6C25;
			color: white;
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
	  	
		/* 이제부터 채팅 관련 */
	  	/* 모달 상단에 배경색 적용 */
		.modal-header {
			background-color: #007bff; 
			color: #ffffff;
			border-bottom: 1px solid #dee2e6;
		}
		
		/* 모달 하단에 배경색 적용 */
		.modal-footer {
			background-color: #007bff; 
			color: #ffffff; 
			border-top: 1px solid #dee2e6;
		}
		
		.chat-container {
		    height: 350px;
		    overflow-y: scroll;
		}
		
		.message {
		    max-width: 80%;
		    margin-bottom: 10px;
		    padding: 8px;
		    border-radius: 8px;
		    overflow-wrap: break-word;
	    	clear: both;
		}
		
		.right {
		    float: right;
		    background-color: #5cb85c; 
		    color: #fff;
		}
		
		.left {
		    float: left;
		    background-color: #ffffcc;
		    clear: both;
		}
		
		.sender {
		    font-weight: bold;
		}
		
		.content {
		    display: inline;
		}
		
		.fixed-image {
	     	position: fixed;
			bottom: 65px;
		    right: 15px;
		    width: 50px; 
	    }
		
	  	/* 채팅 끝 */
	  	
    </style>
    

</head>
<body>
	<!-- header-->
	<jsp:include page="/WEB-INF/views/layout/hamburger.jsp"/>
	<jsp:include page="/WEB-INF/views/layout/userHeader.jsp"/>
	
    <!-- body -->
    <iframe src="/test/user/event.do" frameborder="0" width="100%" height="380px"></iframe>
    <div class="container">
    	<div class="row">
    		<div class="col-md-10">
    				
				    <c:forEach items="${keywordCarList.keySet()}" var="list" varStatus="loopStatus">
				    
				    <div class="row">
						<div class="mb-2">
							<!-- 키워드 차량리스트 제목 -->
							<h4 class="my-4 d-flex justify-content-center">${keywordTitle.get(list)}</h4>
							<div id="keyword_wrap_${loopStatus.index}" class="autoplay d-flex align-items-center" style="width: 80%;"><!-- 840px -->
				    		
					    	<c:forEach items="${keywordCarList.get(list)}" var="car">
		    		<!-- 입고 된 차량 -->
					    		
					    		<c:if test="${car.status.equals('입고')}">
					    		
						    	<div style="margin: 0 20px; position: relative;">
						    		<input class="car_idx" type="hidden" value="${car.car_idx}">
									<img class="keyword_img active_img" src="/upload/${car.image}" style="width:100%; height: 220px;">
									<span class="d-flex justify-content-center align-items-center">
										<img style="width: 75px; height: 50px; display: inline-block;" src="/test/images/logo/${car.maker}.png"/>
										<h4 style="margin-left: 10px">${car.model} ${car.series}</h4>
									</span>
					    		</div>
					    		</c:if>
					    		
		    		<!-- 출고 된 차량-->
					    		
					    		<c:if test="${!car.status.equals('입고')}">
					    		
						    	<div style="margin: 0 20px;">
						    		<div style="position: relative;">
										<img class="keyword_img" src="/upload/${car.image}" style="width:100%; height: 220px; filter: grayscale(100%);">
										<h2 class="text-danger top-50 start-50 translate-middle" style="position: absolute;">예약마감</h2>
						    		</div>
									<span class="d-flex justify-content-center align-items-center">
										<img style="width: 75px; height: 50px; display: inline-block;" src="/test/images/logo/${car.maker}.png"/>
										<h4 style="margin-left: 10px">${car.model} ${car.series}</h4>
									</span>
						    	</div>
					    		
					    		</c:if>
					    		
					    		
					    		
					    		
					    		
					    	
					    	
								
					    	</c:forEach>
					    	
				    		</div>
				    	</div>
				    </div>
				    	
				    </c:forEach>
    				
			</div>
			<div class="col-md-2">

				<div id="rental-box" class="p-3 fs-5">
				
					<div class="row">	
						<span id="chk_result"><i class="bi bi-bell"></i> 전체 차량</span>
					</div>
					<div class="row">
						<span class="chk_all">
							<input type="checkbox" class="btn-check" id="chk_all" checked="checked">
							<label class="btn btn-outline-primary" for="chk_all">전체</label>
						</span>
						<span class="chk_group">
							<input type="checkbox" class="btn-check" id="chk_ele">
							<label class="btn btn-outline-primary" for="chk_ele">전기차</label>
			
							<input type="checkbox" class="btn-check" id="chk_die">
							<label class="btn btn-outline-primary" for="chk_die">경유</label>
			
							<input type="checkbox" class="btn-check" id="chk_gas">
							<label class="btn btn-outline-primary" for="chk_gas">휘발유</label>
							<br/>
							<input type="checkbox" class="btn-check" id="chk_sm">
							<label class="btn btn-outline-primary" for="chk_sm">경형/소형</label>
			
							<input type="checkbox" class="btn-check" id="chk_big">
							<label class="btn btn-outline-primary" for="chk_big">중형/대형</label>
			
							<input type="checkbox" class="btn-check" id="chk_five">
							<label class="btn btn-outline-primary" for="chk_five">5인승</label>
			
							<input type="checkbox" class="btn-check" id="chk_five_over">
							<label class="btn btn-outline-primary" for="chk_five_over">5인승 이상</label>
						</span>
						<!-- hidden -->
						<input type="hidden" name="fuel">
						<input type="hidden" name="type">
						<input type="hidden" name="seatCount">
					</div>
					<div class="row">
						<div id="search" class="m-3 text-center">조회하기</div>
						<form id="dynamic_form" method="get">
						</form>
					</div>
					
				</div>

			</div>
		</div>
		
		
				<!-- 채팅 관련 -->
		<img id="openModalButton" src="${pageContext.request.contextPath}/images/chat-icon.png" alt="Click Image" class="img-fluid fixed-image" data-memberID="${memberID}">
	
		<!-- 모달 시작 -->
		<div class="modal fade" id="questionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">상담사와 채팅하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
					<div id="messageTextArea" class="chat-container"></div>
					<!-- 채팅 영역 -->
					<form class="modal-footer">
						<input id="textMessage" type="text">
						<input type="button" class="btn btn-secondary" value="전송" onclick="sendMessage()">
					</form>
				</div>
			</div>
		</div>
		
		<!-- 모달 시작 -->
		<div class="modal fade" id="chatTimeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" >
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="chatTimeModalLabel">채팅 시간 안내</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
		                <p>지금은 상담 시간이 아닙니다.</p>
		                <p>상담 시간은 09시부터 18시까지입니다.</p>
		                <p>문의하기를 이용해주세요.</p>
		            </div>
					<form class="modal-footer">
						<button type="button" class="btn btn-danger" id="inquiryButton">문의하기</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 채팅 끝 -->
		
    </div>
    
	
	<!-- body end -->
    <!-- Footer-->
    <footer class="footer text-center">
        <div class="container px-4 px-lg-5">
            <ul class="list-inline mb-5">
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-facebook"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white mr-3" href="#!"><i class="icon-social-twitter"></i></a>
                </li>
                <li class="list-inline-item">
                    <a class="social-link rounded-circle text-white" href="#!"><i class="icon-social-github"></i></a>
                </li>
            </ul>
            <p class="text-muted small mb-0">Copyright &copy; poject</p>
        </div>
    </footer>
    
    <!-- silder -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#main"><i class="fas fa-angle-up"></i></a>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./js/scripts_main.js"></script>
    <script type="text/javascript">
		
		// 웹 소켓 객체를 전역으로 선언
		var webSocket;
		var memberID = "${memberID}";
		
		// "문의하기" 버튼 클릭 시 이벤트
	    $('#inquiryButton').on('click', function () {
	        // 여기에 페이지 이동 로직 추가
	        window.location.href = "${pageContext.request.contextPath}/user/question.do";
	    });
		
		
		// 모달 띄우기 버튼 클릭
		document.getElementById('openModalButton').addEventListener('click',function() {
			
			// 허용된 채팅 시간대 설정
			const chatStart = 9;
			const chatEnd = 24;
			
			// 현재 시간을 가져온다.
		    var now = new Date();
		    var currentHour = now.getHours();
	
			// 현재 시간이 허용된 채팅 시간대에 있는지 확인한다.
		    if (currentHour >= chatEnd || currentHour < chatStart) {
		    	$('#chatTimeModal').modal('show');
		    } else {
		    	
				// 모달 띄우기
				var myModal = new bootstrap.Modal(document.getElementById('questionModal'), {
					// 배경 클릭시 모달이 닫히지 않도록 설정
					backdrop : 'static', 
				});
				
			    function showModal() {
			        // 모달이 열릴 때 웹 소켓 연결
			        myModal.show();
			        myModal._element.addEventListener('shown.bs.modal', function onModalShown() {
			            if (!webSocket || webSocket.readyState !== WebSocket.OPEN) {
			                // 소켓이 없거나 연결이 닫혔으면 새로 연결
			                setupWebSocket();
			            }
			            
			            // 모달이 닫힐 때 이벤트 리스너를 제거
			            myModal._element.removeEventListener('shown.bs.modal', onModalShown);
			            
			        });
			    }
			    
			    // 모달 띄우기 및 웹 소켓 연결
			    showModal();
		    }
			
		});
		
		// 웹 소켓 설정 함수
		function setupWebSocket() {
		    // 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.
		    webSocket = new WebSocket(
		        "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/broadsocket"
		    );
		    // 텍스트 영역
		    var messageTextArea = document.getElementById("messageTextArea");
			
		 	// 텍스트 입력 가져오기
		    var textMessageInput = document.getElementById("textMessage");
		    
		    // 접속이 완료되면
		    webSocket.onopen = function (message) {
		        console.log("WebSocket 연결이 열렸습니다.");
				// 채팅방의 메시지 목록 불러오기
				$.ajax({
					url: "${pageContext.request.contextPath}/webSocket/messageList.do",
					data: {
						id : "${memberID}"
					},
					async: true,
					dataType: "json",
					success:function(data) {
						console.log(data);
						$.each(data, function(index, item){
							// 오른쪽 왼쪽 판별
							CheckLR(index,item);
						});
					}
				});
		    };
			
			// 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
			function CheckLR(index,item) {
				console.log(item.id)
				// email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
				const LR = (item.id != "${memberID}") ? "left" : "right";
			
				// 메세지 추가
				displayMessage(item.message, LR, item.message_regdate);		
			}
		    
		    
		    // 에러가 발생하면
		    webSocket.onerror = function (message) {
		        console.log("error...");
		    };
	
		    // 서버로부터 메시지가 도착하면 화면에 메시지를 남긴다.
		    webSocket.onmessage = function (message) {
		        displayMessage(message.data, "left");
		    };
			
		    
			// 엔터키를 눌렀을 때 폼 제출 막기
		    textMessageInput.addEventListener('keydown', function (event) {
		    	 // keyCode 13은 엔터이다.
		        if (event.keyCode === 13) {
		        	// 폼 제출 막기
		            event.preventDefault();
		         	// 모달이 닫히지 않도록 이벤트 전파 막기	
		            event.stopPropagation();
		         	// 서버로 메시지 전송
		            sendMessage();
		            return false;
		        }
		    });
			
		    // 모달이 닫힐 때 웹 소켓 연결 종료
		    $('#questionModal').on('hidden.bs.modal', function () {
		    	if (webSocket) {
		            webSocket.close();
		        }
		    });
			
		}
	
		// 서버로 메시지를 발송하는 함수
		function sendMessage() {
		    // 텍스트 박스의 객체를 가져옴
		    let message = document.getElementById("textMessage");
		    if(message.value.trim() != ''){
			    console.log(message.value);
			    // 화면에 메세지를 남긴다.
			    displayMessage(message.value, "right");
			    // 소켓으로 보낸다.
			    webSocket.send(message.value);
				$.ajax({
					url: "${pageContext.request.contextPath}/webSocket/insertChat.do",
					data: {
						id : "${memberID}",
						room_id : "${memberID}",
						message : message.value
					},
					async: true,
					dataType: "json",
					success:function(data) {
						console.log(data);
					}
				});
		    }
		    // 텍스트 박스 초기화
		    message.value = "";
		}
	
		// 데이터를 채팅창에 넣어준다.
		function displayMessage(content, alignment, regdate) {
		    let messageContainer = document.createElement("div");
		    messageContainer.classList.add("message");
		    messageContainer.classList.add(alignment);
			
		    // "(상담사)"와 채팅 내용을 각각 다른 줄에 표시
		    if (alignment === 'left') {
		        let sender = document.createElement("div");
		        sender.classList.add("sender");
		        sender.textContent = '(상담사)';
		        messageContainer.appendChild(sender);
		    }
	
		    let messageContent = document.createElement("div");
		    messageContent.classList.add("content");
		    messageContent.textContent = content;
		    messageContainer.appendChild(messageContent);
		    
		 	// 날짜
			var now = new Date();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var ampm = hours < 12 ? '오전' : '오후';
	
			// 시간이 12시간제로 표시되도록 조정
			hours = hours % 12;
			hours = hours ? hours : 12; // 0시는 12시로 표시
	
			// 분이 한 자리 수일 경우 앞에 0 추가
			minutes = minutes < 10 ? '0' + minutes : minutes;
	
			var nowTime = ampm + ' ' + hours + ':' + minutes;
		    
		    let timeContent = document.createElement("div");
		    if(typeof regdate == "undefined") {
		    	timeContent.textContent = nowTime;
			}
			else {
				timeContent.textContent = regdate;
			}
		    messageContainer.appendChild(timeContent);
	
		    // 각 메시지를 새로운 줄에 추가
		    document.getElementById("messageTextArea").appendChild(messageContainer);
	
		    // 항상 최신 메시지를 보여주기 위해 스크롤을 맨 아래로 이동
		    document.getElementById("messageTextArea").scrollTop = document.getElementById("messageTextArea").scrollHeight;
		}
	</script>
</body>
</html>