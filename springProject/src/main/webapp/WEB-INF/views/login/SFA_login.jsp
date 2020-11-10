<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login/HEADER.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<body>
	<div class="login-box">
		<%@ include file="/WEB-INF/views/include/login/LOGO.jsp"%>
		<span id="chkLogin"></span>
		<form id="frm" name="" method="POST" autocomplete="off">
			<div class="pos">
				<span class="form-icon"> <i class="far fa-user-circle"></i>
				</span> <input type="text" name="empid" id="empid" class="input"
					tabindex="1" placeholder="사번을 입력해주세요" autofocus>
			</div>

			<div class="pos">
				<span class="form-icon"> <i class="fas fa-key"></i>
				</span> <input type="password" name="emppwd" id="emppwd" class="input"
					tabindex="2" placeholder="비밀번호를 입력해주세요">
			</div>

			<div class="">
				<button type="button" class="btn" id="btn">로그인</button>
			</div>

			<div class="register-line">
				<div class="forgot">
					<a href="${pageContext.request.contextPath}/SFA_Pwd">비밀번호 찾기</a>
				</div>
				<div class="account-top">
					<span class="signup"> <a
						href="${pageContext.request.contextPath}/SFA_register">사원가입</a>
					</span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>