<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
    <style>
        tr:first-child {
            background-color: rgba(219, 228, 232, 0.8);
        }

        .tr-even:hover {
            border: 1px solid #d6dce7;
        }
    <%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
        <div class="page-wrap m-tb5">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t5 m-b5 m-l15">${boardTitle}</p>
                </div>
                <div class="search-wrap flex flex-justify">
                    <div class="">
                    	<c:choose>
	                    	<c:when test="${sessionScope.empname == boardMaker}">
		                    	<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
		                        <span class="btn-normal ">전체게시물 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<span class="btn-normal m-l15">전체게시물 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
	                    	</c:otherwise>
                    	</c:choose>                 	
                    </div>
                    <div class="">
                        <form method="post" action="${pageContext.request.contextPath}/SFA_notice_list" style="margin-right: 15px;">
                        	<input type="hidden" name="boardCode" value="${boardCode}" />
                            <select class="" name="searchOpt">                       	
                                <option value="subject">게시물제목</option>
                                <option value="writer">작성자</option>
                                <option value="all">제목+작성자</option>
                                
                            </select>
                            <input type="text" name="words" value="${words}" required />
                            <button type="submit" class="btn-off">게시글검색</button>
                            <button type="button" class="btn-on"
                                onClick="location.href='${pageContext.request.contextPath}/SFA_notice_insert?boardCode=${boardCode}'">게시글작성</button>
                        </form>
                    </div>
                </div>
                <div class="tbl-wrap m-t5 m-b5 m-lr15">
                    <table class="table center" style="table-layout: fixed;">
                        <tr class="weight700 center font14">
                            <td class="td-3">
                                <input type="checkbox" style="width: 20px; height: 20px;" onClick="chkAll();" id="chkAll" />
                            </td>
                            <td class=" td-5">번호</td>
                            <td class="td-5">분류</td>
                            <td>제목</td>
                            <td class="td-10">작성자</td>
                            <td class="td-7">조회수</td>
                            <td class="td-10">날짜</td>
                        </tr>
                        <c:if test="${count == 0}">
						<tr>
							<td class="weight700 center font14" colspan="7">등록된 게시글이 없습니다.</td>
						</tr>
						</c:if>
                        <c:forEach var="articleList" items="${list}" varStatus="status"> 
		                    <tr class="center font14">
								<td>
		                            <input type="checkbox" name="chk" class="chk" data-uid="${articleList.aid}" data-code="${boardCode}" style="width: 20px; height: 20px;"/>
		                        </td>		                            
		                        <td>${(count - status.index) - ((curPage - 1) * end)}</td>		                 
		                        <td>
			                        <c:if test = "${articleList.division eq 'Y'}">
			                        	<span style="color: #d92550" class="notice weight700">공지사항</span>
			                        </c:if>
			                        <c:if test = "${articleList.division eq 'N'}">
			                        	<span class="normal">일반</span>
			                        </c:if>
		                        </td>
		                        <td class="left p-lr10">
		                        <c:forEach begin="1" end="${articleList.re_level}">&nbsp;<img style="display: inline-block;" src="${pageContext.request.contextPath}/images/icon_reply.gif" />
		                        </c:forEach>
		                            <a href="${pageContext.request.contextPath}/SFA_notice_view?boardCode=${boardCode}&aid=${articleList.aid}" class="under weight700">${articleList.subject}</a>
		                            <span class="tomato">(${articleList.cnt})</span>
		                            <c:set var="fileName" value="${fn:toLowerCase(articleList.fileOriName)}" />
		                            <c:forTokens var="ext" items="${fileName}" delims="." varStatus="status">
										<c:if test="${status.last}">
											<c:choose>
												<c:when test="${ext eq 'xls' || ext eq 'xlsx' || ext eq 'ppt' || ext eq 'pptx' || ext eq 'hwp' || ext eq 'pdf'}">
													<i class="far fa-file-alt"></i>
												</c:when>
												
												<c:when test="${ext eq 'jpg' || ext eq 'png' || ext eq 'gif'}">
													<i class="far fa-file-image"></i>
												</c:when>
													
												<c:otherwise>
													<i class="fas fa-file"></i>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forTokens>
		                        </td>
		                        <td>${articleList.writer}</td>
		                        <td>${articleList.hit}</td>
		                        <td>${articleList.regdate}</td>
		                    </tr>
		                    </c:forEach>                                     
                    </table>
                </div>
                <c:if test="${count > 0}">
				<div class="page-grp center m-t5">
					<!-- 맨 앞으로 -->
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}&curPage=1&searchOpt=${searchOpt}&words=${words}"> <span class="page"> <i
									class="fas fa-angle-double-left"></i>
							</span>
							</a>
							<!-- 한칸 앞으로 -->
							<a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}&curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
							<a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}&curPage=${num}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									${num} </span>
							</a>
						</c:if>

					</c:forEach>
					<!-- 페이지 번호 출력 -->

					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}&curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
									<i class="fas fa-angle-right"></i>
							</span>
							</a>

							<a href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}&curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}"> <span class="page">
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
    $(function () {
        $("tr:nth-child(n)").addClass("tr-even");
        $("#deleteAll").click(function() {
            var str = confirm("선택하신 게시물을 삭제하시겠습니까?\n연결된 댓글 및 모든 데이터가 삭제 됩니다.");
            var boardCode = $(".chk").attr("data-code");
            if( str ) {
                var chkArr = new Array();
                var boardArr = new Array();
                $(".chk:checked").each(function () {
                	chkArr.push($(this).attr("data-uid"));
                });
                
                
                $.ajax({
                	type : "POST",
                	url : "${pageContext.request.contextPath}/SFA_notice_delete_all",
                	data : { 
                		chkArr : chkArr,
                		boardCode : boardCode
                	},
                	success: function (data) {
                		if( data == "success" ) {
                			alert('선택하신 게시물이 삭제 되었습니다.');
                            window.location.reload();
                            
                		}
                    },
                    error : function() {
                    	alert("선택하신 게시물 정보가 없습니다.");
                    }
                });
            }
        });
    });
    
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