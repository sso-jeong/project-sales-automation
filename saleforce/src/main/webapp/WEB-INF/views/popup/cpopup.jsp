<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
.company-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.company-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="search-wrap flex flex-justify">
					<div class="m-tb15">						
						<span style="margin: 0 15px" class="btn-normal">검색 된 거래처 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap m-tb15">
						<form method="post" action="${pageContext.request.contextPath}/companyPopup" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'comcd'}">selected</c:if> value="comcd">거래처코드</option>
								<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="comnm">거래처명</option>
								<option <c:if test="${searchOpt eq 'typenm'}">selected</c:if> value="typenm">업태</option>
								<option <c:if test="${searchOpt eq 'dttypenm'}">selected</c:if> value="dttypenm">종목</option>
								<option <c:if test="${searchOpt eq 'addr'}">selected</c:if> value="addr">주소</option>
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="company-list m-b15 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">순번</td>
							<td class="td-5">코드</td>
							<td class="td-13">거래처명</td>
							<td class="td-5">대표자명</td>
							<td class="td-5">업태</td>
							<td class="td-5">종목</td>
							<td class="td-10">전화/FAX</td>
							<td>주소</td>
							<td style="display: none;">홈페이지</td>
							<td class="td-13">담당자/연락처</td>
							<td class="td-10" style="display: none;">비고</td>
						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="9">등록된 거래처가 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${companylist}" var="com" varStatus="status">
							<tr class="center font14">
								<td class="td-3">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td id="comcd" style="cursor: pointer; text-decoration: underline;" class="td-5">${com.comcd}</td>
								<td class="left p-lr5">${com.comnm}</td>
								<td class="td-7">${com.reprenm}</td>
								<td class="td-7">${com.typenm}</td>
								<td class="td-7">${com.dttypenm}</td>
								<td class="td-10">${com.tel}<c:if test="${com.fax ne ''}">/${com.fax}</c:if></td>
								<td class="left p-lr5">${com.addr}</td>
								<td class="left p-lr5" style="display: none;">${com.homepg}</td>
								<td class="td-10">${com.customer}<c:if test="${com.custtel ne ''}">/${com.custtel}</c:if></td>
								<td class="center p-lr5" style="display: none;">${com.remark}</td>
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
									<a href="${pageContext.request.contextPath}/companyPopup?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/companyPopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/companyPopup?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/companyPopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/companyPopup?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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
	$(".company-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "comcd"){
			var tr = $(this).parent();
			var td = tr.children();

			var comcd = td.eq(1).text();
			var comnm = td.eq(2).text();
			$(opener.document).find("#comcd").val(comcd);
			$(opener.document).find("#comnm").val(comnm);
			window.close();
		}else return false;



	});

</script>
</html>