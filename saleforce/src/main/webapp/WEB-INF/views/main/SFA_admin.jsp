<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.emp-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.emp-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.fc-view {
	margin-top: 10px;
	margin-bottom: 10px;
}

.fc-toolbar h2 {
	font-size: 1.5em;
}
<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="middle m-tb10">
		<div class="main-wrap1  flex flex-justify">
			<div class="notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">게시판 관리</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_notice_manage" title="공지사항으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<form class="m-lr10" method="post" action="${pageContext.request.contextPath}/upBoard">
						<table>
							<tr>
								<td class="bg-green weight700 td-10 center">게시판 이름</td>
								<td class="p-lr3" colspan="3" style="position: relative;">
								<input type="text" id="boardTitle" class="input-100" required />
								<span onclick="popup()" style="position: absolute; top: 50%; transform: translateY(-50%); right: 15px; color: #000000;"> <i class="fas fa-search"></i>
								</span>
								<input type="hidden" name="boardCode" id="boardCode" />
								</td>
								
							</tr>
							<tr>
								<td class="td-7 under center bg-green weight700">읽기권한</td>
								<td class="td-10 p-lr3">
									<select name="boardRead" class="sel-100" id="read" required></select>
								</td>
	
								<td class="td-7 under center bg-green weight700">쓰기권한</td>
								<td class="td-10 p-lr3">
									<select name="boardWrite" class="sel-100" id="write" required></select>
								</td>
							</tr>
							<tr>
								<td class="td-7 under center bg-green weight700">댓글권한</td>
								<td class="td-10 p-lr3">
									<select name="boardReply" class="sel-100" id="reply" required></select>
								</td>
								<td class="td-7 under center bg-green weight700">다운권한</td>
								<td class="td-10 p-lr3">
									<select name="boardDownload" class="sel-100" id="download" required></select>
								</td>
							</tr>
						</table>
						<div class="btn-grp center m-t15 m-b15">
							<button type="submit" class="btn-on">내용저장</button>
							<button type="reset" class="btn-off">새로고침</button>
						</div>
					</form>
			</div>
			<div class="sale-wrap">
				<div class="m-lr10 m-t10 m-b10">
					<h3 class="noto font16 m-b5">홈페이지 정보수정</h3>
					<form id="company" method="post" action="${pageContext.request.contextPath}/setCompanyInfo">
						<table>
							<tr>
								<td class="bg-green weight700 td-10 center">로고 타이틀</td>
								<td class="p-lr3"><input type="text" name="comname" id="comname" class="input-100" required value="${com.comname}" /></td>
							</tr>
							<tr>
								<td class="bg-green weight700 td-10 center">로고 서브타이틀</td>
								<td class="p-lr3"><input type="text" name="comsubname" id="comsubname" class="input-100" required value="${com.comsubname}" /></td>
							</tr>
							<tr>
								<td class="bg-green weight700 td-10 center">접근권한</td>
								<td class="p-lr3" colspan="7">
								<select name="comauth" id="comauth">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
								</select>
								</td>
							</tr>
						</table>
						<div class="btn-grp center m-t15 m-b15">
							<button type="submit" class="btn-on">내용저장</button>
							<button type="reset" class="btn-off">새로고침</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="main-wrap2  flex flex-justify">
			<div class="calendar-wrap" style="width: 40%;">
				<div class="calendar m-lr10 flex flex-justify">
					<h3 class="noto font16 m-t10 m-b5">이번주 일정조회</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_schedule" title="일정관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="calendar-bottom m-tb5 m-lr10">
                    <div class="page-content">
                        <div id="calendar" class="calendar"></div>

                    </div>
                </div>
			</div>

			<div class="stock-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">사용자 권한 관리</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_auth" title="공지사항으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="emp-list m-t10 m-b10 m-lr10" id="empList">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-7">부서</td>
							<td class="td-7">직위/직급</td>
							<td class="td-5">사번</td>
							<td class="td-5">사원명</td>	
							<td class="td-3">승인체크</td>
							

						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="5">등록된 사원이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="manage" varStatus="status">
						<tr>
							<td id=buseotd>${manage.buseoname}</td>
							<td id=gradetd>${manage.gradename}</td>
							<td>${manage.empid}</td>
							<td>${manage.empnm}</td>													
							<td style="display: none;" >
								<c:if test="${manage.deptid eq '200'}">영업부 권한</c:if>
								<c:if test="${(manage.deptid eq '100') and (manage.grade) >= '5'}">인사부 근태 권한</c:if>
								<c:if test="${(manage.deptid eq '100') and (manage.grade) < '5'}">인사부 일반 권한</c:if>
							</td>
							<td>
								<select onChange="confirmChange(this.value, '${manage.empid}');" name="" id="" style="width: 75px; margin: 0 2px;">
										<option value="N"
											<c:if test="${manage.empauth eq 'N'}">selected</c:if>>거부</option>
										<option value="Y"
											<c:if test="${manage.empauth eq 'Y'}">selected</c:if>>승인</option>
								</select>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>

			</div>
		</div>
	</div>
</main>

</body>
<script src="${pageContext.request.contextPath}/calendar/core/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/core/locales/ko.js"></script>
<script src="${pageContext.request.contextPath}/calendar/interaction/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/daygrid/main.js"></script>
<script>
	$(function() {
		$("tr:nth-child(2n)").addClass("tr-even");
		notice();
		getSchedule();
		
		$('#comauth').val(${com.comauth});	
		
	});

	function confirmChange(empAuth, empID) {
		
		var msg = "권한을 변경하시겠습니까?";

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
						alert("권한이 변경되었습니다.");
					}

				},
				error : function() {
					alert("변경오류\n관리자에게 문의하세요.");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}
	}	

	function popup() {

		var url = "${pageContext.request.contextPath}/boardPopup";
		var name = "게시판 목록";
		
		window.open(url, name, "width=800, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}

	function getSchedule() {
		$.ajax({
			url : "${pageContext.request.contextPath}/schedule_list",
			type : "POST",
			data : { empid : 'admin'},
			success : function(resData){
				for(var i = 0; i < resData.length; i++) {
					resData[i].start 	= resData[i].startDate;
					resData[i].end 		= resData[i].endDate;
					resData[i].title	= resData[i].calContent;
					resData[i].id	 	= resData[i].cal_id;
				}
				getCalendar(resData);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function getCalendar(resData){
		var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        plugins: ['interaction', 'dayGrid'],
	        header: {
	            left: 'prev,next, today',
	            center: 'title',
	            right: 'dayGridWeek,dayGridDay'
	        },
	        navLinks: true,
	        editable: true,
	        eventLimit: true,
	        locales: "ko",
	        // 달력높이 조절
	        contentHeight: 445,
	        events: resData,
	        defaultView: 'dayGridWeek',
	        eventClick: function() {
		        window.location.href="${pageContext.request.contextPath}/SFA_schedule";
	        }
	    });

	    calendar.render();
	}

</script>
<script src="${pageContext.request.contextPath}/js/main_cal.js"></script>


</html>