<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login/HEADER.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
    <div class="login-box register">
        <%@ include file="/WEB-INF/views/include/login/LOGO.jsp" %>
        <div class="back" onclick="location.href='${pageContext.request.contextPath}/SFA_login'">로그인으로</div>

        <form id="frm" name="" method="POST" action="${pageContext.request.contextPath}/SFA_register" onsubmit="linklogin()" autocomplete="off">

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>입사년도</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="far fa-user-circle"></i>
                </span>
                <input type="date" max="2020-12-31" min="1970-01-01" name=joindate id="joindate" class="input isp" tabindex="1" placeholder="입사년월일을 입력해주세요"
                    autofocus required/>
                <!-- <span class="right">
                    <i class="fas fa-check" id="idchk"></i>
                </span> -->
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>이름</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="far fa-id-badge"></i>
                </span>
                <input type="text" name="empnm" id="empnm" class="input isp" tabindex="2" placeholder="이름을 입력해주세요" required/>
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>부서</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="fas fa-user-tie"></i>
                </span>
                <select id="deptid" name="deptid" class="sel" tabindex="3" required>
					<option value="">부서를 선택하세요.</option> 
                </select>
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>직급</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="fas fa-user-tie"></i>
                </span>
                <select id="grade" name="grade" class="sel" tabindex="4" required>
					<option value="">직책을 선택하세요.</option>
                </select>
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>비밀번호</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="fas fa-key"></i>
                </span>
                <input type="password" name="emppwd" id="emppwd" class="input isp" tabindex="5"
                    placeholder="비밀번호를 입력해주세요" required/>
            </div>

            <div class="pos">

                <!-- <span class="form-title">
                    <h4>비밀번호 확인</h4>
                </span> -->

                <span class="form-icon fisp">
                    <i class="fas fa-key"></i>
                </span>

                <input type="password" name="" id="cfm-password" class="input isp" tabindex="6"
                    placeholder="비밀번호를 한번 더 입력해주세요" />
                <span class="right">
                    <i class="fas fa-check" id="pwdcheck"></i>
                </span>

            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>전화번호</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="fas fa-mobile-alt"></i>
                </span>
                <input type="text" name="emphp" id="emphp" class="input isp" tabindex="7"
                    placeholder="전화번호를 입력해주세요(하이폰 없이 입력)" />
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>이메일</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="far fa-envelope"></i>
                </span>
                <input type="text" name="email" id="email" class="input isp" tabindex="8" placeholder="이메일을 입력해주세요" required />
            </div>

            <div class="pos">
                <!-- <span class="form-title">
                    <h4>주소</h4>
                </span> -->
                <span class="form-icon fisp">
                    <i class="far fa-map"></i>
                </span>
                <input type="text" name="empaddr" id="empaddr" class="input isp" tabindex="9" placeholder="주소를 입력해주세요" />
            </div>

            <div class="">
               <button type="submit" class="reg_btn" id="reg_btn">회원가입</button>
            </div>
        </form>
    </div>
</body>

<script src="${pageContext.request.contextPath}/js/register.js"></script>
</html>