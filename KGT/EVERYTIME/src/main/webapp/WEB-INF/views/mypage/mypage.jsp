<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에브리타임</title>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
</head>
<body>

	<%@ include file="../header.jspf"%>

	<div class="container first-container">
		<h2>내정보</h2>
		<form action="./logout" method="get">
			<button type="submit">로그아웃</button>
		</form>
		<div class="profile">
			<img src="resources/images/profile.png" alt="프로필 사진">
			<p>${registerVO.name }/${registerVO.nickname }</p>
		</div>
	</div>

	<div class="container">
		<h3>계정</h3>

		<p>
			<h4>아이디</h4> <label>${registerVO.memberId }</label>
		</p>

		<form id="pwForm" action="mypage/password" method="post">
			<input type="hidden" id="idInput" name="id"
				value="${registerVO.memberId}"> <input type="hidden"
				id="pwInput" name="pw" value="${registerVO.password}">
			<button id="passwordChange" type="button">비밀번호 변경</button>
		</form>

		<form id="emailForm" action="mypage/email" method="post">
			<input type="hidden" id="idInput" name="id"
				value="${registerVO.memberId}"> <input type="hidden"
				id="pwInput" name="pw" value="${registerVO.password}"> <input
				type="hidden" id="emailInput" name="email"
				value="${registerVO.email}">
			<button id="emailChange" type="button">이메일 변경</button>
		</form>

		<form id="nicknameForm" action="mypage/nickname" method="post">
			<input type="hidden" id="idInput" name="id"
				value="${registerVO.memberId}"> <input type="hidden"
				id="nickInput" name="nickname" value="${registerVO.nickname}">
			<button id="nicknameChange" type="button">닉네임 설정</button>
		</form>
	</div>

	<div class="container">
		<h3>이용 안내</h3>
		<div class="info">
			<button id="inquiryBtn">문의하기</button>
		</div>
	</div>

	<div class="container">
		<h3>회원 탈퇴</h3>
		<div class="info">
			<button id="unregisterBtn">회원 탈퇴</button>
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById('passwordChange').addEventListener('click',
				function(event) {
					event.preventDefault();
					document.getElementById('pwForm').submit();
				});

		document.getElementById('emailChange').addEventListener('click',
				function(event) {
					event.preventDefault();
					document.getElementById('emailForm').submit();
				});

		document.getElementById('nicknameChange').addEventListener('click',
				function(event) {
					event.preventDefault();
					document.getElementById('nicknameForm').submit();
				});

		document.getElementById('inquiryBtn').addEventListener('click',
				function(event) {
					event.preventDefault();
					window.location.href = "inquiry";
				});
		
		document.getElementById('unregisterBtn').addEventListener('click',
				function(event) {
					event.preventDefault();
					window.location.href = "unregister";
				});
	</script>

</body>
</html>

