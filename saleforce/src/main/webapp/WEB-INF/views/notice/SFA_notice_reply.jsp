<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>  
<style>
	<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <main>
        <div class="page-wrap m-tb10">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t5 m-b5 m-l15">${boardTitle} 글 작성하기</p>
                </div>
                <div class="n-wrap board-insert m-b5 m-lr15">
                    <form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/SFA_notice_reply" enctype="multipart/form-data" autocomplete="off">
                    <input type="hidden" name="boardCode" value="${boardCode}" />  
                    <input type="hidden" name="aid" value="${replyArticle.aid}" />  
                        <table>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green">게시글 분류</td>
                                <td class="td-40 p-lr5" colspan="3">
                                    <select name="division" class="sel-100">
                                    	<option value="N">일반게시글</option>
                                        <option value="Y">공지사항</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green">게시글 제목</td>
                                <td colspan="3" class="td-90 p-lr5">
                                    <input type="text" name="subject" class="input-100" maxlength="100" required value="[답글] ${replyArticle.subject}"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green">작성자</td>
                                <td colspan="3" class="td-90 p-lr5">
                                    <input type="text" name="writer" class="input-100 bg-disable" maxlength="5" required value="${sessionScope.empname}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green" >게시글 내용</td>
                                <td colspan="3" class="td-90 p-lr5" style="padding-top:2px;padding-bottom:2px;">
                                    <textarea name="content" id="editor" style="border:1px solid #ccc;padding:10px;border-radius: 2px;" class="noto">${replyArticle.content} ㅡㅡ></textarea>
                                    <script>
                                        CKEDITOR.replace('editor');
                                        CKEDITOR.config.height = 300;
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 center weight700 noto under bg-green">첨부파일</td>
                                <td colspan="3" class="td-90 p-lr5">
                                    <input type="file" name="files" class="input-100" />
                                </td>
                            </tr>
                        </table>
                        <div class="btn-grp center m-t5">
                            <button type="submit" class="btn-normal">답글작성</button>
                            <button type="button" onClick="location.href='${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}'" class="btn-red">게시글목록</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </main>

</body>

</html>