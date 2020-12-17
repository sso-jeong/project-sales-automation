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
                        <span class="btn-normal m-l15">전체게시물 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
                    </div>
                    <div class="">
                        <form method="post" action="${pageContext.request.contextPath}/SFA_notice_list" style="margin-right: 15px;">
                            <select class="" name="searchOpt">
                            	<option value="all">제목+작성자</option>
                                <option value="subject">게시물제목</option>
                                <option value="writer">작성자</option>
                                
                            </select>
                            <input type="text" name="words" value="${words}" required />
                            <button type="submit" class="btn-off">게시글검색</button>
                            <button type="button" class="btn-on"
                                onClick="location.href='${pageContext.request.contextPath}/notice/SFA_notice_insert?boardCode=${boardCode}'">게시글작성</button>
                        </form>
                    </div>
                </div>
                <div class="tbl-wrap m-t5 m-b5 m-lr15">
                    <table class="table center" style="table-layout: fixed;">
                        <tr class="weight700 center font14">
                            <td class="td-3">
                                <input type="checkbox" style="width: 20px;height: 20px;" />
                            </td>
                            <td class=" td-5">번호</td>
                            <td class="td-5">분류</td>
                            <td>제목</td>
                            <td class="td-10">작성자</td>
                            <td class="td-7">조회수</td>
                            <td class="td-10">날짜</td>
                            <td class="td-7">관리</td>
                        </tr>
                        <tr class="center font14">
                            <td class="td-3">
                                <input type="checkbox" style="width: 20px;height: 20px;" />
                            </td>
                            <td>10</td>
                            <td>공지</td>
                            <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                <a href="SFA_notice_view.html">
                                    <nobr>안녕하세요. SFA에서 공지를 알려드립니다.
                                    </nobr>
                                </a>
                            </td>
                            <td>관리자</td>
                            <td>3</td>
                            <td>2020.09.10</td>
                            <td>
                                <button type="button" class="s-btn-on"
                                    onClick="location.href='SFA_notice_modify.html?id=10'">수정</button>
                                <button type="button" class="s-btn-off">삭제</button>
                            </td>
                        </tr>                   
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
    })
</script>

</html>