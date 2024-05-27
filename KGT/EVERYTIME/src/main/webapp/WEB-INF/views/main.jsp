<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>메인화면입니다.</label>

<!-- 
	<h2>친구 추가 기능</h2>
	<form action="main/friend" method="post">
		<label for="responseId">친구 아이디:</label> <input type="text"
			id="responseId" name="responseId"><br> <br> <input
			type="submit" value="친구추가">
	</form>


	<ul>
		<li>친구 요청 목록을 출력</li>
		<c:forEach var="friendVO" items="${requestList }">
            ${friendVO.responseId} 님이 친구 요청을 보냈습니다
             <form action="main/accept" method="post">
				<input type="text" id="responseId" name="responseId"
					value="${friendVO.responseId }" style="display: none;"> <input
					type="submit" value="수락">
			</form>
			<form action="main/delete" method="post">
				<input type="text" id="responseId" name="responseId"
					value="${friendVO.responseId }" style="display: none;"> <input
					type="submit" value="거절">
			</form>
		</c:forEach>
	</ul>


	<ul>
		<li>친구 목록을 출력</li>
		<c:forEach var="friendVO" items="${friendlist}">
			<c:if test="${not empty friendVO.requestId}">
        ${friendVO.requestId} 님과 친구입니다 <br>
				<form action="main/delete" method="post">
					<input type="text" id="responseId" name="responseId"
						value="${friendVO.requestId}" style="display: none;"> <input
						type="submit" value="삭제">
				</form>
			</c:if>
		</c:forEach>
	</ul>
	 -->

	<a href="chat">채팅</a>

	<a href="timetable">시간표</a>

	<a href="mypage">마이페이지</a>

</body>
</html>