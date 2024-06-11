<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<script src="https://code.jquery.com/jquery-3.7.1.js">
</script>
<link rel="stylesheet" href="https://everytime.kr/css/common.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/common.partial.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.article.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.community.css" />
<link rel="stylesheet"
	href="https://everytime.kr/css/container.modal.css" />
</head>
<style>
body {
	overflow-y: auto;
}

#bottom {
	display: none;
}

/* * * * * * * * * * * * * * * * * * * * * * * * *  /  common  /  * * * * * * * * * * * * * * * * * * * * * * * * */
#container div.tablehead>div.empty {
	padding: 120px 0;
	text-align: center;
}

#container div.tablehead>div.empty>p {
	display: inline-block;
	padding-top: 52px;
	color: #ffffff;
	font-size: 18px;
	font-weight: bold;
	background-size: 48px 44px;
}

#container table.tablehead {
	border-collapse: collapse;
	width: 88%;
}

#container table.tablebody {
	border-collapse: collapse;
	width: 100%;
}

#container table.tablehead {
	background-color: #f2f2f2;
}

#container table.tablehead tr {
	height: 40px;
}

#container table.tablehead tr th, #container table.tablehead tr td {
	border-width: 1px;
	border-style: solid;
	border-color: #d6d6d6;
	color: #a6a6a6;
	font-weight: normal;
	text-align: center;
}

#container table.tablebody {
	background-color: transparent;
}

#container table.tablebody tr th, #container table.tablebody tr td {
	border: 1px solid #d6d6d6;
	vertical-align: top;
}

#container table.tablebody tr th div.hours {
	position: absolute;
	z-index: 11;
}

#container table.tablebody tr th div.hours div.hour {
	position: absolute;
	z-index: 10;
	left: 0;
	width: 100%;
}

#container table.tablebody tr th div.hours div.hour, #container table.tablebody tr th div.times div.time
	{
	box-sizing: border-box;
	border-top: 1px solid #d6d6d6;
	color: #a6a6a6;
	font-weight: normal;
	text-align: center;
}

#container table.tablebody tr td div.cols {
	position: absolute;
	z-index: 11;
}

#container table.tablebody tr td div.cols div.subject {
	position: absolute;
	z-index: 10;
	overflow: hidden;
	box-sizing: border-box;
	width: 100%;
	border: 1px solid #d6d6d6;
	border-width: 1px 0;
}

#container table.tablebody tr td div.cols div.subject h3 {
	color: #292929;
	font-weight: bold;
}

#container table.tablebody tr td div.cols div.subject p em {
	margin-right: 5px;
	color: #737373;
	font-weight: bold;
}

#container table.tablebody tr td div.cols div.subject p span {
	color: #737373;
}

#container table.tablebody tr td div.cols div.preview {
	background-color: #d6d6d6;
}

#container table.tablebody tr td div.grids div.grid {
	box-sizing: border-box;
	border-top: 1px solid #e3e3e3;
}

#container table.tablebody tr td ul.status {
	display: none;
	float: right;
}

#container table.tablebody tr td ul.status li {
	float: left;
	width: 15px;
	height: 15px;
	background-repeat: no-repeat;
	background-position: center center;
	cursor: pointer;
}

#container table.tablebody tr td ul.status li.search {
	background-image: url('/images/container.timetable.search.png');
}

#container table.tablebody tr td ul.status li.edit {
	background-image: url('/images/container.timetable.edit.png');
}

#container table.tablebody tr td ul.status li.del {
	background-image: url('/images/container.timetable.del.png');
}

#container div.nontimes {
	margin-top: 8px;
	border: 1px solid #d6d6d6;
}

#container div.nontimes div.subject {
	padding: 0 16px;
	border-bottom: 1px solid #ededed;
}

#container div.nontimes div.subject:last-of-type {
	border-bottom: 0;
}

#container div.nontimes div.subject span {
	display: inline-block;
	line-height: 48px;
	vertical-align: middle;
	font-size: 14px;
}

#container div.nontimes div.subject span.name {
	margin-right: 8px;
	color: #292929;
	font-weight: bold;
}

#container div.nontimes div.subject span.place {
	margin-right: 8px;
	color: #737373;
}

#container div.nontimes div.subject span.del {
	width: 24px;
	height: 24px;
	background: transparent url('/images/container.timetable.del.png')
		no-repeat center center;
	cursor: pointer;
}

#container ul.floating {
	position: fixed;
	z-index: 80;
	bottom: 15px;
}

#container ul.floating li.button {
	float: left;
	margin: 0 1px;
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	background-color: #F91F15;
	background-repeat: no-repeat;
}

#container ul.floating li.button.search {
	padding: 0 15px 0 45px;
	border-radius: 20px 0 0 20px;
	background-image: url('/images/container.timetable.search.icon.png');
	background-position: 20px center;
}

#container ul.floating li.button.custom {
	padding: 0 20px 0 30px;
	border-radius: 0 20px 20px 0;
	background-image: url('/images/container.timetable.custom.icon.png');
	background-position: 10px center;
}

#container ul.floating li.button.only {
	padding: 0 25px 0 50px;
	border-radius: 20px;
	background-position: 25px center;
}

/* * * * * * * * * * * * * * * * * * * * * * * * *  /  pc only  /  * * * * * * * * * * * * * * * * * * * * * * * * */
@media only screen and (min-width: 641px) {
	#container div.tablehead {
		position: fixed;
		z-index: 90;
		margin-top: -15px;
		padding-top: 15px;
		width: inherit;
		background-color: #f8f8f8;
	}
	#container div.tablebody { /* ================= 수정 부분 =====*/
		margin-top: 0px;
		width: inherit;
	}
}

@media only screen and (min-width: 1367px) {
	#container table.tablehead tr td {
		font-size: 14px;
	}
	#container table.tablehead tr th, #container table.tablebody tr th,
		#container table.tablebody tr th div {
		width: 70px;
	}
	#container table.tablebody tr th div.times div.time, #container table.tablebody tr td div.grids div.grid
		{
		height: 60px;
		line-height: 60px;
		font-size: 13px;
	}
	#container table.tablebody tr th div.times div.time.small, #container table.tablebody tr td div.grids div.grid.small
		{
		height: 30px;
		line-height: 30px;
	}
	#container table.tablebody tr th div.hours div.hour {
		font-size: 14px;
	}
	#container table.tablebody tr td h3 {
		margin: 10px 10px 0 10px;
		font-size: 14px;
		line-height: 20px;
	}
	#container table.tablebody tr td p {
		margin: 0 10px 10px 10px;
		line-height: 15px;
	}
	#container table.tablebody tr td p em {
		font-size: 12px;
	}
	#container table.tablebody tr td p span {
		font-size: 12px;
	}
	#container table.tablebody tr td ul.status {
		margin: 10px 10px 0 0;
	}
}

@media only screen and (min-width: 641px) and (max-width: 1366px) {
	#container table.tablehead tr td {
		font-size: 13px;
	}
	#container table.tablehead tr th, #container table.tablebody tr th,
		#container table.tablebody tr th div {
		width: 50px;
	}
	#container table.tablebody tr th div.hours div.hour {
		font-size: 13px;
	}
	#container table.tablebody tr th div.times div.time, #container table.tablebody tr td div.grids div.grid
		{
		height: 50px;
		line-height: 50px;
		font-size: 12px;
	}
	#container table.tablebody tr th div.times div.time.small, #container table.tablebody tr td div.grids div.grid.small
		{
		height: 25px;
		line-height: 25px;
	}
	#container table.tablebody tr td h3 {
		margin: 7px 7px 0 7px;
		font-size: 12px;
		line-height: 13px;
	}
	#container table.tablebody tr td p {
		margin: 0 7px 7px 7px;
		line-height: 12px;
	}
	#container table.tablebody tr td p em {
		font-size: 11px;
	}
	#container table.tablebody tr td p span {
		font-size: 11px;
	}
	#container table.tablebody tr td ul.status {
		margin: 7px 7px 0 0;
	}
}

ul.floating {
	position: fixed;
	left: 0;
	bottom: 0;
	width: calc(100% - 120px);
	/* 60px는 버튼 전체 너비의 합으로 가정합니다. 필요에 따라 조절해주세요. */
	z-index: 80;
	padding-right: 120px; /* 버튼 전체 너비만큼 여백을 줍니다. */
}

ul.floating li.button {
	float: right;
	margin: 0 1px;
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	background-color: #F91F15;
	background-repeat: no-repeat;
}

ul.floating li.button.custom {
	padding: 0 20px 0 30px;
	border-radius: 0 20px 20px 0;
	background-image: url('/images/new/container.modal.close.png');
	background-position: 10px center;
}
</style>
<body>
	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="main"><img src="/images/logo.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">솔데스크대
						강남캠</span>
				</p>
			</div>
			<div id="account">
				<a href="chat" title="쪽지함" class="icon message">쪽지함</a> <a
					href="mypage" title="내 정보" class="icon my">내 정보</a>
				<!--  <input
					type="hidden" id="userUserid" value="iparknoori"> <input
					type="hidden" id="userSchool" value="4"> <input
					type="hidden" id="userCampus" value="23">-->
			</div>
			<ul id="menu">
				<li class="active"><a href="main">게시판</a></li>
				<li><a href="timetable">시간표</a></li>
				<li><a href="course">강의실</a></li>
				<!-- <li><a href="/calculator">학점계산기</a></li>-->
				<li><a href="frd">친구</a></li>
			</ul>
		</div>
	</nav>


	<div id="container" class="timetable" style="height: 871px;">
		<div class="wrap" style="width: 90%;">
			<div class="tablehead">
				<table class="tablehead" style="margin-top: 80px;">
					<tbody>
						<tr>
							<th></th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td style="display: none;">토</td>
							<td style="display: none;">일</td>
							<th></th>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="tablebody">
				<table class="tablebody" style="margin-top: -360px;">
					<tbody>
						<tr>
							<th>
								<div class="hours">
									<div class="hour"
										style="height: 30px; top: 450px; line-height: 30px;">0교시</div>
									<div class="hour"
										style="height: 30px; top: 480px; line-height: 30px;">1교시</div>
									<div class="hour"
										style="height: 30px; top: 510px; line-height: 30px;">2교시</div>
									<div class="hour"
										style="height: 30px; top: 540px; line-height: 30px;">3교시</div>
									<div class="hour"
										style="height: 30px; top: 570px; line-height: 30px;">4교시</div>
									<div class="hour"
										style="height: 30px; top: 600px; line-height: 30px;">5교시</div>
									<div class="hour"
										style="height: 30px; top: 630px; line-height: 30px;">6교시</div>
									<div class="hour"
										style="height: 30px; top: 660px; line-height: 30px;">7교시</div>
									<div class="hour"
										style="height: 30px; top: 690px; line-height: 30px;">8교시</div>
									<div class="hour"
										style="height: 30px; top: 720px; line-height: 30px;">9교시</div>
									<div class="hour"
										style="height: 30px; top: 750px; line-height: 30px;">10교시</div>
									<div class="hour"
										style="height: 30px; top: 780px; line-height: 30px;">11교시</div>
									<div class="hour"
										style="height: 30px; top: 810px; line-height: 30px;">12교시</div>
									<div class="hour"
										style="height: 30px; top: 840px; line-height: 30px;">13교시</div>
									<div class="hour"
										style="height: 30px; top: 870px; line-height: 30px;">14교시</div>
									<div class="hour"
										style="height: 30px; top: 900px; line-height: 30px;">15교시</div>
									<div class="hour"
										style="height: 30px; top: 930px; line-height: 30px;">16교시</div>
									<div class="hour"
										style="height: 30px; top: 960px; line-height: 30px;">17교시</div>
									<div class="hour"
										style="height: 30px; top: 990px; line-height: 30px;">18교시</div>
									<div class="hour"
										style="height: 30px; top: 1020px; line-height: 30px;">19교시</div>
									<div class="hour"
										style="height: 30px; top: 1050px; line-height: 30px;">20교시</div>
									<div class="hour"
										style="height: 30px; top: 1080px; line-height: 30px;">21교시</div>
									<div class="hour"
										style="height: 30px; top: 1110px; line-height: 30px;">22교시</div>
									<div class="hour"
										style="height: 30px; top: 1140px; line-height: 30px;">23교시</div>
									<div class="hour"
										style="height: 30px; top: 1170px; line-height: 30px;">24교시</div>
									<div class="hour"
										style="height: 30px; top: 1200px; line-height: 30px;">25교시</div>
									<div class="hour"
										style="height: 30px; top: 1230px; line-height: 30px;">26교시</div>
									<div class="hour"
										style="height: 30px; top: 1260px; line-height: 30px;">27교시</div>
									<div class="hour"
										style="height: 30px; top: 1290px; line-height: 30px;">28교시</div>
									<div class="hour"
										style="height: 30px; top: 1320px; line-height: 30px;">29교시</div>
									<div class="hour"
										style="height: 30px; top: 1350px; line-height: 30px;">30교시</div>
									<div class="hour"
										style="height: 30px; top: 1380px; line-height: 30px;">31교시</div>
									<div class="hour"
										style="height: 30px; top: 1410px; line-height: 30px;">32교시</div>
								</div>
							</th>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td>
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td style="display: none;">
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<td style="display: none;">
								<div class="cols" style="width: 7px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div>
							</td>
							<th>
								<div class="times">
									<div class="time">오전 0시</div>
									<div class="time">오전 1시</div>
									<div class="time">오전 2시</div>
									<div class="time">오전 3시</div>
									<div class="time">오전 4시</div>
									<div class="time">오전 5시</div>
									<div class="time">오전 6시</div>
									<div class="time">오전 7시</div>
									<div class="time">오전 8시</div>
									<div class="time">오전 9시</div>
									<div class="time">오전 10시</div>
									<div class="time">오전 11시</div>
									<div class="time">오후 12시</div>
									<div class="time">오후 1시</div>
									<div class="time">오후 2시</div>
									<div class="time">오후 3시</div>
									<div class="time">오후 4시</div>
									<div class="time">오후 5시</div>
									<div class="time">오후 6시</div>
									<div class="time">오후 7시</div>
									<div class="time">오후 8시</div>
									<div class="time">오후 9시</div>
									<div class="time">오후 10시</div>
									<div class="time">오후 11시</div>
								</div>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<ul class="floating" style="left: 1.5px;">
		<li class="button custom">새수업 추가</li>
	</ul>

	<form action="add" method="post" style="display: none; left: 292px;">
		<h2>새 수업 추가</h2>
		<dl>
			<dt>과목명 (필수)</dt>
			<dd>
				<input type="text" name="name" placeholder="예) 경제학 입문"
					maxlength="40" class="text">
			</dd>
			<dt>교수명</dt>
			<dd>
				<input type="text" name="professor" placeholder="예)홍길동"
					maxlength="40" class="text">
			</dd>
			<dt>시간/장소</dt>
			<dd class="timeplaces">
				<div class="timeplace">
					<select class=weeks>
						<option value="월">월</option>
						<option value="화">화</option>
						<option value="수">수</option>
						<option value="목">목</option>
						<option value="금">금</option>
						<option value="토">토</option>
						<option value="일">일</option>
					</select>
					<p>
						<select class=starthour>
							<option value="0">오전0시</option>
							<option value="1">오전 1시</option>
							<option value="2">오전 2시</option>
							<option value="3">오전 3시</option>
							<option value="4">오전 4시</option>
							<option value="5">오전 5시</option>
							<option value="6">오전 6시</option>
							<option value="7">오전 7시</option>
							<option value="8">오전 8시</option>
							<option value="9" selected="selected">오전 9시</option>
							<option value="10">오전 10시</option>
							<option value="11">오전 11시</option>
							<option value="12">오전 12시</option>
							<option value="13">오후 1시</option>
							<option value="14">오후 2시</option>
							<option value="15">오후 3시</option>
							<option value="16">오후 4시</option>
							<option value="17">오후 5시</option>
							<option value="18">오후 6시</option>
							<option value="19">오후 7시</option>
							<option value="20">오후 8시</option>
							<option value="21">오후 9시</option>
							<option value="22">오후 10시</option>
							<option value="23">오후 11시</option>
						</select> <select class="startminute">
							<option value="0">0분</option>
							<option value="5">5분</option>
							<option value="10">10분</option>
							<option value="15">15분</option>
							<option value="20">20분</option>
							<option value="25">25분</option>
							<option value="30">30분</option>
							<option value="35">35분</option>
							<option value="40">40분</option>
							<option value="45">45분</option>
							<option value="50">50분</option>
							<option value="55">55분</option>
						</select> <span>~</span> <select class="endhour">
							<option value="0">오전0시</option>
							<option value="1">오전 1시</option>
							<option value="2">오전 2시</option>
							<option value="3">오전 3시</option>
							<option value="4">오전 4시</option>
							<option value="5">오전 5시</option>
							<option value="6">오전 6시</option>
							<option value="7">오전 7시</option>
							<option value="8">오전 8시</option>
							<option value="9">오전 9시</option>
							<option value="10" selected="selected">오전 10시</option>
							<option value="11">오전 11시</option>
							<option value="12">오전 12시</option>
							<option value="13">오후 1시</option>
							<option value="14">오후 2시</option>
							<option value="15">오후 3시</option>
							<option value="16">오후 4시</option>
							<option value="17">오후 5시</option>
							<option value="18">오후 6시</option>
							<option value="19">오후 7시</option>
							<option value="20">오후 8시</option>
							<option value="21">오후 9시</option>
							<option value="22">오후 10시</option>
							<option value="23">오후 11시</option>
						</select> <select class="endminute">
							<option value="0">0분</option>
							<option value="5">5분</option>
							<option value="10">10분</option>
							<option value="15">15분</option>
							<option value="20">20분</option>
							<option value="25">25분</option>
							<option value="30">30분</option>
							<option value="35">35분</option>
							<option value="40">40분</option>
							<option value="45">45분</option>
							<option value="50">50분</option>
							<option value="55">55분</option>
						</select> <input type="text" placeholder="예) 종 303" class="text place">
					</p>
				</div>
			</dd>
		</dl>

		<div class="submit">
			<input type="submit" value="저장" class="button">
		</div>
	</form>

	<script type="text/javascript">
      $(document).ready(function(){
         getAllSchedule(); // 함수 호출
         
         // 시간표 등록 기능
         $('btnAdd').click(function(){
            let memberId = $('#memberId').val();
            let courseName = $('#courseName').val();
            let professor = $('#professor').val();
            let startHour = $('#startHour').val();
            let startMinute = $('#startMinute').val();
            let endHour = $('#endHour').val();
            let endMinute = $('#endMinute').val();
            let courseRoom = $('#courseRoom').val();
            
            // javascript 객체 생성
            let obj = {
                  'memberId' : memberId,
                  'courseName' : courseName,
                  'profesoor' : professor,
                  'startHour' : startHour,
                  'startMinute' : startMinute,
                  'endHour' : endHour,
                  'endMinute' : endMinute,
                  'courseRoom' : courseRoom
                     
            }
            console.log(obj);
            
            // $.ajax로 송수신
            $.ajax({
               type : 'POST', // 메서드 타입
               url : '??', 
               headers : {
                  'Content-Type' : 'application/json' // json content-type 설정
               },
               data : JSON.stringify(obj), // JSON으로 변환
               success : function(result) {
                  console.log(result);
                  if(result == 1){
                     alert('시간표 등록 성공');
                     getAllSchedule(); // 함수 호출
                  }
               }
               
               
            });
            
         }); // end btnAdd.click()
         
         // 사용자 시간표 전체 가져오기
         function getAllSchedule(){
            let memberId = $('#memberId').val();
            
            let url = '??' + memberId;
            $.getJSON(
               url,
               funcion(data){
                  // data : 서버에서 전송받은 list 데이터가 저장되어 있음.
                  // getJSON()에서 json 데이터는 
                  // javascript object로 자동 parsing됨.
                  console.log(data);
                  
                  var list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
                  
                  // $(컬렉션).each() : 컬렉션 데이터를 반복문으로 꺼내는 함수
                  $(data).each(function(){
                     // this : 컬렉션의 각 인덱스 데이터를 의미
                     console.log(this);
                    
                     // 전송된 replyDateCreated는 문자열 형태이므로 날짜 형태로 변환이 필요
                     var replyDateCreated = new Date(this.replyDateCreated);

                     list += '<div class="reply_item">'
                        + '<pre>'
                        + '<input type="hidden" id="replyId" value="'+ this.replyId +'">'
                        + this.memberId
                        + '&nbsp;&nbsp;' // 공백
                        + '<input type="text" id="replyContent" value="'+ this.replyContent +'">'
                        + '&nbsp;&nbsp;'
                        + replyDateCreated
                        + '&nbsp;&nbsp;'
                        + '<button class="btn_update" >수정</button>'
                        + '<button class="btn_delete" >삭제</button>'
                        + '</pre>'
                        + '</div>';
                  }); // end each()
               
                  $('#replies').html(list); // 저장된 데이터를 replies div 표현
               } // end function()
            
            ); // end getJSON()
            
            
         } // end getAllSchedule()
         
         
      }); // end document
      
   
   </script>

</body>
</html>