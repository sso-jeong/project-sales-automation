<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.company-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.company-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb10">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">업체관리 > 업체 등록</p>
				</div>
				<div class="company-insert m-b5 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setCompany" autocomplete="off">
						<table>
							<tr>
								<td class="td-7 under center bg-green weight700">거래처코드</td>
								<td class="td-13 p-lr3">
									<input type="text" name="comcd" id="comcd" class="input-100" readonly>
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
									<input type="tel" name="tel" id="tel" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="6" required> 
									<input type="tel" name="fax" id="fax" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="7">
								</td>

								<td class="td-7 under center bg-green weight700">담당자/연락처</td>
								<td class="td-13 p-lr3">
									<input type="text" name="customer" id="customer" class="input-49" tabindex="8"> 
									<input type="tel" name="custtel" id="custtel" class="input-49" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-000(0)-0000" tabindex="9">
								</td>			
							</tr>

							<tr>
								<td class="td-7 under center bg-green weight700">업태</td>
								<td class="td-13 p-lr3">
									<select class="sel-100" name="type" id="typenm" tabindex="3" required>
									</select>
								</td>
								<td class="td-7 under center bg-green weight700">종목</td>
								<td class="td-13 p-lr3">
									<select class="sel-100" name="dttype" id="dttypenm" tabindex="4" required>
									</select>
								</td>

								<td class="td-7 under center bg-green weight700">주소</td>
								<td class="td-13 p-lr3">
									<input type="text" name="addr" id="addr" class="input-100" tabindex="5"  required>
								</td>

								<td class="td-7 under center bg-green weight700">홈페이지</td>
								<td class="td-13 p-lr3">
									<input type="url" name="homepg" id="homepg" class="input-100" placeholder="http://www.example.com" tabindex="10">
								</td>

								<td class="td-7 under center bg-green weight700">비고</td>
								<td class="td-13 p-lr3">
									<input type="text" name="remark" id="remark" class="input-100" tabindex="11">
									<input type="text" name="insert_person" id="insert_person" value="${sessionScope.empname}" style="display: none;" />
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
									<button type="reset" class="btn-on center m-t5 m-l5 new" id="new2" >초기화</button>
									<button type="button" class="btn-on center m-t5 m-l5 up" id="up">수정</button>
									<button type="submit" class="btn-on center m-t5 m-l5 insert" id="insert" style="display:none;">신규등록</button>					
									<button type="button" class="btn-off center m-t5 m-l5 del" id="del">삭제</button>
								</c:if>
							</div>
						</div>

					</form>
					<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-l15">업체관리 > 업체 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
						<span class="btn-normal">검색 된 업체수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_company_manage" style="margin: 0 15px;" autocomplete="off">
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

				<div class="company-list m-b5 m-lr15">
					<table class="list center" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll"/></td>
							<td class="td-3">순번</td>
							<td class="td-5">거래처코드</td>
							<td class="td-13">거래처명</td>
							<td class="td-5">대표자명</td>
							<td class="td-5">업태</td>
							<td class="td-5">종목</td>
							<td class="td-10">전화/FAX</td>
							<td>주소</td>
							<td class="td-15">홈페이지</td>
							<td class="td-8">담당자/연락처</td>
							<td class="td-10">비고</td>
						</tr>
						
						<c:if test="${count == 0}">
							<tr>
								<td class="weight700 center font14 " colspan="12">등록된 업체가 없습니다.</td>
							</tr>
						</c:if>
					
						<c:forEach items="${companylist}" var="com" varStatus="status">
							<tr class="center font14">
								<td class="td-3">
								<input type="checkbox" name="chk" class="chk" data-uid="${com.comcd}" style="width: 20px; height: 20px;" />
								</td>
								<td class="td-3">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td class="td-5">${com.comcd}</td>
								<td class="left p-lr5">${com.comnm}</td>
								<td class="td-7">${com.reprenm}</td>
								<td class="td-7">${com.typenm}</td>
								<td class="td-7">${com.dttypenm}</td>
								<td class="td-10">${com.tel}<c:if test="${com.fax ne ''}">/${com.fax}</c:if></td>
								<td class="left p-lr5">${com.addr}</td>
								<td class="left p-lr5">${com.homepg}</td>
								<td class="td-10">${com.customer}<c:if test="${com.custtel ne ''}">/${com.custtel}</c:if></td>
								<td class="center p-lr5">${com.remark}</td>
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
									<a href="${pageContext.request.contextPath}/SFA_company_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
									</span>
									</a>
									<!-- 한칸 앞으로 -->
									<a href="${pageContext.request.contextPath}/SFA_company_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
									<a href="${pageContext.request.contextPath}/SFA_company_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
									</a>
								</c:if>
					
							</c:forEach>
							<!-- 페이지 번호 출력 -->
					
							<c:choose>
								<c:when test="${curPage != totalPage}">
									<a href="${pageContext.request.contextPath}/SFA_company_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
									</span>
									</a>
					
									<a href="${pageContext.request.contextPath}/SFA_company_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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
		company();

		var td2 = $(".company-list tr:eq(1)").children();
		var company_cd = td2.eq(2).text();	
		if(company_cd != "") getOneCompany(company_cd); 

		//테이블 열 클릭시 업체코드 Search
		$(".company-list tr").click(function() {
	        var tr = $(this);
	        var td = tr.children();

	        var companycd = td.eq(2).text();
	        if(companycd != '거래처코드' && companycd != "") getOneCompany(companycd);
		});

		//수정버튼클릭시
		$('#up').click(function() {		
			var msg = $("#comnm").val() + "의 정보 수정하시겠습니까?";
			
			if(confirm(msg)) {
				$.ajax({
					url: "${pageContext.request.contextPath}/updateCompanyInfo",
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
			var msg = $("#comnm").val() + "의 정보를 삭제하시겠습니까?"

			if(confirm(msg)) {
				var formData = { comcd : $('#comcd').val()};
				
				$.ajax({
					url: "${pageContext.request.contextPath}/deleteCompanyInfo",
			        type: "post",
			        data: formData,
			        success : function(data) {
				        if(data == "success") {
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
	                url: "${pageContext.request.contextPath}/companyDeleteAll",
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
	});
	
	function getOneCompany(companycd) {
		var formData = {comcd : companycd};
		
		$.ajax({
	        url: "${pageContext.request.contextPath}/getOneCompany",
	        type: "post",
	        data: formData,
	        dataType: "json", // 수신 데이터 타입
	        success: function(com) {
	        	$("#comcd").val(com.comcd);
	        	$("#comnm").val(com.comnm);
	        	$("#reprenm").val(com.reprenm);
	        	$("#tel").val(com.tel);
	        	$("#fax").val(com.fax);
	        	$("#customer").val(com.customer);
	        	$("#custtel").val(com.custtel);
	        	
	        	$("#type").val(com.type);
	        	$("#dttype").val(com.dttype);
	        	$("#addr").val(com.addr);
	        	$("#homepg").val(com.homepg);
	        	$("#remark").val(com.remark);        	     
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