<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f9fa; /* 연한 그레이 */
}

.container {
	width: 50%;
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

input[type="text"] {
	width: calc(100% - 22px); /* input 너비 조정 */
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

#error-message {
	color: red;
	font-size: 14px;
}
</style>
</head>
<body>

	<div class="container">
		<h2>닉네임 변경</h2>
		<form id="nicknameForm" action="nickname/do" method="post">
			<input type="hidden" id="idHidden" name="id"
				value="${registerVO.memberId}"> 
			<label for="newNick">닉네임</label>
			<input type="text" id="newNick" name="newNickname" placeholder="닉네임"
				value="${registerVO.nickname }" maxlength="12" required><br>
			<div id="error-message"></div>
			<input type="submit" value="닉네임 변경">
		</form>

		<script>
			document.getElementById('nicknameForm').addEventListener('submit',
					function(event) {
						event.preventDefault();
						alert('닉네임 변경이 완료되었습니다.');
						this.submit();
					});
		</script>
	</div>

</body>
</html>
