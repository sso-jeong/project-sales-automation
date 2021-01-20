<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.board-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.board-list .tr-even:hover {
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
				<form id="frm" name="frm" method="post" autocomplete="off" action="${pageContext.request.contextPath}/setBoard">
					<table>
						<tr>
							<td class="td-7 under center bg-green weight700">게시판그룹</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="ntgrpnm" name="boardGrp" autofocus required></select>
							</td>
							<td class="td-7 under center bg-green weight700">게시판코드</td>
							<td colspan="3" class="td-15 p-lr3">
								<input type="text" id="boardCode" class="input-100" placeholder="영어로 입력" name="boardCode" required />
							</td>
							<td class="td-7 under center bg-green weight700">게시판 이름</td>
							<td colspan="3" class="td-15 p-lr3">
								<input id="boardTitle" name="boardTitle" type="text" class="input-100" required />
							</td>						
						</tr>

						<tr>
							<td class="td-7 under center bg-green weight700">게시판 관리자</td>
							<td class="td-15 p-lr3">
								<input id="boardMaker" name="boardMaker" type="text" class="input-100" value="${sessionScope.empname}" required />
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
								<select name="boardReply" class="sel-100" id="reply" required></select>
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
							<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
							<span class="btn-normal m-b5">검색 게시판 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
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

			<div class="board-list m-b5 m-lr15">
				<table class="list center" style="table-layout: fixed;">
					<tr class="weight700 center font14">
						<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>
						<td class="td-5">순번</td>
						<td class="td-5">게시판그룹</td>
						<td class="td-13">게시판코드</td>
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
						<tr class="center font14" style="cursor: pointer;">
							<td class="td-3"><input type="checkbox" name="chk" class="chk" data-uid="${board.boardCode}" style="width: 20px; height: 20px;" /></td>
							<td style="display: none;">${board.bid}</td>
							<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
							<td class="td-5">${board.ntgrpnm}</td>
							<td class="td-7">${board.boardCode}</td>
							<td class="td-7 left p-lr5">${board.boardTitle}</td>
							
							<td class="">
								<c:choose>
									<c:when test="${board.boardRead eq '100'}">인사</c:when>
									<c:when test="${board.boardRead eq '200'}">영업</c:when>
									<c:otherwise>전체</c:otherwise>
								</c:choose>								
							</td>
							<td class="td-7">
								<c:choose>
									<c:when test="${board.boardWrite eq '100'}">인사</c:when>
									<c:when test="${board.boardWrite eq '200'}">영업</c:when>
									<c:otherwise>전체</c:otherwise>
								</c:choose>	
							</td>
							<td class="">
								<c:choose>
									<c:when test="${board.boardReply eq '100'}">인사</c:when>
									<c:when test="${board.boardReply eq '200'}">영업</c:when>
									<c:otherwise>전체</c:otherwise>
								</c:choose>	
							</td>
							
							<td class="">
								<c:choose>
									<c:when test="${board.boardDownload eq '100'}">인사</c:when>
									<c:when test="${board.boardDownload eq '200'}">영업</c:when>
									<c:otherwise>전체</c:otherwise>
								</c:choose>	
							</td>
							<td class="td-7 left p-lr5">${board.boardMaker}</td>
							
						</tr>
					</c:forEach>				
				</table>
			</div>
			<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<!-- 맨 앞으로 -->
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/SFA_notice_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/SFA_notice_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
							<a href="${pageContext.request.contextPath}/SFA_notice_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/SFA_notice_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/SFA_notice_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
		</div>
	</div>
</main>

</body>
<script>
	$(function() {
		$("tr:nth-child(n)").addClass("tr-even");
		notice();

		var td2 = $(".board-list tr:eq(1)").children();
		var code = td2.eq(4).text();
		if (code != "")
			getBoardInfo(code);

		$(".board-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();

			var boardCode = td.eq(4).text();
			if (boardCode != '게시판색상' && boardCode != "")
				getBoardInfo(boardCode);
		});

		$("#boardCode").blur(function() {
			var formData = {
					boardCode : $('#boardCode').val()
			};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/boardCheck",
				type : "post",
				data : formData,
				success : function(data) {
					if (data == "fail") {
						alert("사용할수 없는 게시판 코드입니다.");
						$("#boardCode").val();
						$("#boardCode").focus();
					}
				},
				error : function(request) {
					alert("message:" + request.responseText);
				},
			});
		});

		$("#boardCode").keyup(function () {
			$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
		});

		$('#up').click(function() {
			var msg = "해당 게시판을 수정하시겠습니까?";

			if (confirm(msg)) {
				$.ajax({
					url : "${pageContext.request.contextPath}/updateBoard",
					type : "post",
					data : $('#frm').serialize(),
					success : function(data) {
						if (data == "success") {
							window.location.reload();
						} else
							alert("수정 오류!!\n관리자에게 문의 하세요");
					},
					error : function(request) {
						alert("message:" + request.responseText);
					},
				});
			}
		});

		$("#del").click(function(){
			var msg = "해당 게시판을 삭제하시겠습니까?"

				if (confirm(msg)) {
					var formData = {
							boardCode : $('#boardCode').val()
					};

					$.ajax({
						url : "${pageContext.request.contextPath}/deleteBoard",
						type : "post",
						data : formData,
						success : function(data) {
							if (data == "success") {
								//alert("성공");
								window.location.reload();
							} else
								alert("삭제 오류!!!\n관리자에게 문의 하세요")
						},
						error : function(request) {
							alert("message:" + request.responseText);
						}
					});
				}
		});

		$("#deleteAll").click(function() {
			var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";

			if (confirm(msg)) {
				var chkArray = new Array();
				$(".chk:checked").each(function() { //each = 향상된 for
					chkArray.push($(this).attr("data-uid"));
				});

				$.ajax({
					url : "${pageContext.request.contextPath}/deleteBoardAll",
					type : "POST",
					data : {
						chkArr : chkArray
					}, //controller <- chkArr
					success : function(resData) {
						if (resData == "success") {
							window.location.reload();
						} else
							alert("선택된 게시판이 없습니다.");

					},
					error : function(request) {
						alert("message:" + request.responseText);
					}
				});
			}
		});
		
	});

	function getBoardInfo(boardCode) {
		var formData = {
			boardCode : boardCode
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getBoardInfo",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(board) {
				$("#ntgrpnm").val(board.boardGrp);
				$("#boardCode").val(board.boardCode);
				$("#boardColor").val(board.boardColor);
				$("#boardMaker").val(board.boardMaker);
				$("#boardTitle").val(board.boardTitle);
				$("#read").val(board.boardRead);
				$("#write").val(board.boardWrite);
				$("#reply").val(board.boardReply);
				$("#download").val(board.boardDownload);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
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