<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/login_header.jsp"%>
<body>
	<div class="login-box register">
		<h2>
			<span class="logo-text" style="cursor: pointer;"
				onClick="location.href='${pageContext.request.contextPath}'">
				${com.comname} ${com.comsubname} </span>
		</h2>
		<div class="back"
			onclick="location.href='${pageContext.request.contextPath}/loginpage'">로그인으로</div>

		<form name="frm" id="frm" method="post"
			action="${pageContext.request.contextPath}/register"
			autocomplete="off">

			<div class="pos">
				<span class="form-icon fisp"> <i class="far fa-user-circle"></i>
				</span> <input type="date" name="joindate" id="joindate" class="input isp"
					autofocus tabindex="1" required max="2025-12-31" min="1965-01-01" /> 
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="far fa-id-badge"></i>
				</span> <input type="text" name="empnm" id="empnm" class="input isp"
					tabindex="2" placeholder="이름을 입력해주세요" required />
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="fas fa-user-tie"></i>
				</span> <select id="deptid" name="deptid" class="sel" tabindex="3" required>			
				<option value="" > 부서를 입력해주세요</option>
				</select>
			</div>

			<div class="pos">
			
				<span class="form-icon fisp"> <i class="fas fa-user-tie"></i>
				</span> <select id="grade" name="grade" class="sel" tabindex="4" required >
				<option value=""> 직급을 입력해주세요</option>
				</select>
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="fas fa-key"></i>
				</span> <input type="password" name="emppwd" id="emppwd" class="input isp"
					tabindex="5" placeholder="비밀번호를 입력해주세요" required />
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="fas fa-key"></i>
				</span> <input type="password" name="" id="cfm-password" class="input isp"
					tabindex="6" placeholder="비밀번호를 한번 더 입력해주세요" required /> <span
					class="right"> <i class="fas fa-check" id="pwdcheck"></i>
				</span>
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="fas fa-mobile-alt"></i>
				</span> <input type="text" name="emphp" id="emphp" class="input isp"
					tabindex="7" placeholder="전화번호를 입력해주세요(하이폰 없이 입력)" />
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="far fa-envelope"></i>
				</span> <input type="email" name="email" id="email" class="input isp"
					tabindex="8" placeholder="이메일을 입력해주세요" required pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" />
			</div>

			<div class="pos">
				<span class="form-icon fisp"> <i class="far fa-map"></i>
				</span> <input type="text" name="empaddr" id="empaddr" class="input isp"
					tabindex="9" placeholder="주소를 입력해주세요" />
			</div>

			<button type="submit" class="btn" id="btn">회원가입</button>


		</form>


	</div>

</body>
<script src="${pageContext.request.contextPath}/js/register.js"></script>
<script>
	$(function() {
		load();
		var date = new Date();
		var yyyy = date.getFullYear();
		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
		 
		$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);			
	});
</script>
</html>