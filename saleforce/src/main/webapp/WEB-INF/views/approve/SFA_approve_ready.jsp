<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
    <style>
        .arady-list tr:first-child {
            background-color: rgba(219, 228, 232, 0.8);
        }

        .arady-list .tr-even:hover {
            background-color: rgba(219, 228, 232, 0.8);
        }
        
                .tab_menu_btn {
            display: inline-block;
            width: 100px;
            height: 45px;
            text-align: center;
            line-height: 45px;
            background-color: #edeff5;
            border: 1px solid #d4d4d4;
            color: #000;
        }

        .tab_menu_btn.on {
            display: inline-block;
            width: 100px;
            height: 45px;
            text-align: center;
            line-height: 45px;
            background-color: rgba(219, 228, 232, 0.8);
            border: 1px solid transparent;
        }

        .tab_box {
            display: none;
        }

        .tab_box.on {
            display: block;
        }

<%@ include file="/WEB-INF/views/include/modal.jsp"%>
    </style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <main>
        <div class="page-wrap m-tb15">
            <div class="container">

                <div class="title">
                    <p class="noto font16 weight500 m-t15 m-b15 m-lr15">결재관리 > 결재대기문서</p>
                </div>

                <div class="search-wrap flex flex-justify m-lr15">
                    <div style="line-height: 35px;">
                    	<c:if test="${apprst eq 0 || sessionScope.empname}">
                    		<button type="button" class="btn-on m-b5" id="deleteAll">선택삭제</button>
                    	</c:if>              	
                        <button type="button" class="btn-off popup" style="width: 100px;">결재문서만들기</button>
                    </div>
                    <div class="form-wrap">
                        <form id="frm" method="post" action="${pageContext.request.contextPath}/SFA_approve_ready?apprst=0&empnm=${sessionScope.empname}" style="margin: 0 15px;" autocomplete="off">
                            <select class="" name="searchOpt">
								<option <c:if test="${searchOpt eq 'SUBSTR(a.regdate,1,10)'}">selected</c:if> value="SUBSTR(a.regdate,1,10)">기안일</option>
								<option <c:if test="${searchOpt eq 'c.docnm'}">selected</c:if> value="c.docnm">결재양식</option>				
							</select> 
							<input type="text" name="words" value="${words}" required />
							<button type="submit" class="btn-on">검색</button>
                        </form>
                    </div>
                </div>

                <div class="tab_wrap">
                	<c:if test='${sessionScope.empname eq empnm}'></c:if>
                    <div class="tab_menu_container m-t15 m-lr15">
                        <button class="tab_menu_btn2 tab_menu_btn float-l <c:if test='${apprst eq 0}'>on</c:if>" onclick="location.href='${pageContext.request.contextPath}/SFA_approve_ready?apprst=0&empnm=${sessionScope.empname}'" type="button">진행중</button>
                        <button class="tab_menu_btn3 tab_menu_btn float-l <c:if test='${apprst eq 1}'>on</c:if>" onclick="location.href='${pageContext.request.contextPath}/SFA_approve_ready?apprst=1&empnm=${sessionScope.empname}'" type="button">결재완료</button>
                    </div>
                    <div class="tab_box_container">
                        <div class="arady-list tab_box1 tab_box on m-lr15">
                            <table class="list center" style="table-layout: fixed;">
                                <tr class="weight700 center font14">
                                    <td class="td-3">
                                        <input type="checkbox" style="width: 20px;height: 20px;" onClick="chkAll();" id="chkAll" />
                                    </td>
                                    <td class="td-5">기안일</td>
                                    <td class="td-7">결재양식</td>
                                    <td class="td-7">긴급/일반</td>
                                    <td>문서제목</td>
                                    <td class="td-7">기안자</td>
                                </tr>
                                <c:if test="${count == 0}">
								<tr>
									<td class="weight700 center font14 " colspan="6">조회된 결재 건이 없습니다.</td>
								</tr>
								</c:if>
						
							<c:forEach items="${apprlist}" var="appr" varStatus="status">
								<tr style="cursor: pointer;" class="center font14">
									<td class="td-3">
									<input type="checkbox" name="chk" class="chk" data-uid="${appr.docnum}" style="width: 20px; height: 20px;" />
									</td>
									<td class="td-11">${appr.regdate}</td>
									<td class="center p-lr5">${appr.docnm}</td>
									<td class="td-7">
										<c:if test="${appr.docst == 'Y'}">긴급</c:if>
										<c:if test="${appr.docst == 'N'}">일반</c:if>
									</td>
									<td class="td-11 left p-lr5 subject">${appr.subject}</td>	
									<td class="td-11 center">${appr.empnm}</td>
									<td style="display:none;" >${appr.docnum}</td>		
									<td style="display:none;" >${appr.dttype}</td>				
								</tr>
							</c:forEach>
							                           
                            </table>
                        </div>
                        <div class="arady-list tab_box2 tab_box m-lr15">
                            <table class="list center" style="table-layout: fixed;">
                                <tr class="weight700 center font14">
                                    <td class="td-3">
                                        <input type="checkbox" style="width: 20px;height: 20px;" />
                                    </td>
                                    <td class="td-5">기안일</td>
                                    <td class="td-7">결재양식</td>
                                    <td class="td-7">긴급/일반</td>
                                    <td>문서제목</td>
                                    <td class="td-7">기안자</td>
                                </tr>
                                <c:if test="${count == 0}">
								<tr>
									<td class="weight700 center font14 " colspan="6">조회된 결재 건이 없습니다.</td>
								</tr>
								</c:if>
						
							<c:forEach items="${apprlist}" var="appr" varStatus="status">
								<tr style="cursor: pointer;" class="center font14">
									<td class="td-3">
									<input type="checkbox" name="chk" class="chk" data-uid="${appr.docnum}" style="width: 20px; height: 20px;" />
									</td>
									<td class="td-11">${appr.regdate}</td>
									<td class="center p-lr5">${appr.docnm}</td>
									<td class="td-7">
										<c:if test="${appr.docst == 'Y'}">긴급</c:if>
										<c:if test="${appr.docst == 'N'}">일반</c:if>
									</td>
									<td class="td-11 left p-lr5 subject">${appr.subject}</td>		
									<td class="td-11 center">${appr.empnm}</td>	
									<td style="display:none;" >${appr.docnum}</td>
									<td style="display:none;" >${appr.dttype}</td>												
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
							<a href="${pageContext.request.contextPath}/SFA_approve_ready?apprst=${apprst}&empnm=${sessionScope.empname}&curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/SFA_approve_ready?apprst=${apprst}&empnm=${sessionScope.empname}&curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
							<a href="${pageContext.request.contextPath}/SFA_approve_ready?apprst=${apprst}&empnm=${sessionScope.empname}&curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/SFA_approve_ready?apprst=${apprst}&empnm=${sessionScope.empname}&curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/SFA_approve_ready?apprst=${apprst}&empnm=${sessionScope.empname}&curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
            </div>
        </div>
    </main>

</body>
<script>
    $(function () {
        $("tr:nth-child(n)").addClass("tr-even");
		var empid = ${sessionScope.empid};
		
		$(".arady-list tr td").click(function() {
				var td = $(this);
				var input = td.children();

				var chk = input.attr('class');
			if(chk != "chk"){
				$(".arady-list tr").click(function() {
			        var tr = $(this);
			        var td = tr.children();
		
			        var docnum = td.eq(6).text();
			        var dttype = td.eq(7).text();
			        
			        if(docnum != "") getOneAppr(docnum,dttype);
				});
			}		
		});	
        
        $('.tab_menu_btn').on('click', function () {
            $('.tab_menu_btn').removeClass('on');
            $(this).addClass('on')
        });

        $('.tab_menu_btn2').on('click', function () {
            $('.tab_box').hide();
            $('.tab_box1').show();
            $('#frm').attr('action', '${pageContext.request.contextPath}/SFA_approve_ready?apprst=0&empid='+empid);
        });

        $('.tab_menu_btn3').on('click', function () {
            $('.tab_box').hide();
            $('.tab_box2').show();
            $('#frm').attr('action', '${pageContext.request.contextPath}/SFA_approve_ready?apprst=1&empid='+empid);
        });
		
        $("#deleteAll").click(function() {
			var msg = "대기중인 결제건을 삭제 하시겠습니까?";
			
	        if ( confirm(msg) ) {
		        var chkArray = new Array();
		        $(".chk:checked").each(function() { 
		        	chkArray.push( $(this).attr("data-uid") );
			    });

			    if(chkArray == ""){
					alert("선택된 결재건이 없습니다.");
					return false;
				}
			    
		        $.ajax({
	                url: "${pageContext.request.contextPath}/allAppr",
	                type: "POST",
	                data: {chkArr : chkArray, empid : empid}, 
	                success: function (resData) {
		                if(resData == "success"){
		                	window.location.reload();
			            }else if(resData == "neemp") {
							alert("기안자만 삭제 가능합니다.");
				        }
	                    
	                },
	                error: function (request) {
	                	alert("message:"+request.responseText);
	                }
	            });
	        }
		});	     
    });    

    function getOneAppr(docnum, dttype){
    	$('#menu-list').css('display','none');
    	$('.modal').css('width','920px');
    	$('.docform').css('margin-left','0px');
    	$('.appr-title').html("결재문서");    	   	
    	$(".modal-wrapper").addClass("open");	
    	if(dttype == "A"){   		
    		$('#formIframe').attr('src','${pageContext.request.contextPath}/b_logview?docnum='+docnum);
        }else {
        	$('#formIframe').attr('src','${pageContext.request.contextPath}/day_offview?docnum='+docnum);
        } 	
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