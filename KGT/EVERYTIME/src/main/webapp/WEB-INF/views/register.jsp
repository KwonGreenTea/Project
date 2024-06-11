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
            width: calc(100% - 22px);
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

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .id-check-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px; /* 아이디 확인 컨테이너의 하단 여백 */
        }

        .id-check-container input[type="text"] {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
        }

        .id-check-container button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .id-check-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>회원가입</h2>
<form id="registerForm" action="register" method="post">
    <label for="memberId">아이디:</label>
    <div class="id-check-container">
        <input type="text" id="memberId" name="memberId" required>
        <button type="button" id="checkId">중복 확인</button>
    </div>
    <div class="error-message" id="idError" style="display: none;">아이디를 입력해주세요.</div>
    <div class="error-message" id="idExist" style="display: none;">이미 사용 중인 아이디입니다.</div>
    <div class="success-message" id="idAvailable" style="display: none;">사용 가능한 아이디입니다.</div>
    <br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <label for="passwordConfirm">비밀번호 확인:</label>
    <input type="password" id="passwordConfirm" name="passwordConfirm" required><br>
    <div class="error-message" id="passwordMismatch" style="display: none;">비밀번호가 일치하지 않습니다.</div><br>
    
    <label for="nickname">닉네임:</label>
    <input type="text" id="nickname" name="nickname" required><br><br>
    
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required><br><br>
    
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone" required><br><br>
    
    <input type="submit" id="submitButton" value="가입하기">
    
    <div class="error-message" id="errorMessage" style="display: none;"></div>
</form>

<!-- JavaScript -->
<script type="text/javascript">
    $(document).ready(function() {
        var isIdChecked = false; // 중복 확인 여부를 저장하는 변수

        $('#registerForm').submit(function(e) {
            e.preventDefault(); // 기본 이벤트 방지
            
            if (!isIdChecked) {
                alert('아이디 중복 확인을 해주세요.');
                return; // 가입 요청 중단
            }

            var password = $('#password').val();
            var passwordConfirm = $('#passwordConfirm').val();
            
            if (password !== passwordConfirm) {
                $('#passwordMismatch').show();
                return; // 가입 요청 중단
            }

            $('#passwordMismatch').hide();

            // 폼 데이터를 직렬화하여 변수에 저장
            var formData = $(this).serialize();

            // Ajax를 사용하여 회원 가입 요청 전송
            $.ajax({
                url: 'register',
                type: 'post',
                data: formData,
                success: function(response) {
                    // 가입이 성공적으로 완료되었을 때 로그인 페이지로 리디렉션
                    alert('회원 가입이 완료되었습니다.');
                    window.location.href = 'login'; // 로그인 페이지로 리디렉션
                },
                error: function(xhr, status, error) {
                    // 오류가 발생했을 때 처리
                    $('#errorMessage').text('회원 가입 중 오류가 발생하였습니다.').show();
                }
            });
        });

        // 비밀번호 확인 실시간 체크
        $('#password, #passwordConfirm').on('keyup', function () {
            if ($('#password').val() === $('#passwordConfirm').val()) {
                $('#passwordMismatch').hide();
            } else {
                $('#passwordMismatch').show();
            }
        });

        // 아이디 중복 확인
        $('#checkId').click(function() {
            var memberId = $('#memberId').val();
            
            if (!memberId) {
                $('#idError').show();
                $('#idExist').hide();
                $('#idAvailable').hide();
                return;
            } else {
                $('#idError').hide();
                $.ajax({
                    url: 'checkId',
                    type: 'post',
                    data: { memberId: memberId },
                    success: function(result) {
                        if (result != null) {
                            if (result == 1) {
                                $('#idExist').show();
                                $('#idAvailable').hide();
                                isIdChecked = false; // 중복된 아이디
                            } else {
                                $('#idExist').hide();
                                $('#idAvailable').show();
                                isIdChecked = true; // 사용 가능한 아이디
                            }
                        } else {
                            $('#idError').show();
                            $('#idExist').hide();
                            $('#idAvailable').hide();
                            isIdChecked = false; // 오류 발생
                        }
                    },
                    error: function(xhr, status, error) {
                        $('#idError').text('아이디 확인 중 오류가 발생하였습니다.').show();
                        $('#idExist').hide();
                        $('#idAvailable').hide();
                        isIdChecked = false; // 오류 발생
                    }
                });
            }
        });

        // 아이디 입력 필드의 입력 이벤트 핸들러 추가
        $('#memberId').on('input', function() {
            $('#idError').hide();
            $('#idExist').hide();
            $('#idAvailable').hide();
            isIdChecked = false; // 아이디가 변경되면 중복 확인 상태 초기화
        });
    });
</script>

</body>
</html>
