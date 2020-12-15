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
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="page-wrap m-tb10">
		<div class="container">
			<div class="title">
				<p class="noto font16 weight500 m-t5 m-b5 m-l15">재고관리 > 재고 등록</p>
			</div>
			<div class="stock-insert m-b5 m-lr15">
				<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setStockDetail" autocomplete="off">
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
									<td class="td-13 p-lr3"><input type="text" name="itemnm" id="itemnm" class="input-100" disabled readonly required></td>

									<td class="td-7 under center bg-green weight700">입고일자</td>
									<td class="td-13 p-lr3"><input type="date" name="indt" id="indt" class="input-100 indt" disabled tabindex="2" ></td>

									<td class="td-7 under center bg-green weight700">출고일자</td>
									<td class="td-13 p-lr3"><input type="date" name="outdt" id="outdt" class="input-100 outdt" disabled tabindex="3"></td>

								</tr>

								<tr style="height: 50px;">
									<td class="td-7 under center bg-green weight700">유형</td>
									<td class="td-13 p-lr3">
									<select onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;' name="type" id="stktypenm" class="sel-100 type" tabindex="1" onchange="change()" disabled required autofocus>
										<option value=""></option>
									</select>
									</td>

									<td class="td-7 under center bg-green weight700">규격</td>
									<td class="td-13 p-lr3"><input type="text" name="std" id="std" class="input-100" disabled readonly></td>

									<td class="td-7 under center bg-green weight700">수량</td>
									<td class="td-13 p-lr3"><input type="number" name="qty" id="qty" class="input-100" disabled tabindex="4" required></td>



									<td class="td-7 under center bg-green weight700">비고</td>
									<td class="td-13 p-lr3" colspan="3">
										<input type="text" name="remark" id="remark" class="input-100" tabindex="5" disabled>
										<input type="text" name="insert_person" id="insert_person" value="${sessionScope.empname}" style="display: none;" />
										<input type="text" name="seq" id="seq" value=0 disabled style="display: none;" />
									</td>
									
								</tr>
							</table>
						</div>
					</div>

					<div class="flex flex-justify">
						<div class="photo-btn center m-t5">
                                <input type="file" style="width: 150px;" class="file" id="file" />
                            	<button type="button" class="btn-on picsave" id="picsave">저장</button>
                            </div>
						<div>
							<button type="button" class="btn-on center m-t5 stock">추가등록</button>
							<button type="submit" class="btn-on center m-t5 sinsert" style="display: none;">재고등록</button>
							<button type="button" class="btn-on center m-t5 up2" id="up2" style="display: none;">수정</button>
							<button type="button" class="btn-on center m-t5 del" id="del" style="display: none;">삭제</button>
							


						</div>
					</div>

				</form>
				<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
			</div>
				<div class="stock-left">
					<div class="title">
						<p class="noto font16 weight500 m-b5 m-l15">재고관리 > 재고 목록</p>
					</div>
					<div class="search-wrap flex flex-justify">
						<div class="">
							<span class="btn-normal m-b5 m-l15">검색 된 품목 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
						</div>
						<div class="form-wrap">
							<form method="post" action="${pageContext.request.contextPath}/SFA_stock_manage" style="margin: 0 15px;" autocomplete="off">
								<select class="" name="searchOpt">
									<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">ALL</option>
									<option <c:if test="${searchOpt eq 's.itemcd'}">selected</c:if> value="s.itemcd">품목코드</option>
									<option <c:if test="${searchOpt eq 's.itemnm'}">selected</c:if> value="s.itemnm">품목명</option>
								</select> <input type="text" name="words" value="${words}" required />
								<button type="submit" class="btn-on">검색</button>
							</form>
						</div>
					</div>

					<div class="stock-list m-b5 m-lr15">
						<table class="list center" style="table-layout: fixed;">
								<tr class="weight700 center font14">
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
										<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
										<td class="td-7">${stock.itemcd}</td>
										<td class="left p-lr5">${stock.itemnm}</td>
										<td class="td-5 left p-lr5">${stock.std}</td>
										<td class="td-7 right p-lr5">${stock.qty}</td>
										<td style="cursor: pointer;" onclick="popup('${stock.itemcd}')"><i class="fas fa-search-plus"></i></td>
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
		var item_cd = td2.eq(1).text();
		if (item_cd != "")
			getOneStock(item_cd);

		$(".stock-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();
			var itemcd = td.eq(1).text();
			if (itemcd != '품목코드' && itemcd != "")
				getOneStock(itemcd);
		});

		$(".stock").click(function() {
			able();
			$(".sinsert").css('display','inline-block');
			$("#qty").val(0);
			$(".stock").css('display', 'none');		
		});

		$(".sinsert").click(function() {
			$(".sinsert").css('display','none');
			$(".stock").css('display', 'inline-block');		
		});

		$("#up2").click(function() {
			updateStock(item, seq);
			$("stock").css('display', 'inline-block');
			$("#up2").css('display','none');
			$("#seq").attr('disabled','true');
		});

		$("#del").click(function() {		
			var msg = "해당 재고건을 삭제하시겠습니까?"

				if (confirm(msg)) {
					var formData = {
						itemcd : $('#itemcd').val(),
						seq : $('#seq').val()
					};

					$.ajax({
						url : "${pageContext.request.contextPath}/stockDelete",
						type : "POST",
						data : formData,
						success : function(data) {
							if (data == "success") {
								window.location.reload();
							} else
								alert("삭제 오류!!!\n관리자에게 문의 하세요")
						},
						error : function(request) {
							alert("message:" + request.responseText);
						}
					});
				}
				
			$("#del").attr('disabled','true');
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

	function popup(itemcd) {
		var formData = {
			itemcd : itemcd
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/carry",
			type : "post",
			data : formData,
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		
		
		var url = "${pageContext.request.contextPath}/stockpopup";
		var name = "재고 목록";

		
		window.open(url, name, "width=1200, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
	}

	function updateStock() {
		var msg = $("#itemnm").val() + "의 재고 정보를 수정하시겠습니까?";
		
		if(confirm(msg)) {
			$.ajax({
				url: "${pageContext.request.contextPath}/updateStock",
		        type: "post",
		        data: $('#frm').serialize(),
		        success : function(data) {
			        if(data == "success") {
				        window.location.reload();
			        }
			        else alert("수정 오류!!\n관리자에게 문의 하세요");
		        },
		        error: function(request) {
		            alert("message:"+request.responseText);
		        },
			});
		}
	}

	function able() {
		$("#itemcd").removeAttr('disabled');
		$("#itemnm").removeAttr('disabled');
		$("#indt").removeAttr('disabled');
		$("#outdt").removeAttr('disabled');
		$("#stktypenm").removeAttr('disabled');
		$("#std").removeAttr('disabled');
		$("#qty").removeAttr('disabled');
		$("#remark").removeAttr('disabled');
	}
</script>

</html>