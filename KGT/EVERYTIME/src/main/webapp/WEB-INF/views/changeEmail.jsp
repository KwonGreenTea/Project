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
	background-color: #f8f9fa;
}

.container {
	width: 50%;
	margin: 20px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

input[type="email"], input[type="password"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 15px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

#error-message {
	font-size: 14px;
}
</style>
</head>
<body>

	<div class="container">
		<h2>이메일 변경</h2>
		<form id="emailForm" action="email/do" method="post">
	        <input type="hidden" id="idHidden" name="id" value="${registerVO.memberId}">
	        <label for="newEmail">이메일</label>
	        <input type="email" id="newEmail" name="newEmail" placeholder="이메일" value="${registerVO.email}" required><br>
	        <input type="password" id="pwChk" name="pwChk" placeholder="계정 비밀번호" required><br>
	        <div id="error-message"></div><br>
	        <input type="submit" value="이메일 변경" id="submitButton" disabled>
	    </form>
	</div>

	<script>
	$(document).ready(function() {
	    $('#pwChk').on('input', function() {
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

	    $('#emailForm').on('submit', function(event) {
	        if ($('#submitButton').prop('disabled') === false) {
	            event.preventDefault();
	            alert('이메일 변경이 완료되었습니다.');
	            this.submit();
	        } else {
	        	alert('비밀번호가 틀립니다.');
	        }
	    });
	});

	      
	</script>

</body>
</html>
