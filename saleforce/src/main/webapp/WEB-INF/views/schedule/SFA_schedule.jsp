<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
	<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <main>
        <div class="page-wrap m-tb10">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t5 m-b5 m-l15">일정관리</p>
                </div>
                <div class="calendar-insert m-lr15">
                    <form id="frm" method="POST" autocomplete="off">
                        <table class="center weight700">
                            <tr>
                                <td class="td-10 noto under bg-green weight700 center">시작일자</td>
                                <td class="td-10 p-lr3">
                                    <input type="text" name="startDate" id="startDate" class="input-75" />
                                    <i class="fal fa-calendar-alt font16" style="line-height: 35px"></i>
                                </td>
                                <td class="td-10 noto under bg-green weight700 center">종료일자</td>
                                <td class="td-10 p-lr3">
                                    <input type="text"  name="endDate" id="endDate" class="input-75" />
                                    <i class="fal fa-calendar-alt font16" style="line-height: 35px" ></i></td>
                                <td class="td-10 noto under bg-green weight700 center">일정내용</td>
                                <td class="p-lr3">
                                	<input type="text" name="calContent" id="Content" class="input-100"/>
                                    <input type="hidden" name="empid" id="empid" value="${sessionScope.empid}" />
                                    <input type="hidden" id="cal_id" />
                                </td>
                                
                            </tr>
                        </table>
                        <div class="btn-grp right m-t10 m-b10">
                            <button type="button" id="addSchedule" class="btn-on">일정등록</button>
                            <button type="button" id="upSchedule" class="btn-on" style="display: none;">일정수정</button>
                            <button type="button" id="delSchedule" class="btn-off" style="display: none;">일정삭제</button>
                            <button type="reset" id="reset" class="btn-off">일정 리셋</button>
                        </div>
                    </form>
                </div>
                <div class="calendar-bottom m-tb5 m-lr15">
                    <div class="page-content">
                        <div id="calendar" class="calendar"></div>

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
$(function () {
    $("#startDate, #endDate").datepicker({
        dateFormat: 'yy-mm-dd'
    });
    
    getSchedule();

	$("#reset").click(function(){
		$("#addSchedule").css('display','inline-block');
		$("#upSchedule").css('display','none');
		$("#delSchedule").css('display','none');
	});
    
    $("#addSchedule").click(function(){
		addCalendar();
	});

	$("#upSchedule").click(function() {
		var msg = "일정을 수정하시겠습니까?";
		var formData = {	cal_id : $("#cal_id").val(),
							startDate : $("#startDate").val(),
							endDate : $("#endDate").val(),
							calContent : $("#Content").val()
				};
		
		if(confirm(msg)){
			$.ajax({
				url : "${pageContext.request.contextPath}/schedule_update",
				type : "POST",
				data : formData,
				success : function(resData){
					if(resData == "success") window.location.reload();
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}

			
	});

	$("#delSchedule").click(function() {
		var msg = "일정을 삭제하시겠습니까?";
		var formData = {cal_id : $("#cal_id").val()};

		if(confirm(msg)){
		$.ajax({
			url : "${pageContext.request.contextPath}/schedule_delete",
			type : "POST",
			data : formData,
			success : function(resData){
				if(resData == "success") window.location.reload();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		}
		
	});
});
</script>
<script>
function addCalendar() {
	var formData = $("#frm").serialize();

	$.ajax({
		url : "${pageContext.request.contextPath}/schedule_add",
		type : "POST",
		data : formData,
		success : function(resData){
			alert("일정이 추가되었습니다.");
			window.location.reload();
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
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
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        navLinks: true,
        editable: true,
        eventLimit: true,
        locales: "ko",
        // 달력높이 조절
        contentHeight: 650,
        events: resData,
        eventClick: function(info) {
            function formatdate(date){
            	var year = date.getFullYear();              
                var month = (1 + date.getMonth());          
                month = month >= 10 ? month : '0' + month;  
                var day = date.getDate();                   
                day = day >= 10 ? day : '0' + day;          
                return  year + '-' + month + '-' + day;
            }
           	var calid = document.getElementById('cal_id');
            var startDate = document.getElementById('startDate');
            var endDate = document.getElementById('endDate');           
            var content = document.getElementById('Content');            

            startDate.value = formatdate(info.event.start);
            endDate.value = formatdate(info.event.end);
            calid.value = info.event.id; 
            content.value = info.event.title;
                
            var addSchedule = document.getElementById('addSchedule');
            var upSchedule = document.getElementById('upSchedule');
            var delSchedule = document.getElementById('delSchedule');
            
            addSchedule.style.display = 'none';
            upSchedule.style.display = 'inline-block';
            delSchedule.style.display = 'inline-block';
       }
    });

    calendar.render();
}
</script>
</html>