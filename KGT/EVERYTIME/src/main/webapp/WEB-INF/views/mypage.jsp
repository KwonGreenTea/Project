<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style>
/* 스타일링을 여기에 추가하세요 */
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
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

h3 {
	margin-top: 20px;
}

.profile {
	text-align: center;
	margin-bottom: 20px;
}

.profile img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid #ccc;
}

.profile p {
	margin-top: 10px;
	font-size: 18px;
}

.info p {
	margin-bottom: 10px;
	font-size: 18px;
}

.info p label {
	text-align: right;
}

a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: #007bff; /* 파란색 */
}

a:hover {
	color: #0056b3; /* 파란색 조금 진한 색 */
}

</style>
</head>
<body>

	<div class="container">
		<h2>내정보</h2>
		<form action="./logout" method="get">
			<button type="submit">로그아웃</button>
		</form>
		<div class="profile">
			<img src="" alt="프로필 사진">
			<p>${registerVO.name }/${registerVO.nickname }</p>
		</div>
	</div>

	<div class="container">
		<h3>계정</h3>
		<div class="info">
			<p>
				아이디 <label>${registerVO.memberId }</label>
			</p>
			
			<form id="pwForm" action="mypage/password" method="post">
				<input type="hidden" id="idInput" name="id"
					value="${registerVO.memberId}"> <input type="hidden"
					id="pwInput" name="pw" value="${registerVO.password}">
				<button id="submitButton" type="submit" style="display: none;"></button>
			</form>
			<a id="passwordChange"><p>비밀번호 변경</p></a>

			<!-- 비밀번호 변경 시 이벤트 -->
			<script>
				document.getElementById('passwordChange').addEventListener(
						'click', function(event) {
							event.preventDefault();

							document.getElementById('pwForm').submit();
						});
			</script>
			<!-- ------------------ -->

			<form id="emailForm" action="mypage/email" method="post">
				<input type="hidden" id="idInput" name="id"
					value="${registerVO.memberId}"> <input type="hidden"
					id="pwInput" name="pw" value="${registerVO.password}"> <input
					type="hidden" id="emailInput" name="email"
					value="${registerVO.email}">
				<button id="submitButton" type="submit" style="display: none;"></button>
			</form>
			<a id="emailChange"><p>이메일 변경</p></a>

			<!-- 이메일 변경 시 이벤트 -->
			<script>
				document.getElementById('emailChange').addEventListener(
						'click', function(event) {
							event.preventDefault();

							document.getElementById('emailForm').submit();
						});
			</script>
			<!-- ------------------ -->

		</div>
	</div>

	<div class="container">
		<h3>커뮤니티</h3>
		<div class="info">
			<form id="nicknameForm" action="mypage/nickname" method="post">
				<input type="hidden" id="idInput" name="id" value="${registerVO.memberId}"> 
				<input type="hidden" id="nickInput" name="nickname" value="${registerVO.nickname}">
				<button id="submitButton" type="submit" style="display: none;"></button>
			</form>
			<a id="nicknameChange"><p>닉네임 설정</p></a>

			<!-- 닉네임 변경 시 이벤트 -->
			<script>
				document.getElementById('nicknameChange').addEventListener(
						'click', function(event) {
							event.preventDefault();

							document.getElementById('nicknameForm').submit();
						});
			</script>
			<!-- ------------------ -->
		</div>
	</div>
	
	
	
	<div class="container">
		<h3>이용 안내</h3>
		<a href="inquiry"><p>문의하기</p></a>
	</div>
	
	<div class="container">
		<h3>기타</h3>
		<a href="unregister"><p>회원 탈퇴</p></a>
	</div>

</body>
</html>
