<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
 .tna-list tr:first-child {
            background-color: rgba(219, 228, 232, 0.8);
        }

.tna-list .tr-even:hover {
            background-color: rgba(219, 228, 232, 0.8);
        }

 .tna-left {
            width: 100%;
        }

.tna-right {
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
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">근태관리 > 근태 등록</p>
				</div>
				<div class="tna-insert m-b15 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/SFA_commute_manage" autocomplete="off">
						<table>
                            <tr>
                                <td class="td-7 under center bg-green weight700">근태번호</td>
                                <td class="p-lr3">
                                    <input type="text" name="dlnum" id="dlnum" class="input-100 frist">
                                </td>
                                
                                <td class="td-7 under center bg-green weight700">근태유형</td>
                                <td class="p-lr3">
                                    <select class="sel-100 tna" name="dlnm" id="dlnm" tabindex="1" autofocus required>
                                    </select>
                                </td>

                                <td class="td-7 under center bg-green weight700">근태일자</td>
                                <td class="p-lr3">
                                    <input type="date" name="dldate" id="dldate" class="input-100" tabindex="2" required>
                                </td>
                                
                                <td class="td-7 under center bg-green weight700">시작/출근시간</td>
                                <td class="p-lr3">
                                    <input type="time" name="ontime" id="ontime" class="input-100" tabindex="3">

                                </td>
                                
                                 <td class="td-7 under center bg-green weight700">종료/퇴근시간</td>
                                <td class="p-lr3">
                                    <input type="time" name="offtime" id="offtime" class="input-100" tabindex="4">

                                </td>
                            </tr>

                            <tr>
                              <td class="td-7 under center bg-green weight700">사원번호</td>
                              <td class="td-13 p-lr3">
                                    <input type="text" name="empid" id="empid" class="input-100" readonly>
                              </td>
                                
                              <td class="td-7 under center bg-green weight700">사원명</td>
                              <td class="td-11 p-lr3">
                              	<input type="text" name="empnm" id="empnm" class="input-100" readonly>
                              </td>
                              
                              <td class="td-7 under center bg-green weight700">비고</td>
                              <td class="td-11 p-lr3" colspan="5">
                              	<input type="text" name="remark" id="remark" class="input-100" tabindex="5" readonly>
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
					<p class="noto font16 weight500 m-t15 m-b15 m-lr15">근태관리 > 근태 목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<button type="button" class="btn-on m-lr15 m-b15" id="deleteAll">선택삭제</button>
						<span class="btn-normal">검색 된 근태 정보 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
					</div>
					<div class="form-wrap">
						<form method="post" action="${pageContext.request.contextPath}/SFA_company_manage" style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'all'}">selected</c:if> value="all">전체검색</option>
								<option <c:if test="${searchOpt eq 'empnm'}">selected</c:if> value="empnm" >사원명</option>
								<option <c:if test="${searchOpt eq 'comcd'}">selected</c:if> value="dlnum">근태번호</option>
								<option <c:if test="${searchOpt eq 'comnm'}">selected</c:if> value="dldate">근태일자</option>
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>
					<div class="tna-list m-b15 m-lr15">
						<table class="list center" id="commuteList" style="table-layout: fixed;">
							<tr class="weight700 center font14">
								<td class="td-3"><input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll"/></td>
								<td class="td-5">순번</td>
	                            <td style="display: none;">근태번호</td>
								<td style="display: none;">부서코드</td>
	                            <td>부서명</td>
	                            <td>사번</td>
	                            <td>사원명</td>
	                            <td>근태일자</td>
	                            <td>출근시간</td>
	                            <td>퇴근시간</td>
	                            <td>총근무시간</td>
	                            <td>근태상세정보</td>
							</tr>
							
							<c:if test="${count == 0}">
								<tr>
									<td class="weight700 center font14 " colspan="10">등록된 근태 정보가 없습니다.</td>
								</tr>
							</c:if>
						
							<c:forEach items="${commuList}" var="commute" varStatus="status">
								<tr class="center font14">
									<td class="td-3">
									 <input type="checkbox" name="chk" class="chk" data-uid="${commute.dlnum}" style="width: 20px; height: 20px;" />
									</td>
									<td class="td-3">${ (count - status.index) - ( (curPage - 1) * end ) }</td>
									<td style="display: none;" class="dlnum">${commute.dlnum}</td>
									<td style="display: none;">${commute.deptid}</td>
									<td>${commute.buseoname}</td>
									<td>${commute.empid}</td>
									<td>${commute.empnm}</td>
									<td>${commute.dldate}</td>
									<td>${commute.ontime}</td>
									<td>${commute.offtime}</td>
									<td>${commute.tottime}</td>
									<td>
										<i class="fas fa-search-plus" id="popupBtn" onclick="openChild()"></i>
									</td>
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
										<a href="${pageContext.request.contextPath}/SFA_commute_manage?curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-left"></i>
										</span>
										</a>
										<!-- 한칸 앞으로 -->
										<a href="${pageContext.request.contextPath}/SFA_commute_manage?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-left"></i>
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
										<a href="${pageContext.request.contextPath}/SFA_commute_manage?curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> ${num} </span>
										</a>
									</c:if>
						
								</c:forEach>
								<!-- 페이지 번호 출력 -->
						
								<c:choose>
									<c:when test="${curPage != totalPage}">
										<a href="${pageContext.request.contextPath}/SFA_commute_manage?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-right"></i>
										</span>
										</a>
						
										<a href="${pageContext.request.contextPath}/SFA_commute_manage?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i class="fas fa-angle-double-right"></i>
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
	$(function(){
		tna();
		var tr = $("#commuteList tr:nth-child(2)");
		var td = tr.children();
		var dlnum = td.eq(2).text();
		//alert(dlnum);
		commuteLoad(dlnum);

		$("#commuteList tr").click(function() {
			var tr2 = $(this);
			var td2 = tr2.children();

			var dlnum = td2.eq(2).text();
			//alert(dlnum);
			commuteLoad(dlnum);

		});

		$('#up').click(function(){
		//alert("성공");
			var msg = $("#empnm").val() + "의 " + $("#dldate").val()+ "일자의 근태기록을 수정하시겠습니까?";
				
			if(confirm(msg)) {
				$.ajax({
					url: "${pageContext.request.contextPath}/setCommuteOthers",
				    type: "POST",
				    data: $('#frm').serialize(),
				    success : function(data) {
					       alert("수정되었습니다.");
					       window.location.reload();
				    },
				    error: function(request) {
				           alert("message:"+request.responseText);
				    },
				});
			}
		});
	});

	function commuteLoad(dlnum){
		//alert("성공");

		var formData = {
				dlnum : dlnum
			};

		$.ajax({
			url 	: "${pageContext.request.contextPath}/getCommuteListOne",
			type	: "POST",
			data	: formData,
			success	: function(commute){
						$('#dlnum').val(commute.dlnum);
						$('#empid').val(commute.empid);
						$('#empnm').val(commute.empnm);
						$('#dldate').val(commute.dldate);
						$('#dlnm').val(commute.dlgubun);
						$('#ontime').val(commute.ontime);
						$('#offtime').val(commute.offtime);
						$('#remark').val(commute.remark);
			},
			error : function(request) {
				alert("message:" + request.responseText + "\n");
			}
		});
		
	}

	function openChild(){
		var url = "${pageContext.request.contextPath}/companyPopup"; 

		window.open(url, "popup", "width=500, height=500");
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