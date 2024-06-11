<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<meta charset="UTF-8">
<title>채팅</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

#container {
	display: flex;
	width: 100%;
	height: calc(100vh - 82px);
}

#roomList {
	width: 20%;
	border-right: 1px solid #ddd;
	background-color: #fff;
	display: flex;
	flex-direction: column;
	padding: 10px;
}

#roomList h2 {
	margin-top: 0;
}

#roomList ul {
	list-style-type: none;
	padding-left: 0;
	flex-grow: 1;
	margin-bottom: 0;
}

#roomList li {
	padding: 8px;
	border-bottom: 1px solid #ddd;
	cursor: pointer;
}

#roomList li:hover {
	background-color: #f0f0f0;
}

#newChatBtn {
	padding: 10px 20px;
	border: none;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	margin-top: 10px;
	border-radius: 4px;
	text-align: center;
	width: 100%;
	box-sizing: border-box;
}

#newChatBtn:hover {
	background-color: #0056b3;
}

#chatSection {
	width: 80%;
	display: flex;
	flex-direction: column;
}

#chatHeader {
	padding: 10px;
	background-color: #007bff;
	color: white;
}

#chatArea {
	flex-grow: 1;
	overflow-y: auto;
	padding: 10px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
}

#chatMessageArea {
	overflow-y: auto;
}

#messageInput {
	display: flex;
	padding: 10px;
	background-color: #f0f0f0;
}

#message {
	flex-grow: 1;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

#sendBtn {
	padding: 10px 20px;
	border: none;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	margin-left: 10px;
	border-radius: 4px;
}

#sendBtn:hover {
	background-color: #0056b3;
}
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 300px;
	border-radius: 4px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#createRoomBtn {
	padding: 10px 20px;
	border: none;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	margin-top: 10px;
	border-radius: 4px;
	text-align: center;
	width: 100%;
	box-sizing: border-box;
}

#createRoomBtn:hover {
	background-color: #0056b3;
}

/* 입력 칸 스타일 */
#newRoomName {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 20px;
	background-color: #f0f0f0;
	width: calc(100% - 22px); /* padding 크기를 고려하여 너비 조정 */
	margin-bottom: 10px;
	outline: none; /* 포커스 효과 제거 */
}
</style>
<script type="text/javascript">
	var wsocket;
	var chatRoomId;

	function connect(chatRoomId) {
		if (wsocket !== undefined && wsocket.readyState !== WebSocket.CLOSED) {
			wsocket.close();
		}

		wsocket = new WebSocket("ws://192.168.0.107:8081/web/chat/message-ws/"
				+ chatRoomId);
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}

	function disconnect() {
		var msg = 'msg:[' + $('#nickname').val() + ' 퇴장!]';
		wsocket.send(msg);
		wsocket.close();
	}

	function onOpen(evt) {
		$('#sendBtn').attr('disabled', false);
		var msg = 'msg:[' + $('#nickname').val() + ' 입장!]';
		wsocket.send(msg);
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == 'msg:') {
			appendMessage(data.substring(4));
		}
	}

	function onClose(evt) {
		$('#sendBtn').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');

		// 데이터베이스에 채팅 데이터 입력
		var dt = new Date();
		var obj = {
			'room_id' : chatRoomId,
			'nickname' : nickname,
			'chat_content' : msg,
			'chat_time' : dt
		};

		if (obj) {
			$.ajax({
				type : 'POST',
				url : 'chat/insert',
				headers : {
					'Content-Type' : 'application/json'
				},
				data : JSON.stringify(obj),
				success : function(result) {
					console.log("채팅 입력");
				}
			});
		}
	}

	function appendMessage(msg) {
		$('#chatMessageArea').append(msg + '<br>');
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
	}

	$(document).ready(
			function() {
				$('#message').keypress(
						function(event) {
							var keycode = (event.keyCode ? event.keyCode
									: event.which);
							if (keycode == '13'
									&& $('#sendBtn').attr('disabled', false)
									&& $(this).val().trim() !== "") {
								send();
							}
							event.stopPropagation();
						});

				$('#sendBtn').click(function() {
					var message = $('#message').val().trim();
					if (message !== "") {
						send();
					}
				});

				$('#roomList li').click(function() {
					var clickedRoomId = $(this).data("chatroomid");

					if (chatRoomId === undefined) {
						if (confirm("채팅방에 입장하나요?")) {
							chatRoomId = clickedRoomId;
							var roomName = $(this).text();
							$('#chatHeader').text(roomName);
							connect(chatRoomId);
						}
					} else if (chatRoomId === clickedRoomId) {
						alert("해당 채팅방에 있습니다.");
					} else {
						if (confirm("다른 채팅방으로 이동하나요?")) {
							disconnect();
							chatRoomId = clickedRoomId;
							var roomName = $(this).text();
							$('#chatHeader').text(roomName);
							connect(chatRoomId);
							$('#chatMessageArea').text("");
						}
					}
				});

				var modal = document.getElementById("myModal");
				var btn = document.getElementById("newChatBtn");
				var span = document.getElementsByClassName("close")[0];

				btn.onclick = function() {
					modal.style.display = "block";
				}

				span.onclick = function() {
					modal.style.display = "none";
				}

				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
			});

	$(document).ready(function() {
		$('#createRoomBtn').click(function() {
			var roomName = $('#newRoomName').val().trim();
			if (roomName.length >= 2) {
				$.ajax({
					type : "POST",
					url : "chat/create",
					data : {
						'roomName' : roomName
					},
					success : function(response) {
						alert('채팅방이 생성되었습니다!');

						window.location.href = "chat";
					},
					error : function(xhr, status, error) {
						alert('오류가 발생했습니다: ' + error);
					}
				});
			} else {
				alert("채팅방 이름은 2글자 이상 입력해주세요.");
			}
		});
	});
</script>
</head>
<body>
<nav>
		<div class="wrap">
			<div id="logo">
				<a href="main"><img src="/images/logo.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">솔데스크대
						강남캠</span>
				</p>
			</div>
			<div id="account">
				<a href="chat" title="쪽지함" class="icon message">쪽지함</a> <a
					href="mypage" title="내 정보" class="icon my">내 정보</a>
				<!--  <input
					type="hidden" id="userUserid" value="iparknoori"> <input
					type="hidden" id="userSchool" value="4"> <input
					type="hidden" id="userCampus" value="23">-->
			</div>
			<ul id="menu">
				<li class="active"><a href="main">게시판</a></li>
				<li><a href="timetable">시간표</a></li>
				<li><a href="course">강의실</a></li>
				<!-- <li><a href="/calculator">학점계산기</a></li>-->
				<li><a href="frd">친구</a></li>
			</ul>
		</div>
	</nav>
	<input type="hidden" id="nickname" value="${registerVO.nickname }">
	<div id="container">
		<div id="roomList">
			<h2>채팅방 리스트</h2>
			<ul>
				<c:forEach var="ChatListVO" items="${chatList}">
					<li data-chatroomid="${ChatListVO.room_id}">${ChatListVO.chat_title}</li>
				</c:forEach>
			</ul>
			<input type="button" id="newChatBtn" value="채팅방 만들기">
		</div>
		<div id="chatSection">
			<div id="chatHeader">채팅방을 선택하세요</div>
			<div id="chatArea">
				<div id="chatMessageArea"></div>
			</div>
			<div id="messageInput">
				<input type="text" id="message">
				<button id="sendBtn" disabled>전송</button>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span> <input type="text"
				id="newRoomName" placeholder="채팅방 이름"> <input type="button"
				id="createRoomBtn" value="채팅방 만들기">
		</div>
	</div>
</body>
</html>
