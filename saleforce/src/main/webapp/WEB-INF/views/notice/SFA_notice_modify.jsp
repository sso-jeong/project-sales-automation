<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
	<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
        <div class="page-wrap m-tb10">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t10 m-b10 m-lr10">${boardTitle} 수정하기</p>
                </div>
                <div class="n-wrap board-insert m-b10 m-lr10">
                    <form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/SFA_notice_modify" enctype="multipart/form-data" autocomplete="off">
                        <input type="hidden" name="aid" value="${modArticle.aid}" />
						<input type="hidden" name="boardCode" value="${boardCode}" />
                        <table>
                            <tr>
                            	<td class="td-10 center weight700 noto under bg-green">게시글 제목</td>
                                <td class="p-lr5">
                                    <input value="${modArticle.subject}" type="text" name="subject" class="input-100" maxlength="100" required />
                                </td>
                                <td class="td-10 center weight700 noto under bg-green">게시글 분류</td>
                                <td colspan="2" class="td-20 p-lr5">
                                    <select name="division" class="sel-100">
                                        <option value="Y" <c:if test="${modArticle.division eq 'Y'}">selected</c:if>>공지사항</option>
                                        <option value="N" <c:if test="${modArticle.division eq 'N'}">selected</c:if>>일반게시글</option>
                                    </select>
                                </td>
                       
                            </tr>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green">작성자</td>
                                <td class="p-lr5">
                                    <input type="text" name="writer" class="input-100 bg-disable" maxlength="5" required value="${sessionScope.empname}" readonly/>
                                </td>
                                <c:if test="${modArticle.fileOriName == null}">
	                                <td class="td-10 center weight700 noto under bg-green">첨부파일</td>
	                                <td colspan="2" class="td-15 p-lr5">
	                                    <input type="file" name="files" class="input-100" />
	                                </td>
                                </c:if>
                                <c:if test="${modArticle.fileOriName != null}">
                                	<td class="td-10 center weight700 noto under bg-green">첨부파일</td>
	                                <td class="td-15 p-lr5">
	                                    <input type="file" name="files" class="input-100" />
	                                </td>
		                            <td class="td-15 p-lr3 weight700">
										<span class="kr">기존 파일 : <a href="${pageContext.request.contextPath}/SFA_notice_download?aid=${modifyArticle.aid}&boardCode=${boardCode}">${modArticle.fileOriName}</a></span>
		                            </td>
                        		</c:if>
                            </tr>
                            
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green" >게시글 내용</td>
                                <td colspan="4" class="td-90 p-lr5" style="padding-top:2px;padding-bottom:2px;">
                                    <textarea name="content" id="editor" style="border:1px solid #ccc;padding:10px;border-radius: 2px;" class="noto">${modArticle.content}</textarea>
                                    <script>
                                        CKEDITOR.replace('editor');
                                        CKEDITOR.config.height = 300;
                                    </script>
                                </td>
                            </tr>
                        </table>
                        <div class="btn-grp center m-t10">
                            <button type="submit" class="btn-normal">게시글수정</button>
                            <button type="button" onClick="location.href='${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}'" class="btn-red">게시글목록</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </main>

</body>

</html>