<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.stockin-left {
	width: 13%;
	max-width: 250px;
}

.photo-area {
	width: 100%;
}

.photo-area img {
	width: 100%;
	height: 100px;
	display: inline-block;
	background-repeat: no-repeat; 
	background-size: cover; 
	background-position: center;
}

.stockin-right {
	width: 86.7%;
	max-width: 1728px;
}

.stock-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.stock-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}

.stock-left {
	width: 100%;
}

.stock-right {
	width: 34.5%;
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
				<p class="noto font16 weight500 m-t10 m-b10 m-lr10">재고관리 > 재고 등록</p>
			</div>
			<div class="stock-insert m-b10 m-lr10">
				<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setSale" autocomplete="off">
					<div class="member-info flex flex-justify">
						<div class="stockin-left">
							<div class="photo-area">
									<img id="img" name="img" src="${pageContext.request.contextPath}/images/noImage.jpg" alt="" />
								</div>
						</div>
						<div class="stockin-right">
							<table>
								<tr style="height: 50px;">
									<td class="td-7 under center bg-green weight700">품목코드</td>
									<td class="td-13 p-lr3"><input type="text" name="itemcd" id="itemcd" class="input-100" readonly></td>

									<td class="td-7 under center bg-green weight700">품목명</td>
									<td class="td-13 p-lr3"><input type="text" name="itemnm" id="itemnm" class="input-100" readonly required></td>

									<td class="td-7 under center bg-green weight700">입고일자</td>
									<td class="td-13 p-lr3"><input type="date" name="indt" id="indt" class="input-100 indt" disabled tabindex="1" ></td>

									<td class="td-7 under center bg-green weight700">출고일자</td>
									<td class="td-13 p-lr3"><input type="date" name="outdt" id="outdt" class="input-100 outdt" disabled tabindex="2"></td>

								</tr>

								<tr style="height: 50px;">
									<td class="td-7 under center bg-green weight700">유형</td>
									<td class="td-13 p-lr3">
									<select name="type" id="stktypenm" class="sel-100 type" tabindex="3" onchange="change()" required autofocus>
										<option value=""></option>
									</select>
									</td>

									<td class="td-7 under center bg-green weight700">규격</td>
									<td class="td-13 p-lr3"><input type="text" name="std" id="std" class="input-100" readonly></td>

									<td class="td-7 under center bg-green weight700">수량</td>
									<td class="td-13 p-lr3"><input type="number" name="qty" id="qty" class="input-100" tabindex="3"></td>



									<td class="td-7 under center bg-green weight700">비고</td>
									<td class="td-13 p-lr3" colspan="3">
										<input type="text" name="remark" id="remark" class="input-100" tabindex="4">
										<input type="text" name="insert_person" id="insert_person" value="${sessionScope.empname}" style="display: none;" />
									</td>
									
								</tr>
							</table>
						</div>
					</div>

					<div class="flex flex-justify">
						<div class="photo-btn center m-t15">
                                <input type="file" style="width: 150px;" class="file" id="file" />
                            	<button type="button" class="btn-on picsave" id="picsave">저장</button>
                            </div>
						<div>
							<c:if test="${count eq 0}">
								<button type="reset" class="btn-on center m-t15 m-l5 new" id="new1">초기화</button>
								<button type="submit" class="btn-on center m-t15 m-l5 insert">신규등록</button>
							</c:if>
							<c:if test="${count ne 0}">
								<button type="reset" class="btn-on center m-t15 m-l5 new" id="new2">초기화</button>
								<button type="button" class="btn-on center m-t15 m-l5 up" id="up">수정</button>
								<button type="submit" class="btn-on center m-t15 m-l5 insert" id="insert" style="display: none;">신규등록</button>
								<button type="button" class="btn-off center m-t15 m-l5 del" id="del">삭제</button>
							</c:if>
						</div>
					</div>

				</form>
				<hr style="border: solid 1px #0C4A60; margin-top: 10px;">
			</div>
				<div class="stock-left">
					<div class="title">
						<p class="noto font16 weight500 m-b10 m-lr10">재고관리 > 재고 목록</p>
					</div>
					<div class="search-wrap flex flex-justify">
						<div class="">
							<span class="btn-normal m-b10 m-lr10">검색 된 품목 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
						</div>
						<div class="form-wrap">
							<form method="post" action="${pageContext.request.contextPath}/SFA_stock_manage" style="margin: 0 10px;" autocomplete="off">
								<select class="" name="searchOpt">
									<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
									<option <c:if test="${searchOpt eq 's.itemcd'}">selected</c:if> value="s.itemcd">품목코드</option>
									<option <c:if test="${searchOpt eq 's.itemnm'}">selected</c:if> value="s.itemnm">품목명</option>
								</select> <input type="text" name="words" value="${words}" required />
								<button type="submit" class="btn-on">검색</button>
							</form>
						</div>
					</div>

					<div class="stock-list m-b10 m-lr10">
						<table class="list center" style="table-layout: fixed;">
								<tr class="weight700 center font14">
									<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" /></td>
									<td class="td-5">순번</td>
									<td>품목코드</td>
									<td>품목명</td>
									<td>규격</td>
									<td>잔량</td>
									<td class="td-7">재고상세정보</td>
	
								</tr>
							<c:if test="${(count == 0) or (count eq null)}">
								<tr>
									<td class="weight700 center font14 " colspan="7">등록된 품목건이 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${count > 0}">
								<c:forEach items="${stocklist}" var="stock" varStatus="status">
									<tr class="font14">
										<td class="td-3">
											<input type="checkbox" name="chk" class="chk" data-uid="${stock.itemcd}" style="width: 20px; height: 20px;" />
										</td>
										<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
										<td class="td-7">${stock.itemcd}</td>
										<td class="left p-lr5">${stock.itemnm}</td>
										<td class="td-5 left p-lr5">${stock.std}</td>
										<td class="td-7 right p-lr5">${stock.qty}</td>
										<td style="cursor: pointer;" onclick="popup()"><i class="fas fa-search-plus"></i></td>
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
									<a href="${pageContext.request.contextPath}/SFA_stock_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page">
											<i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/SFA_stock_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span
										class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/SFA_stock_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
											${num} </span>
									</a>
								</c:if>

							</c:forEach>
							<!-- 페이지 번호 출력 -->

							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/SFA_stock_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span
										class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>

									<a href="${pageContext.request.contextPath}/SFA_stock_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span
										class="page"> <i class="fas fa-angle-double-right"></i>
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
	</div>
</main>

</body>
<script>
	$(function() {
		$("tr:nth-child(n)").addClass("tr-even");
		stock();

		var date = new Date();
		var yyyy = date.getFullYear();
		var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
		var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
		$('.indt').val(yyyy+"-"+mm+"-"+dd);

		var td2 = $(".stock-list tr:eq(1)").children();
		var item_cd = td2.eq(2).text();
		if (item_cd != "")
			getOneStock(item_cd);

		$(".stock-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();
			var itemcd = td.eq(2).text();
			if (itemcd != '품목코드' && itemcd != "")
				getOneStock(itemcd);
		});
	})
	
	function getOneStock(itemcd) {
		var formData = {
				itemcd : itemcd
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/getOneStock",
			type : "post",
			data : formData,
			dataType : "json", // 수신 데이터 타입
			success : function(stock) {
				$("#itemcd").val(stock.itemcd);
				$("#itemnm").val(stock.itemnm);
				$("#indt").val('');
				$("#outdt").val('');
				$("#std").val(stock.std);
				$("#qty").val(stock.qty);	
				$("#stktypenm").val();
				$("#remark").val();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function popup() {
		var url = "${pageContext.request.contextPath}/stockpopup";
		var name = "재고 목록";

		
		window.open(url, name, "width=1200, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}
</script>

</html>