<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.emp-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.emp-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.modal-wrapper {
	background-color: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	visibility: hidden;
	opacity: 0;
}

.modal-wrapper.open {
	visibility: visible;
	opacity: 1;
	transition: 0.3s;
}

.modal-wrapper.open .modal {
	opacity: 1;
}

.modal {
	width: 1500px;
	height: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	opacity: 0;
	border-radius: 5px;
	padding: 20px;
	box-shadow: -60px 0 100px -90px #000, 60px 0px 100px -90px #000;
}
.photo-area {
	width: 120px;
	height: 160px;
}

.photo-area img {
	width: 100%;
	height: 100%;
	display: inline-block;
}
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb10">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">시스템 > 내정보
						</p>
				</div>
				<div class="emp-insert m-b15 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setRegAll"
						autocomplete="off">
						<div class="emp-info flex flex-justify">
							<div class="emp-left">
								<div class="photo-area" style="margin-right:5px;">
									<img id="img" name="img" src="${pageContext.request.contextPath}/images/noImage2.jpg" alt="" />
								</div>

							</div>
							<div class="emp-right" style="width: 94%;">
								<table class="empList" id="empList">
									<tr>
										<td class="td-7 under center bg-green weight700">사원번호/비밀번호</td>
										<td class="td-13 p-lr3"><input type="text" value="${sessionScope.empid}" name="empid" class="input-49 inputbg" readonly >
										<input type="text" class="input-49 emppwd" id="emppwd" name="emppwd"></td>
										<td class="td-7 under center bg-green weight700">사원명/성별</td>
										<td class="td-13 p-lr3"><input type="text" name="empnm" id="empnm" class="input-73 empnm" tabindex="1" maxlength="14" autofocus required> 
											<select name="gendernm" id="gendernm" class="sel-25 gendernm" tabindex="2">
										</select></td>
										<td class="td-7 under center bg-green weight700">생년월일</td>
										<td class="td-13 p-lr3"><input type="text" class="input-73 birth" name="birth" id="birth" tabindex="3"  maxlength="10" required>
											<select	name="birttypenm" class="sel-25 birttypenm" id="birttypenm" tabindex="2">
											</select>
										</td>
										<td class="td-7 under center bg-green weight700">주민등록번호</td>
										<td class="td-7 p-lr3"><input type="text" class="input-100 regnum" id="regnum" name="regnum" tabindex="5"  maxlength="14" required></td>
										<td class="td-7 under center bg-green weight700">채용형태</td>
										<td class="p-lr3"><select name="chanm" class="sel-100 chanm" id="chanm">
										</select></td>

										<td class="td-7 under center bg-green weight700">병역구분</td>
										<td class="p-lr3"><select name="milinm" class="sel-100 milinm" id="milinm">
										</select></td>
									</tr>

									<tr>
										<td class="td-7 under center bg-green weight700">부서명/직급</td>
										<td class="p-lr3">
										<select name="deptid" class="sel-50 deptid" id="deptid" tabindex="7"></select>
										<select name="grade" class="sel-50 grade" id="grade" tabindex="8"></select>
										</td>

										<td class="td-7 under center bg-green weight700">주소</td>
										<td class="p-lr3" colspan="3"><input type="text" tabindex="9" class="input-100 empaddr" id="empaddr" name="empaddr" maxlength="50" required></td>
											
										<td class="td-7 under center bg-green weight700">입사일자</td>
										<td class="p-lr3"><input type="date" id="joindate" name="joindate" tabindex="9" class="input-100 joindate" required></td>

										<td class="td-7 under center bg-green weight700">장애여부</td>
										<td class="p-lr3"><select name="impnm" class="sel-100 impnm" id="impnm">
										</select></td>
										<td class="td-7 under center bg-green weight700">보훈대상</td>
										<td class="p-lr3"><select name="patrnm" class="sel-100 patrnm" id="patrnm">
										</select></td>

									</tr>
									<tr>
										<td class="td-7 under center bg-green weight700">H.P</td>
										<td class="td-7 p-lr3"><input type="tel" id="emphp" name="emphp" class="input-100 emphp" tabindex="9"
											pattern="[0-1]{3}-[0-9]{3,4}-[0-9]{4}"
											placeholder="000-000(0)-0000" required></td>
										<td class="td-7 under center bg-green weight700">내선번호</td>
										<td class="td-7 p-lr3"><input type="tel" id="empcp" name="empcp" tabindex="10" class="input-100 empcp"
											pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
											placeholder="000-000(0)-0000" required></td>
										<td class="td-7 under center bg-green weight700">이메일</td>
										<td class="p-lr3"><input type="email" id="email" name="email" tabindex="11" class="input-100 email" placeholder="abc@sfa.com"  maxlength="25" 
											required></td>
										<td class="td-7 under center bg-green weight700">계좌번호</td>
										<td class="p-lr3"><input type="text" id="accountnum" name="accountnum" tabindex="12" class="input-100 accountnum" maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">종교</td>
										<td class="p-lr3"><select name="relinm" class="sel-100 relinm" id="relinm">
										</select></td>

										<td class="td-7 under center bg-green weight700">결혼여부</td>
										<td class="p-lr3"><select name="marnm" class="sel-100 marnm" id="marnm">
										</select></td>
									</tr>

									<tr>
										<td class="td-7 under center bg-green weight700">희망직무</td>
										<td class="p-lr3"><input type="text" name="hope" id="hope"
											class="input-100 hope"  maxlength="10" required></td>
										<td class="td-7 under center bg-green weight700">보유자격</td>
										<td class="p-lr3"><input type="text" name="licence" id="licence"
											class="input-100 licence"  maxlength="20" required></td>
										<td class="td-7 under center bg-green weight700">취미</td>
										<td class="p-lr3"><input type="text"  name="hobby" id="hobby"
											class="input-100 hobby" maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">특기</td>
										<td class="p-lr3"><input type="text" name="forte" id="forte"
											class="input-100 forte" maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">어학/상벌사항</td>
										<td class="p-lr3" colspan="3"><input type="text" name="linguistic"
											id="linguistic" class="input-49 linguistic" required> <input type="text"
											name="reward" id="reward" class="input-49 reward" maxlength="20" required></td>

									</tr>
									
									
								</table>
							</div>
						</div>
						<div class="flex flex-justify">
							<div class="photo-btn center m-t15">
                                <input type="file" style="width: 120px;" class="file" id="file" />
                            	<button type="button" class="btn-on picsave" id="picsave">저장</button>
                            </div>
							<div>
								<button type="button" title="UPDATE" class="btn-on center m-t15 m-l5 up" id="up">수정</button>
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 15px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">시스템 > 사내연락망
						목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<span class="btn-normal m-lr15 m-b15 ">검색 된 연락처 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>					
					</div>
					<div class="form-wrap">
						<form method="post"
							action="${pageContext.request.contextPath}/SFA_empContactList"
							style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option value="all"
									<c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
								<option value="empnm"
									<c:if test="${searchOpt eq 'empnm'}">selected</c:if>>사원명</option>
								<option value="buseo_name"
									<c:if test="${searchOpt eq 'buseo_name'}">selected</c:if>>부서명</option>
								<option value="grade_name"
									<c:if test="${searchOpt eq 'grade_name'}">selected</c:if>>직급</option>
							</select> <input type="text" name="words" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="emp-list m-b15 m-lr15">
					<table class="list center empList" id="empList" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">
								<input type="checkbox" style="width: 20px; height: 20px;" class="chk" onClick="chkAll();" id="chkAll"/>
							</td>

							<td class="td-3">순번</td>
							<td class="td-7" style="display: none;">부서코드</td>
							<td class="td-7">부서명</td>
							<td class="td-7" style="display: none;">직급코드</td>
							<td class="td-7">직급</td>
							<td class="td-5">사번</td>
							<td class="td-5">사원명</td>
							<td class="td-7">H.P</td>
							<td class="td-7">C.P</td>
							<td class="td-7">E-mail</td>
						</tr>

						<c:if test="${count == 0}">
							<tr>
								<td colspan="11" class="center font14">등록된 사원이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${contactList}" var="emp" varStatus="status">
							<tr>
								<td class="td-3">
								<input type="checkbox" id="chk2" name="chk" class="chk" data-uid="${emp.empid}" style="width: 20px; height: 20px;" />
								</td>
								<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td style="display: none;">${emp.deptid}</td>
								<td>${emp.buseoname}</td>
								<td style="display: none;">${emp.grade}</td>
								<td>${emp.gradename}</td>
								<td>${emp.empid}</td>
								<td>${emp.empnm}</td>
								<td>${emp.emphp}</td>
								<td>${emp.empcp}</td>
								<td>${emp.email}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이징 ui 시작 -->
				<c:if test="${count > 0}">
					<div class="page-grp center m-t15">

						<!-- 맨 앞으로 --->
						<c:choose>
							<c:when test="${curPage > 1}">
								<a
									href="${pageContext.request.contextPath}/SFA_empContactList?curPage=1&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-double-left"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-double-left"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 맨 앞으로 -->

						<!-- 한 칸 앞으로 -->
						<c:choose>
							<c:when test="${curPage > 1}">
								<a
									href="${pageContext.request.contextPath}/SFA_empContactList?curPage=${curPage-1}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-left"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-left"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 앞으로 -->

						<!-- 페이지 번호 출력 -->
						<c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">

							<c:if test="${selected == num}">
								<span class="page page-active"> <a href="#" class="f6">${num}</a>
								</span>
							</c:if>

							<c:if test="${selected != num}">
								<a
									href="${pageContext.request.contextPath}/SFA_empContactList?curPage=${num}&searchOpt=${searchOpt}&words${words}">
									<span class="page">${num}</span>
								</a>
							</c:if>

						</c:forEach>
						<!-- 페이지 번호 출력 끝 -->

						<!-- 한 칸 뒤로 -->
						<c:choose>
							<c:when test="${curPage != totalPage}">
								<a
									href="${pageContext.request.contextPath}/SFA_empContactList?curPage=${curPage+1}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-right"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-right"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 뒤로 -->

						<!-- 한 칸 뒤로 -->
						<c:choose>
							<c:when test="${curPage != totalPage}">
								<a
									href="${pageContext.request.contextPath}/SFA_empContactList?curPage=${totalPage}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-double-right"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-double-right"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 뒤로 -->
					</div>
				</c:if>
				<!-- 페이징 ui 끝 -->
			</div>
		</div>
	</main>

</body>
<script>
	$(function(){
		//alert("성공");
		load();
		empList();
		var empID = ${sessionScope.empid};
		empload(empID);
		
		/* var tr = $("#empList tr:nth-child(1)");
		var td = tr.children();        
		var empID = td.eq(1).text(); */
		//alert(empID);

		 $('#up').click(function() {		
			//alert("성공");
			var empid = ${sessionScope.empid};
			
			var msg = $("#empnm").val() + "의 정보를 수정하시겠습니까?";
			
			if(confirm(msg)) {
				
				$.ajax({
					url: "${pageContext.request.contextPath}/SFA_setEmpOthers",
			        type: "post",
			        data: $('#frm').serialize(),
			        success : function(data) {
				        window.location.reload();
			        },
			        error: function(request) {
			            alert("message:"+request.responseText);
			        },
				});
			}
		});
	});
	
</script>

<script>
function empload(empID){
	//alert("성공");
	
	var formData = {
			empID : empID
		};
					
	$.ajax({
		url : "${pageContext.request.contextPath}/SFA_empOne",
		type : "POST",
		data : formData,
		success : function(emp) {
		 	$('.empid').val(emp.empid);
			$('.empnm').val(emp.empnm);
			$('.emppwd').val(emp.emppwd);
			$('.deptid').val(emp.deptid);
			$('.grade').val(emp.grade);
			$('.birth').val(emp.birth);
			$('.regnum').val(emp.regnum);
			$('.gendernm').val(emp.gender);
			$('.empaddr').val(emp.empaddr);
			$('.emphp').val(emp.emphp);
			$('.email').val(emp.email);
			$('.accountnum').val(emp.accountnum);
			$('.joindate').val(emp.joindate);
			$('.empcp').val(emp.empcp);
			$('.hope').val(emp.hope);
			$('.licence').val(emp.licence);
			$('.hobby').val(emp.hobby);
			$('.forte').val(emp.forte);
			$('.birttypenm').val(emp.birthtype);
			$('.chanm').val(emp.chagubun);
			$('.milinm').val(emp.miligubun);
			$('.impnm').val(emp.impediment);
			$('.patrnm').val(emp.patriotism);
			$('.relinm').val(emp.religion);
			$('.linguistic').val(emp.linguistic);
			$('.marnm').val(emp.marrygubun);
			$('.reward').val(emp.reward);
		},
		error : function(request) {
			alert("message:" + request.responseText + "\n");
		}
	});	

	
}

var flag = false;
function chkAll() {
	
    var chk = document.getElementsByName("chk");
    if (flag == false) { //선택 x
        flag = true;

        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = true;
        }

    } else {
        flag = false;
        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = false;
        }
    }

}
</script>

</html>