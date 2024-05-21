<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa; /* 연한 그레이 */
}

.container {
	width: 60%;
	margin: 20px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

form {
	text-align: center;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 10px;
}

input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box; /* padding과 border 포함하여 크기 설정 */
}

input[type="submit"] {
	width: 100%;
	padding: 15px;
	background-color: #007bff; /* 파란색 */
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3; /* 파란색 조금 진한 색 */
}

#chk-message, #error-message{
	font-size: 14px;
}

</style>
</head>
<body>

<div class="container">
	<h2>비밀번호 변경</h2>
	<form id="pwForm" action="password/do" method="post">
		<input type="hidden" id="idHidden" name="id" value="${registerVO.memberId}"> 
		<label for="newPw">새 비밀번호</label>
		<input type="password" id="newPw" name="newPw" placeholder="새 비밀번호" required>
		<input type="password" id="newPwChk" name="newPwChk" placeholder="새 비밀번호 확인" required disabled>
		<div id="chk-message"></div><br>
		<button id="chkButton" style="display: none;"></button>
		<label for="nowPw">현재 비밀번호</label>
		<input type="password" id="nowPw" name="nowPw" placeholder="현재 비밀번호" required>
		<div id="error-message"></div><br>
		<input type="submit" id="submitButton" value="비밀번호 변경">
	</form>
</div>

<script>
	$(document).ready(function() {
		 $('#newPw').on('input', function() {
             $('#newPwChk').prop('disabled', this.value.length === 0);
             $('#newPwChk').val('');
         });
		
		
		$('#newPwChk').on('input', function() {
			var pw = $('#newPw').val();
			var pwChk = $(this).val();
			var chkMessageDiv = $('#chk-message');
			var chkButton = $('#chkButton');
			
			if(pw === pwChk) {
				chkMessageDiv.text('비밀번호가 같습니다.').css('color', 'green');
				chkButton.prop('disabled', false);
			} else {
				chkMessageDiv.text('비밀번호가 일치하지 않습니다.').css('color', 'red');
				chkButton.prop('disabled', true);
			}
		});
		
	    $('#nowPw').on('input', function() {
	        var password = $(this).val();
	        var memberId = $('#idHidden').val();
	        var errorMessageDiv = $('#error-message');
	        var submitButton = $('#submitButton');
	        var obj = {
	            'memberId': memberId,
	            'password': password
	        };

	        if (password.length > 0) {
	            $.ajax({
	                type: 'POST',
	                url: 'verifyPw',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                data: JSON.stringify(obj),
	                success: function(result) {
	                    if (result === 1) {
	                        errorMessageDiv.text('비밀번호가 일치합니다.').css('color', 'green');
	                        submitButton.prop('disabled', false);
	                    } else {
	                        errorMessageDiv.text('비밀번호가 일치하지 않습니다.').css('color', 'red');
	                        submitButton.prop('disabled', true);
	                    }
	                }
	            });
	        } else {
	            errorMessageDiv.text('');
	            submitButton.prop('disabled', true);
	        }
	    });

	    $('#pwForm').on('submit', function(event) {
	        if (($('#submitButton').prop('disabled') === false) && ($('#chkButton').prop('disabled') === false)) {
	            event.preventDefault();
	            alert('비밀번호 변경이 완료되었습니다.');
	            this.submit();
	        } else {
	        	alert('비밀번호가 틀립니다.');
	        }
	    });
	});     
	</script>

</body>
</html>
