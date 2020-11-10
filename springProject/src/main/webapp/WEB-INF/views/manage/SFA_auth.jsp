<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/menu/admin_HEADER.jsp"%>

<body>
	<%@ include file="/WEB-INF/views/include/menu/MODAL.jsp"%>
	<%@ include file="/WEB-INF/views/include/menu/MENU.jsp"%>
	<main>
		<div class="page-wrap m-tb15">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">권한관리 >
						회사원권한 등록</p>
				</div>
				<div class="auth-insert m-b15 m-lr15">
					<form name="" method="post" action="" autocomplete="off">
						<div class="auth-info">
							<table>
								<tr>
									<td class="under center bg-green weight700" style="width: 11%;">사원번호/사원명</td>
									<td class="p-lr3" style="width: 22%;"><input type="text"
										name="empid" id="empid" class="input-50" tabindex="1"
										disabled="true" readonly /> <input type="text" name="empnm"
										id="empnm" class="empnm" tabindex="2" style="width: 48%;"
										disabled="true" readonly /></td>
									<td class="under center bg-green weight700" style="width: 11%;">부서명/직급</td>
									<td class="p-lr3" style="width: 22%;">
									<select name="deptid" id="deptid" style="width: 48%; margin: 0 2px;">
									</select> 
									<select name="grade" id="grade"
										style="width: 48%; margin: 0 2px;">
									</select></td>
								</tr>
							</table>
						</div>

						<div class="right">
							<!--  <div>
                                <button type="reset" class="btn-on center m-t15 m-l5 new"
                                    style="display: none;">신규등록</button>
                            </div> -->
							<div>
								<!--  <button type="submit" class="btn-on center m-t15 m-l5 insert">등록</button> -->
								<button type="button" class="btn-on center m-t15 m-l5 up" onclick="authChange();">수정</button>
								<!--  <button type="reset" class="btn-off center m-t15 m-l5 reset">리셋</button> -->
								<button type="button" class="btn-off center m-t15 m-l5 del" onclick="deleteOne('${manage.empid}');">삭제</button>
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 10px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">권한관리 >
						회사원권한 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<span class="btn-normal m-b15 m-lr15">전체 사원목록 ${count}명  ${curPage}PAGE / ${totalPage}PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post"
							action="${pageContext.request.contextPath}/SFA_auth"
							style="margin: 0 10px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option value="all"
									<c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
								<option value="empnm"
									<c:if test="${searchOpt eq 'empnm'}">selected</c:if>>사원명</option>
							</select> <input value="${words}" type="text" name="words" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="emp-list m-b15 m-lr15">
					<table class="list center auth" id="auth"
						style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">순번</td>
							<td class="td-7" style="display:none;">부서코드</td>
							<td class="td-7">부서명</td>
							<td class="td-7" style="display:none;">직급코드</td>
							<td class="td-7">직급</td>
							<td class="td-5">사번</td>
							<td class="td-5">사원명</td>
							<td class="td-15">권한</td>
							<td class="td-5">승인여부</td>
						</tr>

						<c:if test="${count == 0}">
							<tr>
								<td colspan="7" class="center font14">등록된 사원이
									없습니다.</td>
							</tr>
						</c:if>

						<c:forEach items="${list}" var="manage" varStatus="status">
							<tr>
								<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td style="display:none;">${manage.deptid}</td>
								<td>${manage.buseoName}</td>
								<td style="display:none;">${manage.grade}</td>
								<td>${manage.gradeName}</td>
								<td>${manage.empid}</td>
								<td>${manage.empnm}</td>
								<td>
									<c:if test="${manage.deptid eq '200'}">영업부 권한</c:if>
									<c:if test="${(manage.deptid eq '100') and (manage.grade) >= '5'}">인사부 근태 권한</c:if>
									<c:if test="${(manage.deptid eq '100') and (manage.grade) < '5'}">인사부 일반 권한</c:if>
								</td>
								<td><select
									onChange="confirmChange(this.value, '${manage.empid}');"
									name="" id="" style="width: 75px; margin: 0 2px;">
										<option value="N"
											<c:if test="${manage.empauth eq 'N'}">selected</c:if>>거부</option>
										<option value="Y"
											<c:if test="${manage.empauth eq 'Y'}">selected</c:if>>승인</option>
								</select></td>
							</tr>

						</c:forEach>
					</table>
				</div>
				<!-- 페이징 ui 시작 -->
				<c:if test="${count > 0}">
					<div class="page-grp center m-t15">

						<!-- 맨 앞으로 -->
						<c:choose>
							<c:when test="${curPage > 1}">
								<a
									href="${pageContext.request.contextPath}/SFA_auth?curPage=1&searchOpt=${searchOpt}&words${words}">
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
									href="${pageContext.request.contextPath}/SFA_auth?curPage=${curPage-1}&searchOpt=${searchOpt}&words${words}">
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
									href="${pageContext.request.contextPath}/SFA_auth?curPage=${num}&searchOpt=${searchOpt}&words${words}">
									<span class="page">${num}</span>
								</a>
							</c:if>

						</c:forEach>
						<!-- 페이지 번호 출력 끝 -->

						<!-- 한 칸 뒤로 -->
						<c:choose>
							<c:when test="${curPage != totalPage}">
								<a
									href="${pageContext.request.contextPath}/SFA_auth?curPage=${curPage+1}&searchOpt=${searchOpt}&words${words}">
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
									href="${pageContext.request.contextPath}/SFA_auth?curPage=${totalPage}&searchOpt=${searchOpt}&words${words}">
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
	$(function() {
		$("tr:nth-child(n)").addClass("tr-even");
	})
</script>
<script>
	function confirmChange(empAuth, empID) {
		//alert(empAuth);
		//alert(empID);

		var msg = "선택하신 사원의 가입을 승인하시겠습니까?";

		if (confirm(msg)) {

			var formData = {
				empAuth : empAuth,
				empID : empID
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/confirmChange",
				type : "POST",
				data : formData,
				success : function(resData) {
					if (resData == "success") {
						alert("승인되었습니다.");
					}

				},
				error : function() {
					alert("승인 변경을 실패했습니다.");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}
	}

	function authChange(){
		//alert("성공");
		
		var empnm = document.getElementById("empnm").value;
		
		var msg = "선택하신 " +empnm+"의 권한을 변경하시겠습니까?";

		if (confirm(msg)) {
			
			var formData = {
					deptid 	: $("#deptid").val(),
					grade 	: $("#grade").val(),
					empid 	: $("#empid").val()
				};

			$.ajax({
				url		: "${pageContext.request.contextPath}/authChange",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					alert("권한이 변경되었습니다.");
				},
				error	: function(request) {
					alert("message:" + request.responseText + "\n");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}
	}

	function deleteOne(empid){
		//alert("성공");

		var empnm = document.getElementById("empnm").value;
		
		var msg = "선택하신 " +empnm+"의 정보를 삭제하시겠습니까?\n삭제 후에는 복원할 수 없습니다.";

		if (confirm(msg)) {
			
			var formData = {
					empid 	: $("#empid").val()
				};

			$.ajax({
				url		: "${pageContext.request.contextPath}/authDel",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					alert("선택하신 정보가 삭제되었습니다.");
				},
				error	: function(request) {
					alert("message:" + request.responseText + "\n");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}

	}

</script>
<script>
function load() {
 	$.ajax({
        url: "/springProject/getBuseoList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {
        
            $.each(resData, function(key, value){
            	$("#deptid").append("<option value="+ value.buseo_id + ">"+value.buseo_name+"</option>");
            });
            
        },
        error: function () {
            alert("시스템 에러");
        }
    });
    
     $.ajax({
        url: "/springProject/getGradeList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {
        
            $.each(resData, function(key, value){
            	$("#grade").append("<option value="+ value.grade_id + ">"+value.grade_name+"</option>");
            });
            
        },
        error: function () {
            alert("시스템 에러");
        }
    });
}
</script>
<script>
	function test(){
		var tr = $("#auth tr:nth-child(2)");
		var td = tr.children();
	        
		var empID = td.eq(5).text();
		
		var formData = {
			empID : empID
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/SFA_authOne",
			type : "POST",
			data : formData,
			success : function(resData) {
				//alert("성공");

				$('#empid').val(resData.empid);
				$('#empnm').val(resData.empnm);
				$('#deptid').val(resData.deptid);
				$('#grade').val(resData.grade);	

				alert(resData.empid + resData.empnm + resData.deptid + rasData.grade);
			},
			error : function(request) {
				alert("message:" + request.responseText + "\n");
			}
		});
	}

	function click(){
		$("#auth tr").click(function() {

			var tr = $(this);
			var td = tr.children();
	        
			var empID = td.eq(5).text();
			
			var formData = {
				empID : empID
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/SFA_authOne",
				type : "POST",
				data : formData,
				success : function(resData) {
					//alert("성공");
					var empid = resData.empid;
					var empnm = resData.empnm;
					var deptid = resData.deptid;
					var grade = resData.grade;

					$('#empid').val(empid);
					$('#empnm').val(empnm);
					$('#deptid').val(deptid);
					$('#grade').val(grade);					

				},
				error : function(request) {
					alert("message:" + request.responseText + "\n");
				}
			});

		});
	}
</script>
<script>
	$(function() {		
		test();	
		load();
		click();		
	});
</script>
</html>