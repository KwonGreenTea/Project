<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리타임</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#writeArticleButton").click(function() {
			$("#write_form").show();
			$("#writeArticleButton").hide();
		});
	});
</script>
</head>

<body>

	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="main"><img src="resources/images/soldesk.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">솔데스크대
						강남캠</span>
				</p>
			</div>
			<div id="account">
				<a href="chat" title="쪽지함" class="icon message">쪽지함</a> <a
					href="mypage" title="내 정보" class="icon my">내 정보</a>
			</div>
			<ul id="menu">
				<li class="active"><a href="main">게시판</a></li>
				<li><a href="time">시간표</a></li>
				<li><a href="course">강의실</a></li>
				<li><a href="calculator">학점계산기</a></li>
				<li><a href="frd">친구</a></li>
			</ul>
		</div>
	</nav>
	
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="main" class="new">자유게시판</a></li>

				</ul>
			</div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				</ul>
			</div>
			<div class="group">
				<ul>
					<li><a href="/community/search" class="search">게시판 찾기</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
		<input type="hidden" id="communityCampusId" value="23">
	</div>


	<div id="container" class="article">
		<input type="hidden" id="isUser" value="1"> <input
			type="hidden" id="boardId" value="370449">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>
					<a href="/370449">자유게시판</a>
				</h1>
			</div>
		</aside>
		<div class="wrap title">
			<h1>
				<a href="/370449">자유게시판</a>
			</h1>
			<hr>
		</div>
		<div class="wrap notification none"></div>
		<div class="wrap bubbles">
			<div class="bubble question">
				<div class="group"></div>
				<div class="items">
					<div class="item">
						<a href="/370449/v/343043794"><span>질문</span></a>
					</div>
				</div>
			</div>
			<div class="bubble popular">
				<div class="group"></div>
				<div class="item">
					<a href="/370449/v/343054561"><span>인기 게시물</span>
						<div class="posvote">50</div></a>
				</div>
			</div>
		</div>

		<!-- 게시물 등록 -->

		<div class="wrap articles">
			<a id="writeArticleButton">새 글을 작성해주세요!</a>
			<form id="write" action="post/create" method="post"
				class="write" style="display: none">

				<input type="hidden" name="boardId" id="boardId" value="1"> <input
					type="hidden" name="memberId" value="1">

				<p>
					<input name="postTitle" autocomplete="off" placeholder="글 제목"
						class="title">
				</p>
				<p>
					<textarea name="postContent" placeholder="글 내용"
						class="smallplaceholder"></textarea>
				</p>
				<input type="hidden" name="postAnonymous" value="0">
				<ul class="option">
					<li title="첨부" class="attach"></li>
					<li title="완료" class="submit" id="submitBtn"></li>
					<li title="익명" class="anonym"><br> <input type="checkbox"
						name="PostAnonymous" value="1"><a> 익명</a></li>
				</ul>
				<div class="clearBothOnly"></div>
			</form>

		</div>

		<!-- 				<input type="text" name="boardId" value="1"> 
				<input type="text" name="memberId" value="1">  -->

		<!-- 게시물 목록 -->
		<div class="wrap articles">
			<c:forEach var="postVO" items="${postList}">
				<article class="list">
					<a class="article" href="post/detail?boardId=1&postId=${postVO.postId}">
						<div class="desc">
							<h2 class="medium bold">${postVO.postTitle}</h2>
							<p class="medium">${postVO.postContent}</p>
							<div class="info">
								<ul class="status">
									<li title="댓글" class="comment">1</li> <!-- 댓글 개수 -->
								</ul>
								<time class="small">
									<fmt:formatDate value="${postVO.postCreatedDate}"
										pattern="MM/dd" />  <!-- 작성 날짜 -->
								</time>
								<h3 class="small">익명</h3>
							</div>
							<hr />
						</div>

					</a>
					<div class="comments"></div>
				</article>
			</c:forEach>
		</div>


		<!-- 게시물 목록 끝 -->
		<!-- div class="clearBothOnly"></div-->
		<div class="wrap ">
			<div class="pagination">
				<form id="searchArticleForm" class="search">
					<select name="search_type"><option value="4">전체</option>
						<option value="2">글 제목</option>
						<option value="1">글 내용</option></select><input name="keyword"
						placeholder="검색어를 입력하세요." class="text">
				</form>
				<a href="" class="next">다음</a>
			</div>
		</div>
	</div>

	<hr>
	<script>
		document
				.getElementById('writeArticleButton')
				.addEventListener(
						'click',
						function() {
							document.getElementById('write').style.display = 'block';
						});

		document.getElementById('submitBtn').addEventListener('click',
				function() {
					document.getElementById('write').submit();
				});
	</script>

</body>
</html>