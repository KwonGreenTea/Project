<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        height: 100vh;
    }
    #roomList {
        width: 20%;
        border-right: 1px solid #ddd;
        background-color: #fff;
        padding: 10px;
    }
    #roomList h2 {
        margin-top: 0;
    }
    #roomList ul {
        list-style-type: none;
        padding-left: 0;
    }
    #roomList li {
        padding: 8px;
        border-bottom: 1px solid #ddd;
        cursor: pointer;
    }
    #roomList li:hover {
        background-color: #f0f0f0;
    }
    #chatSection {
        width: 80%;
        display: flex;
        flex-direction: column;
    }
    #chatHeader {
        padding: 10px;
        background-color: #fff;
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
</style>
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

        // 채팅방 목록 클릭 시 이벤트 핸들러 추가
        $('#roomList li').click(function() {
            var roomName = $(this).text();
            $('#chatHeader').text('채팅방: ' + roomName);
        });
    });
</script>
</head>

<body>
<div id="container">
    <div id="roomList">
        <h2>쪽지함</h2>
        <ul>
            <li>채팅방 1</li>
            <li>채팅방 2</li>
            <li>채팅방 3</li>
        </ul>
    </div>
    <div id="chatSection">
        <div id="chatHeader">
            채팅방을 선택하세요
        </div>
        <div id="chatArea">
            <div id="chatMessageArea"></div>
        </div>
    </div>
</div>
</body>
</html>
