<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.company-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.company-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.modal-wrapper {
	background-color: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	visibility: hidden;
	opacity: 0;
}

.modal-wrapper.open {
	visibility: visible;
	opacity: 1;
	transition: 0.3s;
}

.modal-wrapper.open .modal {
	opacity: 1;
}

.modal {
	width: 1500px;
	height: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	opacity: 0;
	border-radius: 5px;
	padding: 20px;
	box-shadow: -60px 0 100px -90px #000, 60px 0px 100px -90px #000;
}
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb10">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">업체관리 > 업체 등록</p>
				</div>
				<div class="company-insert m-b15 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/SFA_company_manage" autocomplete="off">
						<table>
							<tr>
								<td class="td-7 under center bg-green weight700">거래처코드</td>
								<td class="td-13 p-lr3">
									<input type="text" name="comcd" id="comcd" class="input-100" disabled>
								</td>
								<td class="td-7 under center bg-green weight700">거래처명</td>
								<td class="td-13 p-lr3">
									<input type="text" name="comnm" id="comnm" class="input-100" tabindex="1" autofocus required>
								</td>
								<td class="td-7 under center bg-green weight700">대표자명</td>
								<td class="td-13 p-lr3">
									<input type="text" name="reprenm" id="reprenm" class="input-100" tabindex="2" required>
								</td>
								
								<td class="td-7 under center bg-green weight700">전화/FAX</td>
								<td class="td-13 p-lr3">
									<input type="tel" name="tel" id="tel" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="6"> 
									<input type="tel" name="fax" id="fax" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="7">
								</td>

								<td class="td-7 under center bg-green weight700">담당자/연락처</td>
								<td class="td-13 p-lr3">
									<input type="text" name="customer" id="customer" class="input-49" tabindex="9"> 
									<input type="tel" name="custtel" id="custtel" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="8">
								</td>			
							</tr>

							<tr>
								<td class="td-7 under center bg-green weight700">업태</td>
								<td class="td-13 p-lr3">
									<select class="sel-100" name="type" id="type" tabindex="3" required>
											<option>제조업</option>
											<option>운수업</option>
											<option>광업</option>
									</select>
								</td>
								<td class="td-7 under center bg-green weight700">종목</td>
								<td class="td-13 p-lr3">
									<select class="sel-100" name="dttype" id="dttype" tabindex="4" required>
											<option>제조</option>
											<option>도금</option>
											<option>기타</option>
									</select>
								</td>

								<td class="td-7 under center bg-green weight700">주소</td>
								<td class="td-13 p-lr3"><input type="text" name="addr" id="addr" class="input-100" tabindex="5" required></td>

								<td class="td-7 under center bg-green weight700">홈페이지</td>
								<td class="td-13 p-lr3"><input type="url" name="homepg" id="homepg" class="input-100" tabindex="9" required></td>

								<td class="td-7 under center bg-green weight700">비고</td>
								<td class="td-13 p-lr3"><input type="text" name="remark" id="remark" class="input-100" tabindex="10"></td>
							</tr>
						</table>
						<div class="flex flex-justify">
							<div></div>
							<div>
								<c:if test="${count eq 0}">
									<button type="reset" class="btn-on center m-t15 m-l5 new" id="new1">초기화</button>
									<button type="submit" class="btn-on center m-t15 m-l5 insert">신규등록</button>
								</c:if>
								<c:if test="${count ne 0}">
									<button type="reset" class="btn-on center m-t15 m-l5 new" id="new2" >초기화</button>
									<button type="button" class="btn-on center m-t15 m-l5 up" id="up">수정</button>
									<button type="submit" class="btn-on center m-t15 m-l5 insert" id="insert" style="display:none;">신규등록</button>					
									<button type="button" class="btn-off center m-t15 m-l5 del" id="del">삭제</button>
								</c:if>
							</div>
						</div>

					</form>
					<hr style="border: solid 1px #0C4A60; margin-top: 15px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">업체관리 > 업체 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<span class="btn-normal m-b15 m-lr15">전체 업체 수 10 / PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'comcd'}">selected</c:if> value="comcd">거래처코드</option>
								<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="comnm">거래처명</option>
								<option <c:if test="${searchOpt eq 'type'}">selected</c:if> value="type">업태</option>
								<option <c:if test="${searchOpt eq 'dttype'}">selected</c:if> value="dttype">종목</option>
								<option <c:if test="${searchOpt eq 'addr'}">selected</c:if> value="addr">주소</option>
							</select> <input type="text" name="words" tabindex="13" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="company-list m-b15 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" /></td>
							<td class="td-3">순번</td>
							<td class="td-5">거래처코드</td>
							<td class="td-13">거래처명</td>
							<td class="td-5">대표자명</td>
							<td class="td-5">업태</td>
							<td class="td-5">종목</td>
							<td class="td-10">전화/FAX</td>
							<td>주소</td>
							<td class="td-10">홈페이지</td>
							<td class="td-10">담당자/연락처</td>
							<td class="td-5">비고</td>
						</tr>

						<tr class="center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" /></td>
							<td class="td-3">10</td>
							<td class="td-5">4</td>
							<td class="left p-lr5">(재)부산테크노파크</td>
							<td class="td-7">박승완</td>
							<td class="td-7">제조업</td>
							<td class="td-7">제조</td>
							<td class="td-10">051-720-8926/720-8927</td>
							<td class="left p-lr5">부산광역시 기장군 일광면 횡계길 7 (해양생물산업육성센터)</td>
							<td class="left p-lr5">http://www.btp.or.kr</td>
							<td class="td-10">김승완/010-7789-4456</td>
							<td class="center p-lr5">-</td>
						</tr>
					</table>
				</div>
				<div class="page-grp center m-t15">
					<span class="page"> <a href=""><i class="fas fa-angle-double-left"></i></a>
					</span> <span class="page"> <a href=""><i class="fas fa-angle-left"></i></a>
					</span> <span class="page page-active"> <a href="" class="f6">1</a>
					</span> <span class="page"><a href="">2</a></span> <span class="page"><a href="">3</a></span> <span class="page"><a href="">4</a></span> <span class="page"><a href="">5</a></span> <span class="page">
						<a href=""><i class="fas fa-angle-right"></i></a>
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
	})
</script>

</html>