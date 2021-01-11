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
.board-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.board-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="search-wrap flex flex-justify m-lr15 m-t10 m-b10">
						<div class="">							
							<span class="btn-normal">검색 게시판 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
						</div>
						<div class="form-wrap">
							<form method="post" action="${pageContext.request.contextPath}/boardPopup" autocomplete="off">
								<select class="" name="searchOpt">								
									<option <c:if test="${searchOpt eq 'ntgrpnm'}">selected</c:if> value="ntgrpnm">게시판그룹</option>
									<option <c:if test="${searchOpt eq 'boardCode'}">selected</c:if> value="boardCode">게시판코드</option>
								</select> 
								<input type="text" name="words" value="${words}" required />
								<button type="submit" class="btn-on">검색</button>
							</form>
						</div>
	</div>

		<div class="board-list m-b5 m-lr15">
			<table class="list center" style="table-layout: fixed;">
				<tr class="weight700 center font14">					
					<td class="td-5">순번</td>
					<td class="td-10">게시판그룹</td>
					<td class="td-13">게시판코드</td>
					<td>게사판제목</td>
					<td style="display:none;" class="td-10">읽기권한</td>
					<td style="display:none;" class="td-10">쓰기권한</td>
					<td style="display:none;" class="td-10">댓글권한</td>
					<td style="display:none;" class="td-10">다운권한</td>
					<td class="td-10">관리자</td>
				</tr>
				<c:if test="${count == 0}">
					<tr>
						<td class="weight700 center font14 " colspan="11">등록된 게시판이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${boardlist}" var="board" varStatus="status">
					<tr class="center font14">
						<td style="display: none;">${board.bid}</td>
						<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
						<td class="td-5">${board.ntgrpnm}</td>
						<td id="boardCode" class="td-7" style="cursor: pointer; text-decoration: underline;">${board.boardCode}</td>
						<td class="td-7 left p-lr5">${board.boardTitle}</td>
						
						<td class="" style="display:none;">
							<c:choose>
								<c:when test="${board.boardRead eq '100'}">인사</c:when>
								<c:when test="${board.boardRead eq '200'}">영업</c:when>
								<c:otherwise>전체</c:otherwise>
							</c:choose>								
						</td>
						<td class="td-7" style="display:none;">
							<c:choose>
								<c:when test="${board.boardWrite eq '100'}">인사</c:when>
								<c:when test="${board.boardWrite eq '200'}">영업</c:when>
								<c:otherwise>전체</c:otherwise>
							</c:choose>	
						</td>
						<td class="" style="display:none;">
							<c:choose>
								<c:when test="${board.boardReply eq '100'}">인사</c:when>
								<c:when test="${board.boardReply eq '200'}">영업</c:when>
								<c:otherwise>전체</c:otherwise>
							</c:choose>	
						</td>
						
						<td class="" style="display:none;">
							<c:choose>
								<c:when test="${board.boardDownload eq '100'}">인사</c:when>
								<c:when test="${board.boardDownload eq '200'}">영업</c:when>
								<c:otherwise>전체</c:otherwise>
							</c:choose>	
						</td>
						<td class="td-7 center p-lr5">${board.boardMaker}</td>
						<td style="display:none;">${board.boardRead}</td>
						<td style="display:none;">${board.boardWrite}</td>
						<td style="display:none;">${board.boardReply}</td>
						<td style="display:none;">${board.boardDownload}</td>
						
					</tr>
				</c:forEach>				
			</table>
		</div>
		<c:if test="${count > 0}">
			<div class="page-grp center m-t10">
				<!-- 맨 앞으로 -->
				<c:choose>
					<c:when test="${curPage > 1}">
						<a href="${pageContext.request.contextPath}/boardPopup?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
								class="fas fa-angle-double-left"></i>
						</span>
						</a>
						<!-- 한칸 앞으로 -->
						<a href="${pageContext.request.contextPath}/boardPopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
						<a href="${pageContext.request.contextPath}/boardPopup?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
								${num} </span>
						</a>
					</c:if>

				</c:forEach>
				<!-- 페이지 번호 출력 -->

				<c:choose>
					<c:when test="${curPage != totalPage}">
						<a href="${pageContext.request.contextPath}/boardPopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
								<i class="fas fa-angle-right"></i>
						</span>
						</a>

						<a href="${pageContext.request.contextPath}/boardPopup?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
	$(".board-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "boardCode"){
			var tr = $(this).parent();
			var td = tr.children();

			var boardCode = td.eq(3).text();
			var boardTitle = td.eq(4).text();
			var read = td.eq(10).text();
			var write = td.eq(11).text();
			var reply = td.eq(12).text();
			var down = td.eq(13).text();
		

			$(opener.document).find("#boardCode").val(boardCode);
			$(opener.document).find("#boardTitle").val(boardTitle);
			$(opener.document).find("#read").val(read);
			$(opener.document).find("#write").val(write);
			$(opener.document).find("#reply").val(reply);
			$(opener.document).find("#download").val(down);
			
			window.close();
		}else return false;

		
	});

</script>
</html>