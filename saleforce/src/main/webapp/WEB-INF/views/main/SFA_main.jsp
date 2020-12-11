<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.attend-btn-on {
	width: 220px;
	border: 1px solid #ccc;
	border-radius: 50px;
	background-color: transparent;
	color: #ccc;
	padding: 10px 0;
}

.attend-btn-off {
	width: 220px;
	border: 1px solid #0C4A60;
	border-radius: 50px;
	background-color: transparent;
	color: #0C4A60;
	padding: 10px 0;
}

.sel-attend {
	font-size: 12px;
	border-radius: 2px;
	border: 1px solid #d5d5d5;
	width: 65px;
	height: 30px;
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
</style>
</head>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="middle m-tb10">
		<div class="main-wrap1  flex flex-justify">
			<div class="main-notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">공지사항 알림글</h3>
					<span class="m-t10 m-b5"> <a href="sfa_notice.html" title="공지사항으로 이동" target="_blank" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="tbl-wrap m-b10 m-lr10">
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트입니다. 공지가 잘 들어갔는지 테스트 중입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트 중입니다. 작성자는 관리자입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>

				</div>
			</div>
			<div class="file-wrap">
				<div class="file m-lr10 flex flex-justify">
					<h3 class="noto font16 m-t10 m-b5">결재 대기 문서</h3>
					<span class="m-t10 m-b5"> <a href="SFA_approval_ready.html" title="결재 대기 문서로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="app-content m-t10 m-lr10">
					<div style="border-bottom: 1px solid #e7e7e7; padding-bottom: 10px;" class="app-list flex flex-justify noto weight700 font14">
						<div class="app-date center" style="width: 15%;">기안일</div>
						<div class="app-form center" style="width: 15%;">결재양식</div>
						<div class="app-subject center" style="width: 50%;">결재문서제목</div>
						<div class="app-file center" style="width: 20%;">첨부</div>
					</div>
					<div class="p-t10">
						<div style="border-bottom: 1px solid #e7e7e7;" class="app-list flex flex-justify noto font14 p-tb10">
							<div class="app-date center" style="width: 15%;">2020.09.16</div>
							<div class="app-form center" style="width: 15%;">업무일지</div>
							<div class="app-subject left p-lr5" style="width: 50%;">0916 업무일지입니다.</div>
							<div class="app-file center" style="width: 20%;">0916_업무일지.pdf</div>
						</div>
					</div>
					<div class="p-t10">
						<div style="border-bottom: 1px solid #e7e7e7;" class="app-list flex flex-justify noto font14 p-tb10">
							<div class="app-date center" style="width: 15%;">2020.09.16</div>
							<div class="app-form center" style="width: 15%;">업무일지</div>
							<div class="app-subject left p-lr5" style="width: 50%;">0916 업무일지입니다.</div>
							<div class="app-file center" style="width: 20%;">0916_업무일지.pdf</div>
						</div>
					</div>
					<div class="p-t10">
						<div style="border-bottom: 1px solid #e7e7e7;" class="app-list flex flex-justify noto font14 p-tb10">
							<div class="app-date center" style="width: 15%;">2020.09.16</div>
							<div class="app-form center" style="width: 15%;">업무일지</div>
							<div class="app-subject left p-lr5" style="width: 50%;">0916 업무일지입니다.</div>
							<div class="app-file center" style="width: 20%;">0916_업무일지.pdf</div>
						</div>
					</div>
					<div class="p-t10">
						<div style="border-bottom: 1px solid #e7e7e7;" class="app-list flex flex-justify noto font14 p-tb10">
							<div class="app-date center" style="width: 15%;">2020.09.15</div>
							<div class="app-form center" style="width: 15%;">수주처리</div>
							<div class="app-subject  left p-lr5" style="width: 50%;">0915 신진금속 수주 건입니다.</div>
							<div class="app-file center" style="width: 20%;">0915_신진금속.pdf</div>
						</div>
					</div>
				</div>
			</div>
			
				<div class="tna-wrap">
					<div class="tna m-lr10">
						<h3 class="noto font16 m-t10 m-b5">${sessionScope.empid}  ${sessionScope.empname} 근태기록</h3>
					</div>
				<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setCommute" autocomplete="off">					
					<div class="tbl-wrap m-b10 m-lr10">
						<div class="main-attend">
							<div class="m-t10 weight700 center" style="border: 1px solid #0C4A60; width: 100%; height: 30px; line-height: 30px; color: #0C4A60; font-size: 16px; text-align: center;" id="clock"></div>
							<div class="attend flex flex-justify noto font14 weight700 m-t20">
								<span class="center p-t5">출근시간</span> 
								<span><input class="input-main right" name="ontime" id="ontime" readonly></input></span>
							</div>
							<div class="attend flex flex-justify noto font14 weight700 m-t15">
								<span class="center p-t5">퇴근시간</span> 
								<span><input class="input-main right" name="offtime" id="offtime" readonly></input></span>
							</div>
							<div class="attend flex flex-justify noto font14 weight700 m-t15">
								<span>현재상태</span> 
								<span> 
								<select class="sel-attend" id="dlnm" name="dlnm" onChange="dlInfoInsert(this.value);">
								</select>
								</span>
							</div>
							<div class="attend flex flex-justify noto font14 weight700 m-t20">
								<button type="submit" class="noto font14 weight700 attend-btn-on">출근하기</button>
								<button type="button" class="noto font14 weight700 attend-btn-off offtime" id="offtime">퇴근하기</button>
							</div>
						</div>
						<input type="text" class="dlnum" name="dlnum" id="dlnum" style="display:none;"/>
						<input type="date" name="regdate" id="regdate" value="${sessionScope.nowdate}" style="display:none;"/>
						<input type="time" name="regtime" id="regtime" value="${sessionScope.nowtime}" style="display:none;"/>
						<input type="text" class="empid" name="empid" value="${sessionScope.empid}" style="display:none;"/>
					</div>
		 		</form> 
			</div>

		</div>

		<div class="main-wrap2  flex flex-justify">
			<div class="calendar-wrap" style="width: 39.2%;">
				<div class="calendar m-lr10 flex flex-justify">
					<h3 class="noto font16 m-t10 m-b5">일정 안내</h3>
					<span class="m-t10 m-b5"> <a href="sfa_schedule.html" title="일정관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="cal-wrap m-b10 m-lr10">
					<div class="main">
						<div class="content-wrap">
							<div class="content-left">
								<div class="main-wrap">
									<div id="main-day" class="main-day"></div>
									<div id="main-date" class="main-date"></div>
								</div>
								<div class="todo-wrap">
									<div class="todo-title noto">일정리스트</div>
									<div class="input-wrap">
										<input type="text" placeholder="일정을 입력해주세요." id="input-box" class="input-box">
										<button type="button" id="input-data" class="input-data noto">추가</button>
										<div id="input-list" class="input-list"></div>
									</div>
								</div>
							</div>
							<div class="content-right">
								<table id="calendar" class="center">
									<thead>
										<tr class="btn-wrap clearfix">
											<td><label id="prev" style="cursor: pointer;"> &#60; </label></td>
											<td class="center" id="current-year-month" colspan="5"></td>
											<td><label id="next" style="cursor: pointer;"> &#62; </label></td>
										</tr>
										<tr>
											<td class="center sun noto">일</td>
											<td class="center noto">월</td>
											<td class="center noto">화</td>
											<td class="center noto">수</td>
											<td class="center noto">목</td>
											<td class="center noto">금</td>
											<td class="center noto sat">토</td>
										</tr>
									</thead>
									<tbody id="calendar-body" class="calendar-body noto" style="cursor: pointer;">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="sale-wrap" style="width: 60%; margin-top: 15px;">
				<div class="sale m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">SFA 수주</h3>
					<span class="m-t10 m-b5"> <a href="sfa_order_manage.html" title="수주관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="tbl-wrap m-b10 m-lr10">
					<table id="sale" class="table center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-5">순번</td>
							<td class="td-5">수주번호</td>
							<td class="td-7">수주일자</td>
							<td class="td-13">거래처명</td>
							<td class="td-7">품목코드</td>
							<td>품목명</td>
							<td class="td-5">품목구분</td>
							<td class="td-7">담당자명</td>
							<td class="td-5">수량</td>
							<td class="td-7">단가</td>
							<td class="td-7">공급가액</td>
							<td class="td-7">부가세</td>
							<td class="td-5">비고</td>
						</tr>
						
						<%-- <c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="14">등록된 수주 건이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${orderlist}" var="order" varStatus="status">
							<tr class="center font14">
								<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td class="td-5">${order.ordnum}</td>
								<td class="td-7">${order.orddt}</td>
								<td class="td-13 left p-lr5">${order.comnm}</td>
								<td class="td-7">${order.itemcd}</td>
								<td class="left p-lr5">${order.itemnm}</td>
								<td class="td-5">${order.divnm}</td>
								<td class="td-7">${order.ordperson}</td>
								<td class="td-5 right p-lr5">${order.qty}</td>
								<td class="td-7 right p-lr5">${order.uprice}</td>
								<td class="td-7 right p-lr5">${order.price}</td>
								<td class="td-7 right p-lr5">${order.tax}</td>
								<td class="td-13 center p-lr5">${order.remark}</td>
							</tr>		
						</c:forEach>	 --%>	
					</table>
				</div>
			</div>
		</div>
	</div>
</main>

</body>
<script src="${pageContext.request.contextPath}/js/main_cal.js"></script>
<script>
	$(function(){
		tna();
		var empid = ${sessionScope.empid};
		//alert(empid);
		commuLoadMain(empid);

		// 퇴근하기 버튼 클릭 시
		$('.offtime').click(function(){
			var date = new Date();    
			
			var hours 	= date.getHours();
			var mimutes = date.getMinutes();
			var seconds = date.getSeconds();

			var time = hours +':'+ mimutes +':'+ seconds;

			var offtime = time;
			var endtime = time;
			
			var dlnum = $(".dlnum").val();
			//alert(dlnum + offtime);

			var msg = "현재 시간 " + offtime + "입니다. 퇴근하시겠습니까?";

			if(confirm(msg)){
				//alert("성공");
				var formData = {
						dlnum	: dlnum,
						offtime : offtime,
						endtime : endtime
					};
				$.ajax({
					url		: "${pageContext.request.contextPath}/updateOfftime",
					type	: "POST",
					data	: formData,
					success : function(data) {
						window.location.reload();
					},
					error	: function(request){
			            alert("message:"+request.responseText);
					}
				});

			}
		});
	});
</script>
<script>
	// 근태정보 출력
	function commuLoadMain(empid){
		//alert(empid);

		var formData = {
				empid : empid
			};

		$.ajax({
			url		: "${pageContext.request.contextPath}/commuLoadMain",
			type	: "POST",
			data	: formData,
			success : function(commute){
				//alert("성공");
				$('.dlnum').val(commute.dlnum);
				$('#ontime').val(commute.ontime);
				$('.ontime').val(commute.ontime);
				$('#offtime').val(commute.offtime);
				$('#dlnm').val(commute.dlgubun);
				$('#empid').val(commute.empid);
				$('#dldate').val(commute.dldate);
			},
			error : function(request) {
				alert("message:" + request.responseText + "\n");
			}
			
		});
	}

	function dlInfoInsert(dlnm) {
		var dlnum = $(".dlnum").val();
		var empid = ${sessionScope.empid};
		//alert(dlnm + dlnum);
		
		var msg = "근태 유형을 변경하시겠습니까?";

		if (confirm(msg)){
			var formData = {
					dlnm	: dlnm,
					empid	: empid,
					dlnum	: dlnum
				};

			$.ajax({
				url		: "${pageContext.request.contextPath}/dlInfoInsert",
				type	: "POST",
				data	: formData,
				success : function(resData) {
					alert("유형이 변경되었습니다.");
				},
				error	: function(){
					alert("변경오류\n관리자에게 문의하세요.");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}
	}
	
	function printClock() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		var dayList = [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ];

		if (dd < 10) {
			dd = '0' + dd
		}

		if (mm < 10) {
			mm = '0' + mm
		}

		today = yyyy + '년' + '&nbsp' + mm + '월' + '&nbsp' + dd + '일' + '&nbsp'
				+ dayList[today.getDay()];

		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var amPm = 'AM '; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);
		
		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM ';
			currentHours = addZeros(currentHours - 12, 2);
		}

		if (currentSeconds >= 50) { // 50초 이상일 때 색을 변환해 준다.
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}
		// clock.innerHTML = currentHours + ":" + currentMinute + ":" + currentSeconds +
		//     " <span style='font-size:16px;'>" + amPm + "</span>"; //날짜를 출력해 줌
		clock.innerHTML = today + " <span style='font-size:16px;'>" + amPm
				+ "</span>" + currentHours + ":" + currentMinute + ":"
				+ currentSeconds; //날짜를 출력해 줌

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>

</html>