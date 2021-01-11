<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<title>수당등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

<style>
.wage-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.wage-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/human.js"></script>
</head>
<body>
<div class="wage-insert m-t5 m-b5 m-lr15">
	<div class="title">
		<p class="noto font16 weight500 m-b5">인사급여 > 수당 입력</p>
	</div>
					<form name="frm" id="frm" action="${pageContext.request.contextPath}/setWageInfo" method="post" autocomplete="off">
						<div class="wage">
							<table>
								<tr>
									<td class="td-7 under center bg-green weight700">급여코드</td>
									<td class="td-10 p-lr3">
										<input type="text" name="hunum" id="hunum" class="input-100" readonly style="background-color: #f3f4f4" value="${hunum}" >
									</td>
									
									<td class="td-7 under center bg-green weight700">수당일자</td>
									<td class="td-7 p-lr3">
										<input type="date" name="dldate" id="dldate" class="input-100" tabindex="1" required>
									</td>

									<td class="td-7 under center bg-green weight700">항목/지급액</td>
									<td class="td-20 p-lr3">
										<select name="allownm" class="sel-50" id="allownm" tabindex="2"></select>
										<input type="number" name="allowpay" id="allowpay" class="input-49" tabindex="3" value=0 required>
									</td>								

									<td class="td-7 under center bg-green weight700">사원명/비고</td>
									<td class="p-lr3">
										<input type="text" id="empnm" class="input-24" value="${name}" tabindex="4" required>
										<input type="text" name="remark" id="remark" class="input-73" tabindex="5">
										<input type="hidden" name="empid" id="empid" value="${empid}">
										<input type="hidden" name="insert_person" value="${sessionScope.empname}">
										<input type="text" name="seq" id="seq" disabled style="display: none;" >
									</td>
								</tr>

								
							</table>
						</div>
						<div class="flex flex-justify">
							<div></div>
							<div>
									<button type="reset" class="btn-on center m-t5 new" id="new1">초기화</button>
									<button type="submit" class="btn-on center m-t5 insert">수당 등록</button>
									<button type="button" class="btn-on center m-t5 up" id="up" style="display: none;">수정</button>				
									<button type="button" class="btn-off center m-t5 del" id="del" style="display: none;">삭제</button>
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
				</div>
				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">인사급여 > ${name}의 수당 조회</p>
				</div>

				<div class="search-wrap flex flex-justify m-lr15">
					<div class="">
						<button type="button" class="btn-on m-b5" id="deleteAll">선택삭제</button>
						<span class="btn-normal m-b5">수당목록 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">					
					</div>
				</div>

				<div class="wage-list m-b5 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>
							<td class="td-3">순번</td>
							<td class="td-10">근무일자</td>
							<td class="td-10">사원명</td>
							<td class="td-10">수당항목</td>
							<td class="td-10">지급액(원) / 시간</td>
							<td>비고</td>
						</tr>
						<c:if test="${count == 0}">
						<tr>
							<td class="weight700 center font14 " colspan="7">등록된 수당 건이 없습니다.</td>
						</tr>
						</c:if>
					<c:forEach items="${wagelist}" var="wage" varStatus="status">
						<tr class="center font14">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${wage.seq}" style="width: 20px; height: 20px;" /></td>
							<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td>${wage.dldate}</td>
							<td class="p-lr5">${wage.empnm}</td>
							<td class="td-7">${wage.allownm}</td>
							<td class="right p-lr5"><fmt:formatNumber value="${wage.allowpay}" pattern="#,###"/></td>
							<td class="td-5 p-lr5">${wage.remark}</td>
							<td style="display: none;">${wage.hunum}</td>
							<td style="display: none;">${wage.seq}</td>
						</tr>
					</c:forEach>
					</table>
				</div>
				<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<!-- 맨 앞으로 -->
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/wagepopup?curPage=1"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/wagepopup?curPage=${curPage-1}"> <span class="page">
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
							<a href="${pageContext.request.contextPath}/wagepopup?curPage=${num}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/wagepopup?curPage=${curPage+1}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/wagepopup?curPage=${totalPage}"> <span class="page">
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
				
</body>
<script>
 	$(function() {
		wage();

		$(".wage-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();

			var hunum = td.eq(7).text();
			var seq = td.eq(8).text();
			if (hunum != ""){
				getWageInfoOne(hunum,seq);
				$("#seq").removeAttr('disabled');
				$("#up").css('display','inline-block');
				$("#del").css('display','inline-block');
				$(".insert").css('display','none');
			}
				
		});

		$('#new1').click(function () {
			$("#seq").attr('disabled','true');
		});

		//수정버튼클릭시
		$('#up').click(function() {
			var msg = "해당 급여건을 수정하시겠습니까?";

			if (confirm(msg)) {
				$.ajax({
					url : "${pageContext.request.contextPath}/updateWageInfo",
					type : "post",
					data : $('#frm').serialize(),
					success : function(data) {
						if (data == "success") {
							window.location.reload();
							$("#up").css('display','none');
							$("#del").css('display','none');
							
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
					hunum : $('#hunum').val(),
					seq : $('#seq').val()
				};

				$.ajax({
					url : "${pageContext.request.contextPath}/deleteWageInfo",
					type : "post",
					data : formData,
					success : function(data) {
						if (data == "success") {
							window.location.reload();
							$("#up").css('display','none');
							$("#del").css('display','none');
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
					url : "${pageContext.request.contextPath}/wageInfoDeleteAll",
					type : "POST",
					data : {
						hunum : $('#hunum').val(),
						chkArr : chkArray
					}, 
					success : function(resData) {
						if (resData == "success") {
							window.location.reload();
						} else
							alert("선택된 급여가 없습니다.");

					},
					error : function(request) {
						alert("message:" + request.responseText);
					}
				});
			}
		});

		$(window).bind("beforeunload", function (e){
			window.opener.location.reload();
		});

		
	});

 	function getWageInfoOne(hunum, seq) {
		var formData = {
			hunum : hunum,
			seq : seq
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getWageInfoOne",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(wage) {
				$("#hunum").val(wage.hunum);
				$("#seq").val(wage.seq);
				$("#dldate").val(wage.dldate);
				$("#allownm").val(wage.allowcd);
				$("#allowpay").val(wage.allowpay);
				$("#remark").val(wage.remark);
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