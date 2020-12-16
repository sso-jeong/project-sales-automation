<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.company-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.company-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="page-wrap m-tb5">
		<div class="container">
			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">관리자메뉴 > 게시판 관리</p>
			</div>
			<div class="notice-manage m-b5 m-lr15">
				<form name="frm" method="post" autocomplete="off" action="${pageContext.request.contextPath}/setBoard">
					<table>
						<tr>
							<td class="td-7 under center bg-green weight700">게시판그룹</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="ntgrpnm" name="boardGrp" autofocus required></select>
							</td>
							<td class="td-7 under center bg-green weight700">게시판코드</td>
							<td colspan="3" class="td-15 p-lr3"><input type="text" class="input-100" placeholder="영어로 입력" name="boardCode" required /></td>
							<td class="td-7 under center bg-green weight700">게시판색상</td>
							<td class="td-15 p-lr3"><select name="boardColor" class="sel-100" required>
									<option value="#ff0000">#ff0000</option>
									<option value="#0000ff">#0000ff</option>
							</select> <span class="color"></span></td>
							<td class="td-7 under center bg-green weight700">게시판 관리자</td>
							<td class="td-15 p-lr3"><input name="boardMaker" type="text" class="input-100" value="${sessionScope.empname}" required /></td>
						</tr>

						<tr>
							<td class="td-7 under center bg-green weight700">게시판 이름</td>
							<td class="td-15 p-lr3">
								<input name="boardTitle" type="text" class="input-100" required />
							</td>

							<td class="td-7 under center bg-green weight700">읽기권한</td>
							<td class="td-10 p-lr3">
								<select name="boardRead" class="sel-100" id="read" required></select>
							</td>

							<td class="td-7 under center bg-green weight700">쓰기권한</td>
							<td class="td-10 p-lr3">
								<select name="boardWrite" class="sel-100" id="write" required></select>
							</td>
							<td class="td-7 under center bg-green weight700">댓글권한</td>
							<td class="td-10 p-lr3">
								<select name="boardReply" class="sel-100" id="comment" required></select>
							</td>
							<td class="td-7 under center bg-green weight700">다운권한</td>
							<td class="td-10 p-lr3">
								<select name="boardDownload" class="sel-100" id="download" required></select>
							</td>
						</tr>
					</table>
					<div class="flex flex-justify">
						<div></div>
						<div>
							<c:if test="${count eq 0}">
								<button type="reset" class="btn-on center m-t5 new" id="new1">초기화</button>
								<button type="submit" class="btn-on center m-t5 insert">신규등록</button>
							</c:if>
							<c:if test="${count ne 0}">
								<button type="reset" class="btn-on center m-t5 new" id="new2">초기화</button>
								<button type="button" class="btn-on center m-t5 up" id="up">수정</button>
								<button type="submit" class="btn-on center m-t5 insert" id="insert" style="display: none;">신규등록</button>
								<button type="button" class="btn-off center m-t5 del" id="del">삭제</button>
							</c:if>
						</div>
					</div>

				</form>
				<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
			</div>

			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">관리자메뉴 > 게시판 목록</p>
			</div>
			
			<div class="search-wrap flex flex-justify">
						<div class="">
							<span class="btn-normal m-b5 m-l15">검색 된 품목 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
						</div>
						<div class="form-wrap">
							<form method="post" action="${pageContext.request.contextPath}/SFA_notice_manage" style="margin: 0 15px;" autocomplete="off">
								<select class="" name="searchOpt">								
									<option <c:if test="${searchOpt eq 'ntgrpnm'}">selected</c:if> value="ntgrpnm">게시판그룹</option>
									<option <c:if test="${searchOpt eq 'boardCode'}">selected</c:if> value="boardCode">게시판코드</option>
								</select> 
								<input type="text" name="words" value="${words}" required />
								<button type="submit" class="btn-on">검색</button>
							</form>
						</div>
					</div>

			<div class="company-list m-b5 m-lr15">
				<table class="list center" style="table-layout: fixed;">
					<tr class="weight700 center font14">
						<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" /></td>
						<td class="td-5">순번</td>
						<td class="td-5">게시판그룹</td>
						<td class="td-13">게시판코드</td>
						<td class="td-5">게시판색상</td>
						<td>게사판제목</td>
						<td class="td-10">읽기권한</td>
						<td class="td-10">쓰기권한</td>
						<td class="td-10">댓글권한</td>
						<td class="td-10">다운권한</td>
						<td class="td-10">관리자</td>
					</tr>
					<c:if test="${count == 0}">
						<tr>
							<td class="weight700 center font14 " colspan="11">등록된 게시판이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${boardlist}" var="board" varStatus="status">
						<tr class="center font14">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${board.bid}" style="width: 20px; height: 20px;" /></td>
							<td style="display: none;">${board.bid}</td>
							<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td class="td-5">${board.ntgrpnm}</td>
							<td class="td-7">${board.boardCode}</td>
							<td class="">${board.boardColor}</td>
							<td class="td-7 left p-lr5">${board.boardTitle}</td>
							<td class="">${board.boardRead}</td>
							<td class="td-7">${board.boardWrite}</td>
							<td class="">${board.boardReply}</td>
							<td class="">${board.boardDownload}</td>
							<td class="td-7 left p-lr5">${board.boardMaker}</td>
							
						</tr>
					</c:forEach>				
				</table>
			</div>
			<div class="page-grp center m-t10">
				<span class="page"> <a href=""><i class="fas fa-angle-double-left"></i></a>
				</span> <span class="page"> <a href=""><i class="fas fa-angle-left"></i></a>
				</span> <span class="page page-active"> <a href="" class="f6">1</a>
				</span> <span class="page"><a href="">2</a></span> <span class="page"><a href="">3</a></span> <span class="page"><a href="">4</a></span> <span
					class="page"><a href="">5</a></span> <span class="page"> <a href=""><i class="fas fa-angle-right"></i></a>
				</span> <span class="page"> <a href=""><i class="fas fa-angle-double-right"></i></a>
				</span>
			</div>
		</div>
	</div>
</main>

</body>
<script>
	$(function() {
		$("tr:nth-child(n)").addClass("tr-even");
		notice();
	})
</script>

</html>