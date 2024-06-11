<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h2>친구 추가 기능</h2>
	<form action="frd/friend" method="post">
		<label for="responseId">친구 아이디:</label> <input type="text"
			id="responseId" name="responseId"><br> <br> <input
			type="submit" value="친구추가">
	</form>


	<ul>
		<li>친구 요청 목록을 출력</li>
		<c:forEach var="friendVO" items="${requestList}">
            ${friendVO.responseId} 님이 친구 요청을 보냈습니다
             <form action="frd/accept" method="post">
             <input type="text" id="responseId" name="responseId"
					value="${friendVO.responseId }" style="display: none;"> <input
					type="submit" value="수락">
			</form>
			<form action="frd/delete" method="post">
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
				<form action="frd/delete" method="post">
					<input type="text" id="responseId" name="responseId"
						value="${friendVO.requestId}" style="display: none;"> <input
						type="submit" value="삭제">
				</form>
			</c:if>
		</c:forEach>
	</ul>

</body>
</html>