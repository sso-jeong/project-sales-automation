<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<title>수주목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<style>
.order-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.order-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="search-wrap flex flex-justify">
					<div class="m-tb15">						
						<span style="margin: 0 15px" class="btn-normal">검색 된 수주 건 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap m-tb15">
						<form method="post" action="${pageContext.request.contextPath}/salePopup" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'ordnum'}">selected</c:if> value="ordnum">수주번호</option>
								<option <c:if test="${searchOpt eq 'orddt'}">selected</c:if> value="orddt">수주일자</option>
								<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="comnm">거래처명</option>
								<option <c:if test="${searchOpt eq 'itemnm'}">selected</c:if> value="itemnm">품목명</option>
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="order-list m-b15 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">순번</td>
							<td class="td-7">수주번호</td>
							<td class="td-7">수주일자</td>
							<td class="td-13">거래처명</td>
							<td class="td-7">품목코드</td>
							<td class="td-13">품목명</td>
							<td class="td-7">품목구분</td>
							<td class="td-7">담당자명</td>
							<td class="td-5">수량</td>
							<td class="td-7">공급가액</td>
							<td class="td-13">비고</td>
						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="11">등록된 수주 건이 없거나 판매가 완료되었습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${orderlist}" var="order" varStatus="status">
							<tr class="center font14">
								<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td id="ordnum" style="cursor: pointer; text-decoration: underline;" class="td-5">${order.ordnum}</td>
								<td class="td-7">${order.orddt}</td>
								<td style="display: none;" >${order.comcd}</td>
								<td class="td-13 left p-lr5">${order.comnm}</td>
								<td class="td-7">${order.itemcd}</td>
								<td class="left p-lr5">${order.itemnm}</td>
								<td class="td-5">${order.divnm}</td>
								<td class="td-7">${order.ordperson}</td>
								<td class="td-5 right p-lr5">${order.qty}</td>
								<td class="td-7 right p-lr5"><fmt:formatNumber value="${order.price}" pattern="#,###"/></td>
								<td class="td-13 center p-lr5">${order.remark}</td>
								<td style="display: none;">${order.std}</td>
							</tr>		
						</c:forEach>				

					</table>
				</div>
				<!--  페이징 ui -->
					<c:if test="${count > 0}">
						<div class="page-grp center m-t10">
							<!-- 맨 앞으로 -->
							<c:choose>
								<c:when test="${curPage > 1}">
									<a href="${pageContext.request.contextPath}/salePopup?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/salePopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/salePopup?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/salePopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/salePopup?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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
	$(".order-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "ordnum"){
			var tr = $(this).parent();
			var td = tr.children();
			
			var ordnum = td.eq(1).text();
			var comcd = td.eq(3).text();
			var comnm = td.eq(4).text();
			var itemcd = td.eq(5).text();
			var itemnm = td.eq(6).text();
			var qty = td.eq(9).text();
			
			var price = td.eq(10).text();
			
			var rprice = price.split(",");
			var realprice ="";
			for(var i = 0; i < rprice.length; i++){
				realprice += rprice[i];
			}	
			var std = td.eq(12).text();
			
			$(opener.document).find("#ordnum").val(ordnum);
			$(opener.document).find("#comcd").val(comcd);
			$(opener.document).find("#comnm").val(comnm);
			$(opener.document).find("#itemcd").val(itemcd);
			$(opener.document).find("#itemnm").val(itemnm);
			$(opener.document).find("#qty").val(qty);
			$(opener.document).find("#uprice").val(realprice/qty);
			$(opener.document).find("#price").val(realprice);
			$(opener.document).find("#tax").val(realprice / 10);
			$(opener.document).find("#std").val(std);

			$(opener.document).find("#qty").attr('readonly','true');
			$(opener.document).find("#qty").css('background-color', '#f3f4f4');

			window.close();
		}
		else return false;
	});

</script>
</html>