<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var wsocket;

	function connect() {
		wsocket = new WebSocket("ws://192.168.0.107:8081/web/chat/message-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;

		$('#message').attr('disabled', false);
	}

	function disconnect() {
		var msg = 'msg:[' + $('#nickname').val() + '퇴장!]';
		wsocket.send(msg);
		wsocket.close();  // 추가: 연결을 명시적으로 닫기
	}

	function onOpen(evt) {
		var msg = 'msg:[' + $('#nickname').val() + '입장!]';
		wsocket.send(msg);
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == 'msg:') {
			appendMessage(data.substring(4));
			if (data.includes('퇴장!') && data.includes($('#nickname').val())) {
				wsocket.close();
			}
		}
	}

	function onClose(evt) {
		$('#nickname').val("");
		$('#message').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');
	}

	function appendMessage(msg) {
		$('#chatMessageArea').append(msg + '<br>');
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
	}

	$(document).ready(function() {
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			send();
		});
		$('#enterBtn').click(function() {
			if ($('#nickname').val() == '') {
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			connect();
		});
		$('#exitBtn').click(function() {
			if ($('#nickname').val() == '') {
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			disconnect();
		});
	});
</script>
<style type="text/css">
#chatArea {
	width: 300px;
	height: 100px;
	overflow-y: auto;
	border: 1px solid black;
}
</style>
</head>

<body>
	이름 :
	<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="입장">
	<input type="button" id="exitBtn" value="나가기">

	<h1>대화 영역</h1>
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br>
	<input type="text" id="message" disabled>
	<input type="button" id="sendBtn" value="전송">
</body>
</html>
