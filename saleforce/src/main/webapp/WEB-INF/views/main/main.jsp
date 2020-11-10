<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/fullpage.css">
<script src="https://kit.fontawesome.com/b1cadc3305.js"
	crossorigin="anonymous"></script>
<style>
.bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	width: 100%;
	height: 100vh;
}

.nav {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 9999;
	width: 100%;
	height: 110px;
	color: #000;
	line-height: 20px;
	margin: 30px 30px;
}

.nav a {
	color: #000;
	line-height: 2px;
}

.firstPage-contant {
	text-align: center;
	opacity: 0;
	animation: run .8s .3s forwards;
	margin-top: 300px;
}

@
keyframes run { 100% {
	opacity: 1;
	margin: 0;
}

}
.firstPage-contant h3 {
	font-size: 25px;
	margin-bottom: 20px;
}

.firstPage-contant h2 {
	font-size: 60px;
	text-shadow: 2px 2px 1px #000;
}

.firstPage-wrap {
	margin: 0 auto;
	width: 800px;
}

.logo, .login {
	width: 8%;
	vertical-align: middle;
	text-align: center;
}

.navbar {
	width: 65%;
	padding-top: 8px;
	padding-left: 29%;
}

.login {
	padding-top: 8px;
	margin-right: 50px;
}

.main-wrap {
	background-color: #f5f6f7;
	text-align: center;
	vertical-align: middle;
	width: 800px;
}

.main-box {
	width: 100%;
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -45%);
	padding: 35px 40px;
	text-align: center;
}

.main-left, .main-right {
	width: 49.5%;
}

.main-left, .main-right, .main {
	height: auto;
	padding: 30px;
	background-color: #F5F6F7;
	border: 2px solid #0C4A60;
}

.img-area {
	width: 100px;
	text-align: center;
}

.main-left {
	position: relative;
}

.img {
	padding-left: 15%;
}

.btn-wrap {
	margin-top: 15px;
	height: 45px;
}

.btn {
	width: 100%;
	height: 150px;
	padding: 0 5px;
	background-color: #0C4A60;
	color: #fff;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	letter-spacing: 1.3px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullpage.js"></script>
<!-- <script type="text/javascript">
	function doSomething() {
		alert(window.location.href.split('#')[0]);
	}
	window.onhashchange = doSomething;
</script> -->
</head>

<body>

	<div class="nav">
		<div class="flex flex-justify">
			<div class="logo">
				<h2>
					<a class="roboto font22" href="${pageContext.request.contextPath}/"
						title="HOME">SALE FORCE </a>
				</h2>
				<a class="roboto font20" href="${pageContext.request.contextPath}/"
					title="HOME">AUTOMATION</a>
			</div>
			<div class="navbar">
				<ul id="menu" class="flex flex-justify">
					<li class="noto weight700 font20" style="margin: 0 30px;"
						data-menuanchor="2ndPage"><a
						href="${pageContext.request.contextPath}/#2ndPage">회사소개</a></li>
				</ul>
			</div>
			<div class="login">
				<h2>
					<a class="noto weight700 font18 f6"
						href="${pageContext.request.contextPath}/login" title="HOME">그룹웨어
						로그인</a>
				</h2>
			</div>
		</div>
	</div>
	<div id="fullpage">
		<!-- section1 -->
		<div class="section bg"
			style="background-image: url(${pageContext.request.contextPath}/images/main/main.jpg);">
			<div class="firstPage-wrap">
				<div class="firstPage-contant">
					<h3 class="noto f6">영업 시스템의 혁신적인 플랫폼</h3>
					<h2 class="roboto f6">SALE FORCE AUTOMATION</h2>
				</div>
			</div>
		</div>
		<!-- section2 -->
		<div class="section bg">
			<div class="main-box flex flex-justify">
				<div class="main-left">
					<div class="">
						<span class="main-title noto weight300">
							<h2 style="font-size: 30px; margin-bottom: 15px;">1. 당신의 고객은
								몇 명인가요?</h2>
						</span> <span class="main-body noto">
							<h3 style="font-size: 18px;">고객의 수를 정확히 알고 계시나요?</h3>
							<h3 style="font-size: 18px;">당신의 매출이 새지 않도록 고객을 철저히 관리하세요.</h3>
							<h3 style="font-size: 18px; margin-bottom: 15px;">SFA가 한눈에
								보이는 고객관리로 매출향상을 돕겠습니다.</h3>
						</span>
						<div class="main-bottom">
							<img class="img"
								src="${pageContext.request.contextPath}/images/main/main_customer.png"
								style="padding-top: 20px;" />
						</div>
					</div>
				</div>
				<div class="main-right">
					<div class="">
						<span class="main-title noto weight300">
							<h2 style="font-size: 30px; margin-bottom: 15px;">2. 스토리가 있는
								영업을 해보세요.</h2>
						</span> <span class="main-body noto">
							<h3 style="font-size: 18px;">목적만을 위한 영업활동은 고객이 먼저 느낍니다.</h3>
							<h3 style="font-size: 18px;">고객과의 스토리를 위해서는 만날 때마다의 일들을 기록하고
								인지해야 합니다.</h3>
							<h3 style="font-size: 18px; margin-bottom: 15px;">스토리가 있는
								고객이 진정한 당신의 고객입니다.</h3>
						</span> <span class="main-bottom"> <img class="img"
							src="${pageContext.request.contextPath}/images/main/main_sales.png" />
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- section3 -->
		<div class="section bg" style="background-color: #f5f6f7;">
			<div class="main-box">
				<div class="main">
					<span class="main-title noto weight300">
						<h2 style="font-size: 30px; margin-bottom: 15px;">제품소개</h2>
					</span> <span class="main-body noto">
						<h3 style="font-size: 18px; margin-bottom: 30px;">영업 요소가 철저히
							관리됩니다.</h3>
					</span>
					<div class="flex" style="justify-content: space-around;">
						<div class="list noto" style="font-size: 18px;">
							<div class="noto left p-lr5">
								<p class="weight500 font18">
									<i class="fas fa-box p-lr5"></i>품목/재고관리
								</p>
								<p>그룹 별 품목 관리</p>
								<p>품목 출고 단가 관리</p>
								<p>품목/재고 규격 관리</p>
								<p>입고/출고별 재고 수량 관리</p>
							</div>
						</div>
						<div class="list noto" style="font-size: 18px;">
							<div class="noto left p-lr5">
								<p class="weight500">
									<i class="fas fa-gifts p-lr5"></i>수주/판매관리
								</p>
								<p>거래처별 품목관리</p>
								<p>수주/판매별 단가/공급가액/부가세 관리</p>
								<p>수주/판매별 해당 프로젝트 목록 관리</p>
							</div>
						</div>
						<div class="list noto" style="font-size: 18px;">
							<div class="noto left p-lr5">
								<p class="weight500 font18">
									<i class="fas fa-user-tie p-lr5"></i>고객관리
								</p>
								<p>거래처 등급별 관리(S급, A급, B급, C급)</p>
								<p>거래처 종목별 관리</p>
								<p>고객별 매출 수</p>
								<p>입고/출고별 재고 수량 관리</p>
							</div>
						</div>
						<div class="list noto" style="font-size: 18px;">
							<div class="noto left p-lr5" style="margin-bottom: 15px;">
								<p class="weight500">
									<i class="fas fa-address-book p-lr5"></i>직원관리
								</p>
								<p>주간보고, 회의록 확인</p>
								<p>직원별 일일스케줄 확인</p>
							</div>
						</div>
					</div>
					<div class="btn-wrap noto">

						<a class="btn" href="${pageContext.request.contextPath}/register"
							target="_blank">체험하기</a>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>

<script>
	$('#fullpage').fullpage({
		navigation : true,
		easingcss3 : 'cubic-bezier(0.175, 0.585, 0.820, 1.275)',
		menu : '#menu',
		anchors : [ '1stPage', '2ndPage', '3rdPage' ],
		scrollingSpeed : 600,
		
		afterLoad : function(origin, destination) {
			if (destination.anchor != '1stPage') {
				$(".nav a").css('color', '#000');
			} else {
				$(".nav a").css('color', '#fff');

			}
		}
	});
</script>


</html>