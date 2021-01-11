<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>
<body>
	<div class="login-box">

		<span class="logo-text" style="cursor: pointer;"
			onClick="location.href='${pageContext.request.contextPath}'">
			<h2>${com.comname} ${com.comsubname}</h2>
		</span>
		<form name="" method="POST" autocomplete="off">
			<div class="pos">
				<span class="form-icon"> <i class="far fa-user-circle"></i>
				</span> <input type="text" name="empid" id="empid" class="input"
					tabindex="1" placeholder="등록한 사번을 입력해주세요" autofocus>
			</div>

			<div class="pos">
				<span class="form-icon"> <i class="far fa-envelope"></i>
				</span> <input type="email" name="email" id="email" class="input"
					tabindex="2" placeholder="등록한 이메일 입력해주세요"
					pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">
			</div>

			<button id="pwdbtn" class="btn" type="button">비밀번호찾기</button>
			<div class="register-line2">

				<span class="account">회원가입 정보가 없습니까? </span> <span class="signup"><a
					href="${pageContext.request.contextPath}/registerpage">회원가입</a></span>

			</div>
		</form>


	</div>

</body>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</html>