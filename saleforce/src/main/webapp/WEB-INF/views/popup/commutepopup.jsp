<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<title>근태상세정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<style>
.tna-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.tna-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.tna-left {
	width: 100%;
}

.tna-right {
	width: 34.5%;
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<div class="tna-list m-t5 m-5 m-lr15">
		<table class="list center" style="table-layout: fixed;">
			<tr class="weight700 center font14">
				<td class="td-3">순번</td>
				<td style="display: none;">근태번호</td>
				<td style="display: none;">사원번호</td>
				<td class="td-5">근태유형</td>
				<td>시작시간</td>
				<td>종료시간</td>
				<td>총 근태시간</td>
				<td>비고</td>
			</tr>

			<c:if test="${count == 0}">
				<tr>
					<td class="weight700 center font14 " colspan="11">등록된 근태 정보가 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach items="${commutedetail}" var="commuteInfo" varStatus="status">
				<tr class="center font14">
					<td id="seq" style="cursor: pointer; text-decoration: underline;">${commuteInfo.seq}</td>
					<td style="display: none;">${commuteInfo.dlnum}</td>
					<td style="display: none;">${commuteInfo.empid}</td>
					<td>${commuteInfo.dlnm}</td>
					<td>${commuteInfo.strtime}</td>
					<td>${commuteInfo.endtime}</td>
					<td>${commuteInfo.tottime}</td>
					<td>${commuteInfo.remark}</td>
					<td style="display: none;">${commuteInfo.dlgubun}</td>
					<td style="display: none;">${commuteInfo.regdate}</td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
<script>
	$(".tna-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if (tdid == "seq") {
			var tr = $(this).parent();
			var td = tr.children();

			var seq = td.eq(0).text();
			var dlnum = td.eq(1).text();
			var empid = td.eq(2).text();
			var str = td.eq(4).text();
			var end = td.eq(5).text();
			var remark = td.eq(7).text();
			var dlgubun = td.eq(8).text();
			var dldate = td.eq(9).text();

			$(opener.document).find("#seq").val(seq);
			$(opener.document).find("#dlnum").val(dlnum);
			$(opener.document).find("#empid").val(empid);
			$(opener.document).find("#ontime").val(str);
			$(opener.document).find("#offtime").val(end);
			$(opener.document).find("#remark").val(remark);
			$(opener.document).find("#dlnm").val(dlgubun);
			$(opener.document).find("#dldate").val(dldate);

			
			$(opener.document).find("#up").css('display', 'none');
			$(opener.document).find("#upremark").css('display', 'inline-block');
			$(opener.document).find("#seq").removeAttr('disabled');
						
			window.close();
		} else
			return false;

	});
</script>
</html>