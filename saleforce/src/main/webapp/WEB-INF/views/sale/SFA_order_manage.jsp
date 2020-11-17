<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.order-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.order-list .tr-even:hover {
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
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">수주관리 > 수주 등록</p>
				</div>
				<div class="order-insert m-b15 m-lr15">
					<form name="" method="post" action="${pageContext.request.contextPath}/setOrder" autocomplete="off">
						<table>
							<tr>
								<td class="td-7 under center bg-green weight700">수주번호</td>
								<td class="td-13 p-lr3">
									<input type="text" name="ordnum" id="ordnum" class="input-100" readonly>
								</td>

								<td class="td-7 under center bg-green weight700">품목코드/품목명</td>
								<td class="td-20 p-lr3">
									<input type="text" name="comcd" id="comcd" class="input-40" tabindex="1" autofocus required> 
									<input type="text" name="" id="comnm" class="input-58" tabindex="2" required>
								</td>


								<td class="td-7 under center bg-green weight700">수량/규격</td>
								<td class="td-13 p-lr3">
									<input type="number" name="qty" id="qty" tabindex="3" class="input-49" required> 
									<input type="text" name="" id="std" tabindex="4" class="input-49">
								</td>

								<td class="td-7 under center bg-green weight700">수주일자/납기일자</td>
								<td class="td-13 p-lr3">
									<input type="date" name="orddt" id="orddt" class="input-49" tabindex="5" required>
									<input type="date" name="dlvdt" id="dlvdt" class="input-49" tabindex="6" required>
								</td>
							</tr>

							<tr>
								<td class="td-7 under center bg-green weight700">프로젝트/담당자</td>
								<td class="td-13 p-lr3">
									<input type="text" name="projectnm" id="projectnm" style="width: 63%;" tabindex="7" required> 
									<input type="text" name="insert_person" id="insert_person" class="input-35" tabindex="8" required>
								</td>
								<td class="td-7 under center bg-green weight700">거래처코드/거래처명</td>
								<td class="td-13 p-lr3">
									<input type="text" name="comcd" id="comcd" class="input-40" tabindex="9" required> 
									<input type="text" name="comnm" id="comnm" class="input-58" tabindex="10" required>
								</td>
								<td class="td-7 under center bg-green weight700">단가/공급가액/부가세</td>
								<td class="td-20 p-lr3">
									<input type="number" name="price" id="price" class="input-35 unitprice" tabindex="11">
									<input type="number" name="" id="vos" class="input-35 provision" tabindex="12"> 
									<input type="number" name="" id="tax" class="input-27 surtax" readonly>
								</td>
								<td class="td-7 under center bg-green weight700">비고</td>
								<td class="td-13 p-lr3">
									<input type="text" name="remark" id="remark" class="input-100" tabindex="13">
								</td>

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
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">수주관리 > 수주 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<button type="button" class="btn-on m-lr15 m-b15" id="deleteAll">선택삭제</button>
						<span class="btn-normal">검색 된 수주 건 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_order_manage" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
								<option <c:if test="${searchOpt eq 'ordnum'}">selected</c:if> value="ordnum">수주번호</option>
								<option <c:if test="${searchOpt eq 'orddt'}">selected</c:if> value="orddt">수주일자</option>
								<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="comnm">업체명</option>
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
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" /></td>
							<td class="td-5">순번</td>
							<td class="td-5">수주번호</td>
							<td class="td-7">수주일자</td>
							<td class="td-13">거래처명</td>
							<td class="td-7">품목코드</td>
							<td>품목명</td>
							<td class="td-5">품목구분</td>
							<td class="td-7">담당자명</td>
							<td class="td-5">수량</td>
							<td class="td-7">단가</td>
							<td class="td-7">공급가액</td>
							<td class="td-7">부가세</td>
							<td class="td-5">비고</td>
						</tr>
						<tr class="center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" /></td>
							<td class="td-5">10</td>
							<td class="td-5">1031</td>
							<td class="td-7">2020.10.01</td>
							<td class="td-13 left p-lr5">(주)DPM</td>
							<td class="td-7">11030</td>
							<td class="left p-lr5">위치등 제어기</td>
							<td class="td-5">부품</td>
							<td class="td-7">수주담당자</td>
							<td class="td-5 right p-lr5">100</td>
							<td class="td-7 right p-lr5">1,000</td>
							<td class="td-7 right p-lr5">100,000</td>
							<td class="td-7 right p-lr5">10,000</td>
							<td class="td-13 center p-lr5">-</td>
						</tr>						

					</table>
				</div>
				<!--  페이징 ui -->
					<c:if test="${count > 0}">
						<div class="page-grp center m-t10">
							<!-- 맨 앞으로 -->
							<c:choose>
								<c:when test="${curPage > 1}">
									<a href="${pageContext.request.contextPath}/SFA_item_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/SFA_item_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/SFA_item_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/SFA_item_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/SFA_item_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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

		var date = new Date();
		var yyyy = date.getFullYear();
		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
		 
		$("#orddt").val(yyyy+"-"+mm+"-"+dd);	
	})
</script>

</html>