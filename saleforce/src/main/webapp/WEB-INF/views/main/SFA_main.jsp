<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.attend-btn-on {
	width: 220px;
	border-radius: 50px;
	background-color: transparent;
	padding: 10px 0;
}

.attend-btn-off {
	width: 220px;
	border-radius: 50px;
	background-color: transparent;
	padding: 10px 0;
}

.sel-attend {
	font-size: 12px;
	border-radius: 2px;
	border: 1px solid #d5d5d5;
	width: 65px;
	height: 30px;
}

.sale-table tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.fc-view {
	margin-top: 10px;
	margin-bottom: 10px;
}

.fc-toolbar h2 {
	font-size: 1.5em;
}

<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
</head>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="middle m-tb10">
		<div class="main-wrap1  flex flex-justify">
			<div class="main-notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">전체 게시판</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=any" title="전체 게시판으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="tbl-wrap m-b10 m-lr10">
					<table class="list center" style="table-layout: fixed;">
						<c:if test="${anycnt == 0}">
							<tr>
								<td class="weight700 center font14 td-main" colspan="3">등록된 게시판이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${anylist}" var="any" varStatus="status">
							
							<c:if test="${any.division == 'Y'}">
								<tr class="center font14 noto weight700 font14">
								<td style="color: #d92550" class="td-10 center td-main">[공지]</td>
							</c:if>
							<c:if test="${any.division == 'N'}">
								<tr class="center font14 noto font14">
								<td class="td-10 center td-main">[일반]</td>
							</c:if>
								<td class="left p-lr5 td-main"><a href="${pageContext.request.contextPath}/SFA_notice_view?boardCode=any&aid=${any.aid}">${any.subject}</a></td>
								<td class="td-10 center p-lr5 td-main">${any.regdate}</td> 
							</tr>
						</c:forEach>
					</table>						
				</div>
			</div>
			<div class="main-notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">${sessionScope.boardTitle}</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${sessionScope.boardCode}" title="게시판으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="tbl-wrap m-b10 m-lr10">
					<table class="list center" style="table-layout: fixed;">
						<c:if test="${sessionScope.boardCode == 'sale'}">
							<c:if test="${salecnt == 0}">
								<tr>
									<td class="weight700 center font14 td-main" colspan="3">등록된 게시판이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${salelist}" var="sale" varStatus="status">
								
								<c:if test="${sale.division == 'Y'}">
									<tr class="center font14 noto weight700 font14">
									<td style="color: #d92550" class="td-10 center td-main">[공지]</td>
								</c:if>
								<c:if test="${sale.division == 'N'}">
									<tr class="center font14 noto font14">
									<td class="td-10 center td-main">[일반]</td>
								</c:if>
									<td class="left p-lr5 td-main"><a href="${pageContext.request.contextPath}/SFA_notice_view?boardCode=sale&aid=${sale.aid}">${sale.subject}</a></td>
									<td class="td-10 center p-lr5 td-main">${sale.regdate}</td> 
									</tr>
							</c:forEach>
						</c:if>
						<c:if test="${sessionScope.boardCode == 'human'}">
							<c:if test="${humancnt == 0}">
								<tr>
									<td class="weight700 center font14 td-main" colspan="3">등록된 게시판이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${humanlist}" var="human" varStatus="status">
								
								<c:if test="${human.division == 'Y'}">
									<tr class="center font14 noto weight700 font14">
									<td style="color: #d92550" class="td-10 center td-main">[공지]</td>
								</c:if>
								<c:if test="${human.division == 'N'}">
									<tr class="center font14 noto font14">
									<td class="td-10 center td-main">[일반]</td>
								</c:if>
									<td class="left p-lr5 td-main"><a href="${pageContext.request.contextPath}/SFA_notice_view?boardCode=human&aid=${human.aid}">${human.subject}</a></td>
									<td class="td-10 center p-lr5 td-main">${human.regdate}</td> 
									</tr>
							</c:forEach>
						</c:if>
					</table>	
					<!-- <div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html" target="_blank"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div> -->
				</div>
			</div>			
			
				<div class="tna-wrap">
					<div class="notice m-lr10 flex flex-justify">
						<div class="tna">
							<h3 class="noto font16 m-t10 m-b5">${sessionScope.empid}  ${sessionScope.empname} 근태기록</h3>
						</div>
						<div class="m-t10 m-b5">
							<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/perCommute?empid=${sessionScope.empid}" title="개인 근태기록으로 이동" class="font16"><i class="fas fa-share-square"></i></a>
							</span>
						</div>
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
								<select class="sel-attend" id="dlnm" name="dlnm" onChange="dlGubunUp(this.value);">
								</select>
								</span>
							</div>
							<div class="attend flex flex-justify noto font14 weight700 m-t20">
								<button type="submit" class="noto font14 weight700 attend-btn-on">출근하기</button>
								<button type="button" class="noto font14 weight700 attend-btn-off offtime">퇴근하기</button>
							</div>
						</div>
						<input type="hidden" name="dlnum" id="dlnum" class="dlnum"/>
						<input type="date" name="regdate" id="regdate" value="${sessionScope.nowdate}" style="display:none;" />
						<input type="time" name="regtime" id="regtime" value="${sessionScope.nowtime}" style="display:none;" />
						<input type="hidden" name="empid" id="empid" class="empid" value="${sessionScope.empid}"/>
						<input type="hidden" name="seq" id="seq" class="seq"/>
					</div>
		 		</form> 
			</div>

		</div>

		<div class="main-wrap2  flex flex-justify">
			<div class="calendar-wrap" style="width: 39.2%;">
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

			<div class="sale-wrap" style="width: 60%; margin-top: 15px;">
				<c:if test="${sessionScope.boardCode == 'sale'}">
					<div class="sale m-lr10 flex flex-justify">
						<h3 class="font16 noto m-t10 m-b5">수주목록</h3>
						<span class="m-t5 m-b5"> <a href="${pageContext.request.contextPath}/SFA_order_manage" title="수주관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
						</span>
					</div>
					<div class="tbl-wrap m-b10 m-lr10">
					<table id="sale" class="sale-table center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-10">수주번호</td>
							<td class="td-10">수주일자</td>
							<td class="td-13">거래처명</td>
							<td class="td-10">품목코드</td>
							<td>품목명</td>
							<td class="td-10">담당자명</td>
							<td class="td-5">수량</td>
							<td class="td-10">공급가액</td>
						</tr>
						<c:if test="${orderlist eq null}">
								<tr>
									<td class="weight700 center font14 td-main" colspan="8">등록된 수주목록이 없습니다.</td>
								</tr>
						</c:if>
						<c:forEach items="${orderlist}" var="order" varStatus="status">
							<tr class="center font14">
								<td class="td-5">${order.ordnum}</td>
								<td class="td-7">${order.orddt}</td>
								<td class="td-13 left p-lr5">${order.comnm}</td>
								<td class="td-7">${order.itemcd}</td>
								<td class="left p-lr5">${order.itemnm}</td>
								<td class="td-7">${order.ordperson}</td>
								<td class="td-5 right p-lr5"><fmt:formatNumber value="${order.qty}" pattern="#,###"/></td>
								<td class="td-7 right p-lr5"><fmt:formatNumber value="${order.price}" pattern="#,###"/></td>
							</tr>			
						</c:forEach>							
					</table>
					</div>
				</c:if>
				<c:if test="${sessionScope.boardCode == 'human'}">
					<div class="sale m-lr10 flex flex-justify">
						<h3 class="font16 noto m-t10 m-b5">근태목록</h3>
						<span class="m-t5 m-b5"> <a href="${pageContext.request.contextPath}/SFA_commute_manage" title="근태관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
						</span>
					</div>
					<div class="tbl-wrap m-b10 m-t15 m-lr10">
					<table id="sale" class="sale-table center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td>부서명</td>
							<td>사원명</td>
							<td>근태일자</td>
							<td>출근시간</td>
							<td>퇴근시간</td>
							<td>총근무시간</td>
						</tr>
						<c:if test="${orderlist eq null}">
								<tr>
									<td class="weight700 center font14 td-main" colspan="6">등록된 근태기록이 없습니다.</td>
								</tr>
						</c:if>
						<c:forEach items="${commutelist}" var="commute" varStatus="status">
							<tr class="center font14">
								<td class="td-5">${commute.buseoname}</td>
								<td class="td-7">${commute.empnm}</td>
								<td class="td-13 p-lr5">${commute.dldate}</td>
								<td class="td-7">${commute.ontime}</td>
								<td class="p-lr5">${commute.offtime}</td>
								<td class="td-7">${commute.tottime}</td>
							</tr>			
						</c:forEach>							
					</table>
					</div>
				</c:if>			
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
	var pre; 
	$(function(){				
		tna();
		getSchedule();
		var empid = ${sessionScope.empid};
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ근태관리ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//			
		commuLoadMain(empid);

		
		
		$("#dlnm").on('focus', function () { // Store the current value on focus and on change 
			pre = this.value;
		});


		// 퇴근하기 버튼 클릭 시
		$('.attend-btn-off').click(function(){
			var date = new Date();    
			
			var hours 	= date.getHours();
			var mimutes = date.getMinutes();
			var seconds = date.getSeconds();

			var time = hours +':'+ mimutes +':'+ seconds;

			var offtime = time;
			var endtime = time;
			
			var dlnum = $(".dlnum").val();
			var seq = $("#seq").val();
			//alert(dlnum + offtime);

			var msg = "현재 시간 " + offtime + "입니다. 퇴근하시겠습니까?";

			if(confirm(msg)){
				var formData = {
						dlnum	: dlnum,
						offtime : offtime,
						endtime : endtime,
						seq : seq
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
	//근태기록 확인
	function commuteCount(dlnum){
		$.ajax({
			url		: "${pageContext.request.contextPath}/commuteCount",
			type	: "POST",
			data	: {dlnum : dlnum},
			success : function(dl){
				if(dl.count > 0 && dl.offtime == null){
					$('.attend-btn-on').css('color','#ccc');
					$('.attend-btn-on').css('border','1px solid #ccc');
					$('.attend-btn-on').attr('disabled','true');

					$('.attend-btn-off').css('color','#0C4A60');
					$('.attend-btn-off').css('border','1px solid #0C4A60');
					$('.attend-btn-off').removeAttr('disabled');
				}else if(dl.count > 0 && dl.offtime != null){
					$('.attend-btn-on').css('color','#ccc');
					$('.attend-btn-on').css('border','1px solid #ccc');
					$('.attend-btn-on').attr('disabled','true');
					
					$('.attend-btn-off').css('color','#ccc');
					$('.attend-btn-off').css('border','1px solid #ccc');
					$('.attend-btn-off').attr('disabled','true');
				}else {
					$('.attend-btn-on').css('color','#0C4A60');
					$('.attend-btn-on').css('border','1px solid #0C4A60');
					$('.attend-btn-on').removeAttr('disabled');
					
					$('.attend-btn-off').css('color','#ccc');
					$('.attend-btn-off').css('border','1px solid #ccc');
					$('.attend-btn-off').attr('disabled','true');
				}	
			},
			error : function(request) {
				alert("message:" + request.responseText + "\n");
			}
			
		});
	}
	// 근태정보 출력
	function commuLoadMain(empid){
		var formData = {
				empid : empid
			};

		$.ajax({
			url		: "${pageContext.request.contextPath}/commuLoadMain",
			type	: "POST",
			data	: formData,
			success : function(commute){
				//alert("성공");
				$('#dlnum').val(commute.dlnum);
				$('#ontime').val(commute.ontime);
				$('#offtime').val(commute.offtime);
				$('#dlnm').val(commute.dlgubun);
				$('#dldate').val(commute.dldate);
				$('#seq').val(commute.seq);

				commuteCount(commute.dlnum);
			},
			error : function(request) {
				alert("message:" + request.responseText + "\n");
			}			
		});

	}

	function dlGubunUp(dlnm) {
		var dlnum = $("#dlnum").val();
		var seq = $("#seq").val();
		var dldate = $("#regdate").val();
		var empid = ${sessionScope.empid};
		
		var msg = "근태 유형을 변경하시겠습니까?";

		if (confirm(msg)){
			var formData = {
					dlnm	: dlnm,
					empid	: empid,
					dlnum	: dlnum, 
					seq		: seq, 
					dldate	: dldate
				};

			$.ajax({
				url		: "${pageContext.request.contextPath}/dlGubunUp",
				type	: "POST",
				data	: formData,
				success : function(resData) {
					alert("유형이 변경되었습니다.");
				},
				error	: function(request){
		            alert("message:"+request.responseText);
				},
				complete : function() {
					window.location.reload();
				}
			});
		}else $('#dlnm').val(pre);
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
		var amPm = '오전 '; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);
		
		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = '오후 ';
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

	function getSchedule() {
		$.ajax({
			url : "${pageContext.request.contextPath}/schedule_list",
			type : "POST",
			data : { empid : $("#empid").val()},
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
	        contentHeight: 440,
	        events: resData,
	        defaultView: 'dayGridWeek',
	        eventClick: function() {
		        window.location.href="${pageContext.request.contextPath}/SFA_schedule";
	        }
	    });

	    calendar.render();
	}
</script>
</html>