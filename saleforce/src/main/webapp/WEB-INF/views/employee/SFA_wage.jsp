<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.wage-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}
.wage-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb10">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">인사급여 > 급여계산/대장</p>
				</div>
				<div class="wage-insert m-b5 m-lr15">
					<form name="frm" id="frm" action="${pageContext.request.contextPath}/setWage" method="post" autocomplete="off">
						<div class="wage">
							<table>
								<tr>
									<td class="td-7 under center bg-green weight700">급여코드</td>
									<td class="td-10 p-lr3">
										<input type="text" name="hunum" id="hunum" class="input-100" readonly style="background-color: #f3f4f4">
									</td>

									<td class="td-7 under center bg-green weight700">급여구분</td>
									<td class="td-13 p-lr3">
										<select name="hugubun" class="sel-100" id="hunm" tabindex="3"></select>
									</td>

									<td class="td-7 under center bg-green weight700">급여형태/지급명</td>
									<td class="td-15 p-lr3">
										<select name="paygubun" class="sel-50" id="paynm" tabindex="4"></select> 
										<input type="text" name="paynm" id="pay" class="input-49" tabindex="5" required>
									</td>

									<td class="td-7 under center bg-green weight700">적용기간</td>
									<td class="td-15 p-lr3">
										<input type="date" name="hustdate" id="hustdate" class="input-49" tabindex="6" required> 
										<input type="date" name="huenddate" id="huenddate" class="input-49" tabindex="7" required>
									</td>

									<td class="td-7 under center bg-green weight700">지급일</td>
									<td class="td-7 p-lr3">
										<input type="date" name="payday" id="payday" class="input-100" value="${sessionScope.nowdate}" tabindex="10">
									</td>
								</tr>

								<tr>
									<td class="td-7 under center bg-green weight700">부서코드</td>
									<td class="p-lr3">
										<input type="text" name="" id="dept" class="input-100">
									</td>

									<td class="td-7 under center bg-green weight700">부서명/직급</td>
									<td class="p-lr3">
										<select name="" class="sel-50" id="deptid" tabindex="">									
										</select> 
										<select name="" class="sel-50" id="grade" tabindex="">
										</select>
									</td>

									<td class="td-7 under center bg-green weight700">사원코드/사원명</td>
									<td class="p-lr3" style="position: relative;">
										<input type="text" name="empid" id="empid" tabindex="2" class="input-49" required>									
										<input type="text" name="" id="empnm" class="input-49" tabindex="1" autofocus required>
										<span id="empnmp" onclick="popup(this)" style="position: absolute; top: 50%; transform: translateY(-50%); right: 15px; color: #000000;"> <i class="fas fa-search"></i>								
										</span> 
									</td>

									<td class="td-7 under center bg-green weight700">근태기간</td>
									<td class="p-lr3">
										<input type="date" name="paystdate" id="paystdate" class="input-49" tabindex="8"> 
										<input type="date" name="payenddate" id="payenddate" class="input-49" tabindex="9">
									</td>

									<td class="td-7 under center bg-green weight700">기본금</td>
									<td class="p-lr3">
										<input type="number" name="fund" id="fund" class="input-100" tabindex="11" value=0 required>
										<input type="hidden" name="regdate" value="${sessionScope.nowdate}">
										<input type="hidden" name="insert_person" value="${sessionScope.empname}">
									</td>

								</tr>
							</table>
						</div>
						<div class="flex flex-justify">
							<div></div>
							<div>
								<c:if test="${count eq 0}">
									<button type="reset" class="btn-on center m-t5 new" id="new1">초기화</button>
									<button type="submit" class="btn-on center m-t5 insert">신규등록</button>
								</c:if>
								<c:if test="${count ne 0}">
									<button type="reset" class="btn-on center m-t5 new" id="new2" >초기화</button>
									<button type="button" class="btn-on center m-t5 up" id="up">수정</button>
									<button type="submit" class="btn-on center m-t5 insert" id="insert" style="display:none;">신규등록</button>					
									<button type="button" class="btn-off center m-t5 del" id="del">삭제</button>
								</c:if>
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">인사급여 > 사원별급여조회</p>
				</div>

				<div class="search-wrap flex flex-justify m-lr15">
					<div class="">
						<button type="button" class="btn-on m-b5" id="deleteAll">선택삭제</button>
						<span class="btn-normal m-b5">검색 된 급여목록 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_wage" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'h.empid'}">selected</c:if> value="h.empid">사번</option>
								<option <c:if test="${searchOpt eq 'paystdate'}">selected</c:if> value="paystdate">근속월</option>
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="wage-list m-b5 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>
							<td class="td-3">순번</td>
							<td class="td-7">귀속연월</td>
							<td class="td-7">급여구분</td>
							<td class="td-7">급여형태</td>
							<td>급여지급명</td>
							<td class="td-7">사원명</td>
							<td class="td-10">지급일자</td>
							<td class="td-5">추가작업</td>
							<td class="td-5">명세서</td>
							<td class="td-10">지급총액(원)</td>
						</tr>
						<c:if test="${count == 0}">
						<tr>
							<td class="weight700 center font14 " colspan="11">등록된 급여 건이 없습니다.</td>
						</tr>
						</c:if>
					<c:forEach items="${wagelist}" var="wage" varStatus="status">
						<tr class="center font14" style="cursor: pointer;">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${wage.hunum}" style="width: 20px; height: 20px;" /></td>
							<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td class="td-7">${wage.attrmh}</td>
							<td class="left p-lr5">${wage.hugbname}</td>
							<td class="td-7">${wage.paygbname}</td>
							<td class="left p-lr5">${wage.paynm}</td>
							<td class="td-5 p-lr5">${wage.empnm}</td>
							<td class="td-7 p-lr5">${wage.payday}</td>
							<td class="td-7 p-lr5"><button class="after" style="background-color: #d6dce7; padding:5px 5px;" onclick="wagepop('${wage.hunum}')">추가작업</button></td>
							<td class="td-7 p-lr5"><button id="wage" style="background-color: #d6dce7; padding:5px 5px;" onclick="payslip('${wage.hunum}')">명세서</button></td>
							<td class="td-13 right p-lr5"> <fmt:formatNumber value="${wage.totpay}" pattern="#,###"/> </td>
							<td style="display: none;">${wage.hunum}</td>
						</tr>
					</c:forEach>
					</table>
				</div>
				<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<!-- 맨 앞으로 -->
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/SFA_wage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/SFA_wage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
						</c:when>
						<c:otherwise>
							<span class="page" style="cursor: default"> <i class="fas fa-angle-double-left"></i>
							</span>
							<!-- 한칸 앞으로 -->
							<span class="page" style="cursor: default"> <i class="fas fa-angle-left"></i>
							</span>
							<!-- 한칸 앞으로 -->
						</c:otherwise>
					</c:choose>
					<!-- 맨 앞으로 -->



					<!-- 페이지 번호 출력 -->
					<c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">
						<c:if test="${selected == num}">
							<span class="page page-active"> <a href="" class="f6">${num}</a>
							</span>
						</c:if>
						<c:if test="${selected != num}">
							<a href="${pageContext.request.contextPath}/SFA_wage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/SFA_wage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/SFA_wage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-double-right"></i>
							</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page" style="cursor: default"> <i class="fas fa-angle-right"></i>
							</span>
							<span class="page" style="cursor: default"> <i class="fas fa-angle-double-right"></i>
							</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
			</div>
		</div>
	</main>
</body>
<script>
	$(function() {
		wage();
		load();		
		$("tr:nth-child(n)").addClass("tr-even");

		var td2 = $(".wage-list tr:eq(1)").children();
		var hu_num = td2.eq(11).text();
		if (hu_num != "")
			getOneWage(hu_num);

		$(".wage-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();

			var hunum = td.eq(11).text();
			if (hunum != "") getOneWage(hunum);
		});

		
		
		$("#payenddate").blur(function() {
			var formData = {
					stdate : $("#paystdate").val(),
					enddate : $("#payenddate").val(),
					empid : $("#empid").val(),
					grade : $("#grade").val()
				};

				$.ajax({
					url : "${pageContext.request.contextPath}/countDay",
					type : "post",
					data : formData,
					dataType : "json", // 수신 데이터 타입
					success : function(wage) {
							$("#fund").val(wage);
					},
					error : function(request) {
						alert("message:" + request.responseText);
					}
				});
		});

		//수정버튼클릭시
		$('#up').click(function() {
			var msg = "해당 급여건을 수정하시겠습니까?";

			if (confirm(msg)) {
				$.ajax({
					url : "${pageContext.request.contextPath}/updateWage",
					type : "post",
					data : $('#frm').serialize(),
					success : function(data) {
						if (data == "success") {
							window.location.reload();
						} else
							alert("수정 오류!!\n관리자에게 문의 하세요");
					},
					error : function(request) {
						alert("message:" + request.responseText);
					},
				});
			}
		});

		//삭제버튼클릭시
		$('#del').click(function() {
			var msg = "해당 급여건을 삭제하시겠습니까?"

			if (confirm(msg)) {
				var formData = {
					hunum : $('#hunum').val()
				};

				$.ajax({
					url : "${pageContext.request.contextPath}/deleteWage",
					type : "post",
					data : formData,
					success : function(data) {
						if (data == "success") {
							window.location.reload();
						} else
							alert("삭제 오류!!!\n관리자에게 문의 하세요")
					},
					error : function(request) {
						alert("message:" + request.responseText);
					}
				});
			}
		});

		//선택삭제
		$("#deleteAll").click(function() {
			var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";

			if (confirm(msg)) {
				var chkArray = new Array();
				$(".chk:checked").each(function() { //each = 향상된 for
					chkArray.push($(this).attr("data-uid"));
				});

				$.ajax({
					url : "${pageContext.request.contextPath}/wageDeleteAll",
					type : "POST",
					data : {
						chkArr : chkArray
					}, //controller <- chkArr
					success : function(resData) {
						if (resData == "success") {
							window.location.reload();
						} else
							alert("선택된 급여이 없습니다.");

					},
					error : function(request) {
						alert("message:" + request.responseText);
					}
				});
			}
		});
		
	});
	
	function popup(popup) {
		var id = popup.getAttribute('id');
		
		if(id == "empnmp"){
			var url = "${pageContext.request.contextPath}/empPopup";
			var name = "사원 목록";
		} else return false;
		
		window.open(url, name, "width=1200, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}

	function wagepop(hunum) {
		var url = "${pageContext.request.contextPath}/wagepopup?hunum=" + hunum;
		var name = "추가수당 입력";

		window.open(url, name, "width=1200, height=500, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}

	function payslip(hunum) {
		var url = "${pageContext.request.contextPath}/payslip?hunum=" + hunum;
		var name = "명세서";

		window.open(url, name, "width=1000, height=500, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100")
	}

	function getOneWage(hunum) {
		var formData = {
			hunum : hunum
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getWageOne",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(wage) {
				$("#hunum").val(wage.hunum);
				$("#hunm").val(wage.hugubun);
				$("#paynm").val(wage.paygubun);
				$("#pay").val(wage.paynm);
				$("#hustdate").val(wage.hustdate);
				$("#huenddate").val(wage.huenddate);
				$("#payday").val(wage.payday);
				$("#dept").val(wage.deptid);
				$("#deptid").val(wage.deptid);
				$("#grade").val(wage.grade);
				$("#empid").val(wage.empid);
				$("#empnm").val(wage.empnm);
				$("#paystdate").val(wage.paystdate);
				$("#payenddate").val(wage.payenddate);
				$("#fund").val(wage.fund);
				
			},
			error : function(request) {
				alert("message:" + request.responseText);
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