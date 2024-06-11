<!-- update.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form action="update" method="POST">
    	<div>
        	<p>아이디 :</p>
        	<input type="text" name="memberId" value="${RegisterVO.memberId }" readonly>
        </div>
        <div>
        	<p>비밀번호 :</p>
        	<input type="password" name="password" value="${RegisterVO.password }" required>
        </div>
        <div>
        	<p>닉네임 :</p>
        	<input type="text" name="nickname" value="${RegisterVO.nickname }" required>
        </div>
        <div>
        	<p>이름 :</p>
        	<input type="text" name="name" value="${RegisterVO.name }" required>
        </div>
        <div>
        	<p>이메일 :</p>
        	<input type="email" name="email" value="${RegisterVO.email }" required>
        </div>
        <div>
        	<p>핸드폰 :</p>
        	<input type="text" name="phone" value="${RegisterVO.phone }" required>
        </div>
        <div>
        	<input type="submit" value="등록">
        </div>
    </form>
</body>
</html>
