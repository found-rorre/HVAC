<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.js"></script>
<style>
	/* 여러 채팅창 간의 간격과 배열 위치*/
	.float-left {
		float: left;
		margin: 5px;
	}
</style>

</head>
<body>
	<!-- 유저가 접속할 때마다 이 템플릿으로 채팅창을 생성한다. -->
	<div class="template" style="display: none">
		<form>
			<!-- 메시지 텍스트 박스 -->
			<input type="text" class="message" onkeydown="if(event.keyCode === 13) return false;">
			<!-- 전송 버튼 -->
			<input value="Send" type="button" class="sendBtn">
		</form>
		<br />
		<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
		<textarea rows="10" cols="50" class="console" disabled="disabled"></textarea>
	</div>
	<script type="text/javascript">
		// 서버의 admin의 서블릿으로 웹 소켓을 한다.
		var webSocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/adminChat");
		// 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
		webSocket.onopen = function(message) {
		};
		webSocket.onclose = function(message) {
		};
		webSocket.onerror = function(message) {
		};
		
		// 사용자 정보를 전역 변수에 담는다.
		var userMap = {};
		
		// 서버로 부터 메시지가 오면
		webSocket.onmessage = function(message) {
			// 메시지의 구조는 JSON 형태로 만들었다.
			let node = JSON.parse(message.data);
			// 메시지의 status는 유저의 접속 형태이다.
			// visit은 유저가 접속했을 때 알리는 메시지다.
			if (node.status === "visit") {
				// 위 템플릿 div를 취득한다.
				let form = $(".template").html();
				// div를 감싸고 속성 data-key에 unique키를 넣는다.
				form = $("<div class='float-left'></div>").attr("data-key",
						node.key).append(form);
				// body에 추가한다.
				$("body").append(form);
				
				// 사용자 정보를 객체에 저장
		        userMap[node.key] = {
		            id: node.id,
		        };
				
				$.ajax({
					url: "${pageContext.request.contextPath}/webSocket/messageList.do",
					data: {
						id : node.id
					},
					async: true,
					dataType: "json",
					success:function(data) {
						console.log(data);
						
						$.each(data, function(index, item){
							
							if(item.id == node.id){
								// key로 해당 div영역을 찾는다.
								let $div = $("[data-key='" + node.key + "']");
								// console영역을 찾는다.
								let log = $div.find(".console").val();
								// 아래에 메시지를 추가한다.
								$div.find(".console").val(
										log + "("+ node.id +") => " + item.message + "\n");
								$div.find(".console").scrollTop($div.find(".console")[0].scrollHeight);
							}else{
								// key로 해당 div영역을 찾는다.
								let $div = $("[data-key='" + node.key + "']");
								// console영역을 찾는다.
								let log = $div.find(".console").val();
								// 아래에 메시지를 추가한다.
								$div.find(".console").val(
										log + "(상담사) => " + item.message + "\n");
								$div.find(".console").scrollTop($div.find(".console")[0].scrollHeight);
							}
							
						});
					}
				});
				
			// message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
			} else if (node.status === "message") {
				// key로 해당 div영역을 찾는다.
				let $div = $("[data-key='" + node.key + "']");
				// console영역을 찾는다.
				let log = $div.find(".console").val();
				// 아래에 메시지를 추가한다.
				$div.find(".console").val(
						log + "("+ userMap[node.key].id  +") => " + node.message + "\n");
				$div.find(".console").scrollTop($div.find(".console")[0].scrollHeight);
			// bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
			} else if (node.status === "bye") {
				// 해당 키로 div를 찾아서 dom을 제거한다.
				$("[data-key='" + node.key + "']").remove();
			}
		};
		// 전송 버튼을 클릭하면 발생하는 이벤트
		$(document).on("click", ".sendBtn", function() {
			// div 태그를 찾는다.
			let $div = $(this).closest(".float-left");
			// 메시지 텍스트 박스를 찾아서 값을 취득한다.
			let message = $div.find(".message").val();
			// 유저 key를 취득한다.
			let key = $div.data("key");
			// console영역을 찾는다.
			let log = $div.find(".console").val();
			// 아래에 메시지를 추가한다.
			$div.find(".console").val(log + "(상담사) => " + message + "\n");
			$div.find(".console").scrollTop($div.find(".console")[0].scrollHeight);
			// 텍스트 박스의 값을 초기화 한다.
			$div.find(".message").val("");
			// db에 저장하기
			$.ajax({
				url: "${pageContext.request.contextPath}/webSocket/insertChat.do",
				data: {
					id : "상담사",
					room_id : userMap[key].id,
					message : message
				},
				async: true,
				dataType: "json",
				success:function(data) {
					console.log(data);
				}
			});
			// 웹소켓으로 메시지를 보낸다.
			webSocket.send(key + "#####" + message);
		});
		// 텍스트 박스에서 엔터키를 누르면
		$(document).on(
				"keydown",
				".message",
				function() {
					// keyCode 13은 엔터이다.
					if (event.keyCode === 13) {
						// 버튼을 클릭하는 트리거를 발생한다.
						$(this).closest(".float-left").find(".sendBtn")
								.trigger("click");
						// form에 의해 자동 submit을 막는다.
						return false;
					}
					return true;
				});
	</script>
</body>
</html>