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
				<form name="frm" method="post" autocomplete="off">
					<table>
						<tr>
							<td class="td-7 under center bg-green weight700">게시판그룹</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="ntgrpnm"></select>
							</td>
							<td class="td-7 under center bg-green weight700">게시판코드</td>
							<td class="td-15 p-lr3"><input type="text" class="input-100" placeholder="영어로 입력" /></td>
							<td class="td-7 under center bg-green weight700">게시판색상</td>
							<td class="td-15 p-lr3"><select class="sel-100">
									<option value="#ff0000">#ff0000</option>
									<option value="#0000ff">#0000ff</option>
							</select> <span class="color"></span></td>
							<td class="td-7 under center bg-green weight700">게시판 관리자</td>
							<td class="td-15 p-lr3"><input type="text" class="input-100" /></td>
						</tr>

						<tr>
							<td class="td-7 under center bg-green weight700">읽기권한</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="read"></select>
							</td>

							<td class="td-7 under center bg-green weight700">쓰기권한</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="write"></select>
							</td>
							<td class="td-7 under center bg-green weight700">댓글권한</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="comment"></select>
							</td>
							<td class="td-7 under center bg-green weight700">다운권한</td>
							<td class="td-15 p-lr3">
								<select class="sel-100" id="download"></select>
							</td>
						</tr>
					</table>
					<div class="flex flex-justify">
						<div>
							<button type="reset" class="btn-on center m-t5 new" style="display: none;">신규등록</button>
						</div>
						<div>
							<button type="submit" class="btn-on center m-t5 insert">등록</button>
							<button type="submit" class="btn-on center m-t5 up" style="display: none;">수정</button>
							<button type="reset" class="btn-off center m-t5 reset">리셋</button>
							<button type="submit" class="btn-off center m-t5 del" style="display: none;">삭제</button>
						</div>
					</div>

				</form>
				<hr style="border: solid 1px #0C4A60; margin-top: 10px;">
			</div>

			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">관리자메뉴 > 게시판 목록</p>
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
						<td class="td-10">관리</td>
					</tr>
					<tr class="center font14">
						<td><input type="checkbox" style="width: 20px; height: 20px;" /></td>
						<td>4</td>
						<td>테스트용</td>
						<td>n-0010</td>
						<td>#cccccc</td>
						<td><a href="SFA_notice.html" target="_blank" class="under">SFA 게시물 등록 테스트 중입니다.</a></td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td><span class="s-btn-on">수정</span> <span class="s-btn-off">삭제</span></td>
					</tr>					
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