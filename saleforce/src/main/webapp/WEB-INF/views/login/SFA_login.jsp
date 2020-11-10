<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>
<body>
	<div class="login-box">

	
			<span class="logo-text" style="cursor: pointer;"
				onClick="location.href='${pageContext.request.contextPath}'">
					<h2>Sale Force Automation</h2> </span>
		

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
					<a href="${pageContext.request.contextPath}/pwdFind">비밀번호 찾기</a>
				</div>
				<div class="account-top">
					<span class="signup"> <a
						href="${pageContext.request.contextPath}/register">회원가입</a>
					</span>
				</div>
			</div>
		</form>


	</div>

</body>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</html>