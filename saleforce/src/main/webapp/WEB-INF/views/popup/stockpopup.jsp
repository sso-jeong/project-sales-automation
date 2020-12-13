<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<title>재고 상세목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<style>
.stock-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.stock-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
		<div class="search-wrap flex flex-justify m-t5 m-lr15">
			<div class="">
				<button type="button" class="btn-on m-b5" id="deleteAll">선택삭제</button>
				<span class="btn-normal m-b5">검색 된 품목 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
			</div>
			<div class="form-wrap">
				<form method="post" action="${pageContext.request.contextPath}/stockpopup" autocomplete="off">
					<select class="" name="searchOpt">
						<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
						<option <c:if test="${searchOpt eq 'd.indt'}">selected</c:if> value="d.indt">입고일자</option>
						<option <c:if test="${searchOpt eq 'd.outdt'}">selected</c:if> value="d.outdt">출고일자</option>
						<option <c:if test="${searchOpt eq 'stktypenm'}">selected</c:if> value="stktypenm">유형</option>			
					</select> 
					<input type="text" name="words" value="${words}" required />
					<button type="submit" class="btn-on">검색</button>
				</form>
			</div>
		</div>
		<div class="stock-list m-b5 m-lr15">
			<table class="list center" style="table-layout: fixed;">
				<tr class="weight700 center font14">
					<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>			
					<td class="td-7">순번</td>
					<td class="td-10">유형</td>
					<td class="td-20">입고일자</td>
					<td class="td-20">출고일자</td>
					<td class="td-20">수량</td>
					<td>비고</td>
				</tr>
				
				<c:if test="${(count == 0) or (count eq null)}">
					<tr>
						<td class="weight700 center font14 " colspan="6">등록된 재고 입력건이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${count > 0}">
					<c:forEach items="${stockdetaillist}" var="stock" varStatus="status">			
						<tr class="center font14">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${stock.seq}" style="width: 20px; height: 20px;" /></td>
							<td style="cursor: pointer; text-decoration: underline;" class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>						
							<td class="td-7">${stock.stktypenm}</td>
							<td>${stock.indt}</td>
							<td>${stock.outdt}</td>
							<td class="td-7 right p-lr5">${stock.cqty}</td>
							<td class="left p-lr5">${stock.remark}</td>
							<td style="display: none;" class="left p-lr5">${stock.type}</td>
							<td class="td-5" id="seq" style="display: none;">${stock.seq}</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
		</div>
		<c:if test="${count > 0}">
			<div class="page-grp center m-t5">
				<!-- 맨 앞으로 -->
				<c:choose>
					<c:when test="${curPage > 1}">
						<a href="${pageContext.request.contextPath}/stockpopup?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
								class="fas fa-angle-double-left"></i>
						</span>
						</a>
						<!-- 한칸 앞으로 -->
						<a href="${pageContext.request.contextPath}/stockpopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
						<a href="${pageContext.request.contextPath}/stockpopup?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
								${num} </span>
						</a>
					</c:if>

				</c:forEach>
				<!-- 페이지 번호 출력 -->

				<c:choose>
					<c:when test="${curPage != totalPage}">
						<a href="${pageContext.request.contextPath}/stockpopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
								<i class="fas fa-angle-right"></i>
						</span>
						</a>

						<a href="${pageContext.request.contextPath}/stockpopup?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
		<!--  페이징 ui -->
</body>
<script>
$(function() {
	$(".stock-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "seq"){
			var tr = $(this).parent();
			var td = tr.children();
			
			
				
			var indt = td.eq(2).text();
			var outdt = td.eq(3).text();
			var qty = td.eq(4).text();
			var remark = td.eq(5).text();
			var type = td.eq(6).text();
			var seq = td.eq(7).text();		
			
			$(opener.document).find("#seq").val(seq);
			$(opener.document).find("#stktypenm").val(type);
			
			if(indt != "-" && type != "C") {
				$(opener.document).find("#indt").val(indt);
				$(opener.document).find("#indt").removeAttr('disabled');
			}
			if(indt != "-" && type == "C") {
				$(opener.document).find("#outdt").val(outdt);		
				$(opener.document).find("#outdt").removeAttr('disabled');
			}
			
			$(opener.document).find("#qty").val(qty);
			$(opener.document).find("#remark").val(remark);
							
			$(opener.document).find("#qty").removeAttr('disabled');
			$(opener.document).find("#remark").removeAttr('disabled');
			$(opener.document).find("#seq").removeAttr('disabled');
			
			$(opener.document).find(".stock").css('display', 'none');
			$(opener.document).find("#up2").css('display', 'inline-block');
			window.close();
		} else return false;
	});

	$("#deleteAll").click(function() {
		var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";

		if (confirm(msg)) {
			var chkArray = new Array();
			$(".chk:checked").each(function() { //each = 향상된 for
				chkArray.push($(this).attr("data-uid"));
			});

			$.ajax({
				url : "${pageContext.request.contextPath}/stockDeleteAll",
				type : "POST",
				data : {
					chkArr : chkArray
				}, 
				success : function(resData) {
					if (resData == "success") {
						window.location.reload();
					} else
						alert("선택된 재고가 없습니다.");

				},
				error : function(request) {
					alert("message:" + request.responseText);
				}
			});
		}
	});
});

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