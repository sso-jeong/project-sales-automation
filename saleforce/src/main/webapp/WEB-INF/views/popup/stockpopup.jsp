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
		<div class="search-wrap flex flex-justify m-t10">
			<div class="">
				<span class="btn-normal m-b10 m-lr10">검색 된 품목 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
			</div>
			<div class="form-wrap">
				<form method="post" action="${pageContext.request.contextPath}/stockpopup" style="margin: 0 10px;" autocomplete="off">
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
		<div class="stock-list m-b10 m-lr10">
			<table class="list center" style="table-layout: fixed;">
				<tr class="weight700 center font14">

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
							<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td class="td-7">${stock.stktypenm}</td>
							<td>${stock.indt}</td>
							<td>${stock.outdt}</td>
							<td class="td-7 right p-lr5">${stock.cqty}</td>
							<td class="left p-lr5">${stock.remark}</td>
						</tr>
					</c:forEach>
				</c:if>
				
			</table>
		</div>
		<c:if test="${count > 0}">
			<div class="page-grp center m-t10">
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
</script>
</html>