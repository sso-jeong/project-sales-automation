<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.item-left {
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

.item-right {
	width: 86.7%;
	max-width: 1728px;
}

.item-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.item-list .tr-even:hover {
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
					<p class="noto font16 weight500 m-t5 m-b5 m-l15">품목관리 > 품목 등록</p>
				</div>
				<div class="item-insert m-b5 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/insert_item" autocomplete="off">
						<div class="member-info flex flex-justify">
							<div class="item-left">
								<div class="photo-area">
									<img id="img" name="img" src="${pageContext.request.contextPath}/images/noImage.jpg" alt="" />
								</div>
							</div>
							<div class="item-right">
								<table>
									<tr style="height: 50px;">
										<td class="td-7 under center bg-green weight700">품목코드</td>
										<td class="td-13 p-lr3">
											<input type="text" name="itemcd" id="itemcd" class="input-100 inputbg" readonly placeholder="품목코드는 자동 생성입니다.">
										</td>

										<td class="td-7 under center bg-green weight700">품목명</td>
										<td class="td-13 p-lr3">
											<input type="text" name="itemnm" id="itemnm" class="input-100" tabindex="1" autofocus required>
										</td>

										<td class="td-7 under center bg-green weight700">출고단가</td>
										<td class="td-13 p-lr3">
											<input type="number" name="price" id="price" class="input-100 price" tabindex="2" value=0>
										</td>

										<td class="td-7 under center bg-green weight700">규격</td>
										<td class="td-13 p-lr3">
											<input type="text" name="std" id="std" class="input-100" tabindex="3">
										</td>
									</tr>

									<tr style="height: 50px;">
										<td class="td-7 under center bg-green weight700">품목구분</td>
										<td class="td-13 p-lr3">
											<select tabindex="4" class="sel-100" name="itemdiv" id="divnm" required></select>
										</td>
										
										<td class="td-7 under center bg-green weight700">품목타입</td>
										<td class="td-13 p-lr3">
											<select tabindex="5" class="sel-100" name="itemgrp" id="grpnm" required></select>
										</td>

										

										<td class="td-7 under center bg-green weight700">비고</td>
										<td class="td-13 p-lr3" colspan="3">
											<input type="text" name="remark" id="remark" class="input-100" tabindex="6">
											<input type="text" name="insert_person" id="insert_person" value="${sessionScope.empname}" style="display: none;" />
											<input type="date" name="regdate" id="regdate" value="${sessionScope.nowdate}" style="display: none;" />
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
								<c:if test="${count eq 0}">
									<button type="reset" class="btn-on center m-t5 new" id="new1">초기화</button>
									<button type="submit" class="btn-on center m-t5 insert">신규등록</button>
								</c:if>
								<c:if test="${count ne 0}">
									<button type="reset" class="btn-on center m-t5 new" id="new2" >초기화</button>
									<button type="button" class="btn-on center m-t5 up" id="up">수정</button>
									<button type="submit" class="btn-on center m-t5 insert" id="insert" style="display:none;">신규등록</button>					
									<button type="button" class="btn-off center m-t5 del" id="del">삭제</button>
								</c:if>
								
							</div>
						</div>

					</form>
					<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">품목관리 > 품목 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
						<span class="btn-normal ">검색 된 품목수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>					
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_item_manage" style="margin: 0 15px;" autocomplete="off">
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
							<td class="td-3">
								<input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll"/>
							</td>
							<td class="td-5">순번</td>
							<td class="td-11">품목코드</td>
							<td class="td-20">품목명</td>
							<td class="td-7">품목구분</td>
							<td class="td-11">품목타입</td>						
							<td class="td-20">규격</td>
							<td class="td-7">출고단가(원)</td>
							<td >비고</td>
						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="9">등록된 품목이 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach items="${itemlist}" var="item" varStatus="status">
							<tr class="center font14">
								<td class="td-3">
								<input type="checkbox" name="chk" class="chk" data-uid="${item.itemcd}" style="width: 20px; height: 20px;" />
								</td>
								<td class="td-5">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td class="td-11">${item.itemcd}</td>
								<td class="left p-lr5">${item.itemnm}</td>
								<td class="td-7">${item.itemdivname}</td>
								<td class="td-11 left p-lr5">${item.itemgrpname}</td>								
								<td class="td-11 left p-lr5">${item.std}</td>
								<td class="td-7 right p-lr5">${item.price}</td>
								<td class="left p-lr5">${item.remark}</td>
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
		var flag;
		$("tr:nth-child(n)").addClass("tr-even");
		
		//구분코드, 타입코드
		load();
		item();
		
		var td2 = $(".item-list tr:eq(1)").children();
		var item_cd = td2.eq(2).text();	
		if(item_cd != "") getOneItem(item_cd); 

		//테이블 열 클릭시 품목코드 Search
		$(".item-list tr").click(function() {
	        var tr = $(this);
	        var td = tr.children();

	        var itemcd = td.eq(2).text();
	        if(itemcd != '품목코드' && itemcd != "") getOneItem(itemcd);
		});

		//수정버튼클릭시
		$('#up').click(function() {		
			var msg = $("#itemnm").val() + "의 정보 수정하시겠습니까?";
			
			if(confirm(msg)) {
				$.ajax({
					url: "${pageContext.request.contextPath}/updateItemInfo",
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
		});

		//삭제버튼클릭시
		$('#del').click(function(){
			var msg = $("#itemnm").val() + "의 정보를 삭제하시겠습니까?"

			if(confirm(msg)) {
				var formData = { itemcd : $('#itemcd').val()};
				
				$.ajax({
					url: "${pageContext.request.contextPath}/deleteItemInfo",
			        type: "post",
			        data: formData,
			        success : function(data) {
				        if(data == "success") {
					        //alert("성공");
					        window.location.reload();
				        }
				        else alert("삭제 오류!!!\n관리자에게 문의 하세요")
			        },
			        error: function(request) {
			            alert("message:"+request.responseText);
			        }
				});
			}
		});	

		//선택삭제
		$("#deleteAll").click(function() {
			var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";
			
	        if ( confirm(msg) ) {
		        var chkArray = new Array();
		        $(".chk:checked").each(function() { //each = 향상된 for
		        	chkArray.push( $(this).attr("data-uid") );
			    });

		        $.ajax({
	                url: "${pageContext.request.contextPath}/item_delete_all",
	                type: "POST",
	                data: {chkArr : chkArray}, //controller <- chkArr
	                success: function (resData) {
		                if(resData == "success"){
		                	window.location.reload();
			            }else alert("선택된 품목이없습니다.");
	                    
	                },
	                error: function (request) {
	                	alert("message:"+request.responseText);
	                },
	                complete: function () {
	                    
	                }
	            });
	        }
		});

		$('#picsave').click(function () {
	        var input = document.getElementById("file");
	        var fReader = new FileReader();
	        fReader.readAsDataURL(input.files[0]);
	        fReader.onloadend = function (event) {
	            var img = document.getElementById("img");
	            img.src = event.target.result;
	            img.height = 100;
	        }
	    });
	    
	});

	function getOneItem(itemcd) {
		var formData = {itemcd : itemcd};
		
		$.ajax({
	        url: "${pageContext.request.contextPath}/getOneItem",
	        type: "post",
	        data: formData,
	        dataType: "json", // 수신 데이터 타입
	        success: function(item) {
	        	$("#itemcd").val(item.itemcd);
	        	$("#itemnm").val(item.itemnm);
	        	$("#price").val(item.price);
	        	$("#std").val(item.std);
	        	$("#itemdiv").val(item.itemdiv);
	        	$("#itemgrp").val(item.itemgrp);
	        	$("#remark").val(item.remark);	        	     
	        },
	        error: function(request) {
	            alert("message:"+request.responseText);
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