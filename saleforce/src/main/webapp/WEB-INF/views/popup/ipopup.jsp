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
.item-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.item-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="search-wrap flex flex-justify">
					<div class="m-tb15">						
						<span style="margin: 0 15px" class="btn-normal">검색 된 품목 건 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap m-tb15">
						<form method="post" action="${pageContext.request.contextPath}/itemPopup" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">전체검색</option>
								<option <c:if test="${searchOpt eq 'itemcd'}">selected</c:if> value="itemcd">품목코드</option>
								<option <c:if test="${searchOpt eq 'itemnm'}">selected</c:if> value="itemnm">품목명</option>
								<option <c:if test="${searchOpt eq 'divnm'}">selected</c:if> value="divnm">품목구분</option>
								<option <c:if test="${searchOpt eq 'grpnm'}">selected</c:if> value="grpnm">품목타입</option>	
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="item-list m-b15 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-5">순번</td>
							<td class="td-11">품목코드</td>
							<td class="td-20">품목명</td>
							<td class="td-7">품목구분</td>
							<td class="td-11">품목타입</td>						
							<td class="td-20">규격</td>
							<td class="td-7">출고단가(원)</td>
							<td style="display: none;">비고</td>
							<td class="td-7">재고량</td>
						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="8">등록된 품목이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${itemlist}" var="item" varStatus="status">
							<tr class="center font14">
								<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td id="itemcd" style="cursor: pointer; text-decoration: underline;" class="td-11">${item.itemcd}</td>
								<td class="left p-lr5">${item.itemnm}</td>
								<td class="td-7">${item.itemdivname}</td>
								<td class="td-11 left p-lr5">${item.itemgrpname}</td>								
								<td class="td-11 left p-lr5">${item.std}</td>
								<td class="td-7 right p-lr5"><fmt:formatNumber value="${item.price}" pattern="#,###"/></td>
								<td style="display: none;" class="left p-lr5">${item.remark}</td>
								<td class="right p-lr5">${item.qty}</td>
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
									<a href="${pageContext.request.contextPath}/itemPopup?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/itemPopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/itemPopup?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/itemPopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/itemPopup?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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
	$("tr:nth-child(n)").addClass("tr-even");
	$(".item-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "itemcd"){
			var tr = $(this).parent();
			var td = tr.children();

			var itemcd = td.eq(1).text();
			var itemnm = td.eq(2).text();
			var std = td.eq(5).text();
			var uprice = td.eq(6).text();
			
			var rprice = uprice.split(",");
			var realprice ="";
			for(var i = 0; i < rprice.length; i++){
				realprice += rprice[i];
			}
			var qty = td.eq(8).text();

			$(opener.document).find("#itemcd").val(itemcd);
			$(opener.document).find("#itemnm").val(itemnm);
			$(opener.document).find("#std").val(std);
			$(opener.document).find("#uprice").val(realprice);
			$(opener.document).find("#janqty").val(qty);
			
			window.close();
		}else return false;

		
	});

</script>
</html>