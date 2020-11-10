<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login/HEADER.jsp" %>

<body>
    <div class="login-box">
      <%@ include file="/WEB-INF/views/include/login/LOGO.jsp" %>
        
        <form id="frm" name="frm" method="POST" autocomplete="off">

            <div class="pos">
                <span class="form-icon">
                    <i class="far fa-user-circle"></i>
                </span>
                <input type="text" name="empid" id="empid" class="input" tabindex="1" placeholder="등록한 사번을 입력해주세요"
                    autofocus>
            </div>

            <div class="pos">
                <span class="form-icon">
                    <i class="far fa-envelope"></i>
                </span>
                <input type="text" name="email" id="email" class="input" tabindex="2" placeholder="등록한 이메일 입력해주세요">
            </div>

            <div class="">
                <input type="button" class="btn2" id="btn2" value="비밀번호 찾기">
            </div>
            <div class="register-line2">
                    <span class="account">사원가입 정보가 없습니까? </span>
                    <span class="signup"><a href="${pageContext.request.contextPath}/SFA_register">사원가입</a></span>
            </div>
        </form>
    </div>
</body>
</html>