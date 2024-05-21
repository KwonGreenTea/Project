<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.everytime.web.domain.RegisterVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        input[type="password"],
        input[type="email"] {
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

        #error-message {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>

<h2>회원가입</h2>
<form id="registerForm" action="register" method="post">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <label for="nickname">닉네임:</label>
    <input type="text" id="nickname" name="nickname" required><br><br>
    
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone" required><br><br>
    
    <input type="submit" id="submitButton" value="가입하기">
</form>

<!-- JavaScript -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#registerForm').submit(function(e) {
            e.preventDefault(); // 기본 이벤트 방지

            // 폼 데이터를 직렬화하여 변수에 저장
            var formData = $(this).serialize();

            // Ajax를 사용하여 회원 가입 요청 전송
            $.ajax({
                url: 'register',
                type: 'post',
                data: formData,
                success: function(response) {
                    // 가입이 성공적으로 완료되었다는 알림창 표시
                    alert('회원 가입이 완료되었습니다.');

                    <!-- // 로그인 페이지로 이동
                    window.location.href = '/login'; -->
                },
                error: function(xhr, status, error) {
                    // 오류가 발생했을 때 처리
                    alert('회원 가입 중 오류가 발생하였습니다.');
                }
            });
        });
    });
</script>

</body>
</html>
