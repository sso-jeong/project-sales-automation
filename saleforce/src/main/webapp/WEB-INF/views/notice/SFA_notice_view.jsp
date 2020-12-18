<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<c:if test="${(sessionScope.empid == null || sessionScope.deptid != boardRead) && boardRead != 300}">
	<script>
		alert("게시물 열람 권한이없습니다.\n관리자에게 문의하세요.");
		window.location.href = "${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}";
	</script>
</c:if>
<style>
	<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <main>
        <div class="page-wrap m-tb10">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t10 m-b10 m-lr10">${boardTitle} 상세보기</p>
                </div>
                <div class="n-wrap board-insert m-b5 m-lr15 font14">
                    <table>
                        <tr>                       	
                        	<td class="td-10 center weight700 noto under bg-green">게시글 제목</td>
                            <td colspan="3" class="center p-lr5">
                                <strong>${article.subject}</strong>
                                <input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" />
                            </td>
                            <td class="td-10 center weight700 noto under bg-green">게시글 분류</td>
                            <td class="td-15 p-lr3">
                            	<c:if test="${article.division == 'Y'}"><span class="noto weight500" style="color: #d92550;">공지사항</span></c:if>
                                 <c:if test="${article.division == 'N'}"><span class="noto weight500" style="color: #000000;">일반</span></c:if>
                            </td>                      
                        </tr>
                        
                        <tr>
                            <td class="td-10 center weight700 noto under bg-green">작성자</td>
                            <td class="center p-lr5">${article.writer}
                            </td>

                            <td class="td-10 center weight700 noto under bg-green">첨부파일</td>
                            <td class="center td-30 p-lr3">
                            <c:if test="${article.fileOriName eq ''}">
										<span>첨부파일이 없습니다.</span>
									</c:if>
									<c:if test="${article.fileOriName ne ''}">
									<!-- 파일다운로드권한설정 -->
									<c:choose>
										<c:when test="${sessionScope.empAuth < boardDownload}">
											<span>
												<a id="msg_pop">${article.fileOriName}</a>
											</span>
										</c:when>
										<c:otherwise>
										<span><a href="${pageContext.request.contextPath}/SFA_notice_download?boardCode=${boardCode}&aid=${article.aid}">${article.fileOriName}</a></span>
										</c:otherwise>
									</c:choose>
									</c:if>
							</td>

                            <td class="td-10 center weight700 noto under bg-green">게시물조회수</td>
                            <td class="td-10 center p-lr5">${article.hit}</td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under bg-green">게시글 내용</td>
                            <td colspan="5" class="td-90 left p-lr5"
                                style="padding-top:2px;padding-bottom:2px;height: 300px;">
                                <strong>
                                    ${article.content}
                                </strong>
                            </td>
                        </tr>
                        
                    </table>
                    <div class="btn-grp center m-t10 flex flex-justify">
                        <div class="btn-left">
                            <button type="button" onClick="location.href='${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}'"
                                class="btn-red">게시글목록</button>
                        </div>
                        <div class="btn-right">
                        	<c:if test="${sessionScope.empname == boardMaker}">
                        		<button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_reply'">게시글답글</button>
                        	</c:if>                          
                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_insert?boardCode=${boardCode}'">게시글작성</button>
                            <c:if test="${article.writer == sessionScope.empname}">
	                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_modify?boardCode=${boardCode}&aid=${article.aid}'">게시글수정</button>
	                            <button type="button" class="btn-off" id="delete">게시글삭제</button>
                            </c:if>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </main>

</body>

<script>
 $(function() {
	$("#delete").click(function() {
		  var msg = "해당 게시글을 삭제하시겠습니까?"

			if (confirm(msg)) {
				var formData = {
						boardCode : $('#boardCode').val(),
						aid : ${article.aid}
				};

				$.ajax({
					url : "${pageContext.request.contextPath}/SFA_notice_delete",
					type : "post",
					data : formData,
					success : function(data) {
						if (data == "succees") {
							window.location.href= "${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}";
						} else
							alert("삭제 오류!!!\n관리자에게 문의 하세요")
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
					}
				});
			}
		
	});
 });
</script>

</html>