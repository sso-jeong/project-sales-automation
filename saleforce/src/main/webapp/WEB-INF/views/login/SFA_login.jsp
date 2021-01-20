<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>
<body>
	<div class="login-box" style="height: 380px">

			<div>
			<span class="logo-text" style="cursor: pointer; color: #0C4A60; font-size: 1.5em; font-weight: bold;"
				onClick="location.href='${pageContext.request.contextPath}'">
					<h2>${com.comname} ${com.comsubname}</h2> </span>
			</div>
		

		<form name="frm" id="frm" method="post" autocomplete="off">
			<div class="pos">
				<span class="form-icon"> <i class="far fa-user-circle"></i>
				</span> <input type="text" name="empid" id="empid" class="input"
					tabindex="1" placeholder="사번을 입력해주세요" autofocus tabindex="1"
					required>
			</div>

			<div class="pos">
				<span class="form-icon"> <i class="fas fa-key"></i>
				</span> <input type="password" name="emppwd" id="emppwd" class="input"
					tabindex="2" placeholder="비밀번호를 입력해주세요" required>
					<input type="date" id="now" style="display: none;"/>
					
			</div>

			<button id="loginbtn" class="btn" type="button">로그인</button>

			<div class="register-line">
				<div class="forgot">
					<a href="${pageContext.request.contextPath}/pwdpage">비밀번호 찾기</a>
				</div>
				<div class="account-top">
					<span class="signup"> <a
						href="${pageContext.request.contextPath}/registerpage">회원가입</a>
					</span>
				</div>
			</div>
		</form>


	</div>
	
	<div style="position: absolute; top: 45%; left: 70%">
			<p>관리자 : admin / admin</p>
			<p>영업 : sale / 200 , 2020200001 / 1</p>
			<p>인사 : human / 100 , 2020100001 / 1</p>
	</div>

</body>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</html>