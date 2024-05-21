<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* 연한 그레이 */
        }

        h2 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        input[type="text"],
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

        p {
            text-align: center;
            margin-top: 20px;
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

<h2>회원 로그인</h2>
<form action="login" method="post">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <input type="submit" value="로그인">
</form>

<!-- 회원가입 페이지로 이동하는 링크 -->
<p>아직 회원이 아니신가요? <a href="register">회원가입</a></p>

</body>
</html>
