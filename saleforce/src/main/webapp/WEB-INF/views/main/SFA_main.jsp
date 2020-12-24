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
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
</head>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="middle m-tb10">
		<div class="main-wrap1  flex flex-justify">
			<div class="main-notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">공지사항 알림글</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=any" title="공지사항으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
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
					<h3 class="noto font16 m-t10 m-b5">결재 대기문서</h3>
					<span class="m-t10 m-b5"> <a href="${pageContext.request.contextPath}/SFA_schedule" title="일정관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
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
					<h3 class="font16 noto m-t10 m-b5">수주목록</h3>
					<span class="m-t5 m-b5"> <a href="${pageContext.request.contextPath}/SFA_order_manage" title="수주관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
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
						
						
					</table>
				</div>
			</div>
		</div>
	</div>
</main>

</body>
<script src="${pageContext.request.contextPath}/js/main_cal.js"></script>
<script>
	var pre; 
	$(function(){				
		tna();
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