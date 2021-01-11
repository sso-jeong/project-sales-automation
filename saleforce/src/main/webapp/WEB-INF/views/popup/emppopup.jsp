<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<style>
.emp-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}

.emp-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
</style>
<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="search-wrap flex flex-justify">
		<div class="">
			<span class="btn-normal m-lr15 m-tb15 ">검색 된 연락처 수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>
		</div>
		<div class="form-wrap m-tb15">
			<form method="post" action="${pageContext.request.contextPath}/empPopup" style="margin: 0 15px;" autocomplete="off">
				<select class="" name="searchOpt">
					<option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
					<option value="empnm" <c:if test="${searchOpt eq 'empnm'}">selected</c:if>>사원명</option>
					<option value="buseo_name" <c:if test="${searchOpt eq 'buseo_name'}">selected</c:if>>부서명</option>
					<option value="grade_name" <c:if test="${searchOpt eq 'grade_name'}">selected</c:if>>직급</option>
				</select> 
				<input type="text" name="words" value="${words}" required />
				<button type="submit" class="btn-on">검색</button>
			</form>
		</div>
	</div>

	<div class="emp-list m-b15 m-lr15">
		<table class="list center empList" id="empList" style="table-layout: fixed;">
			<tr class="weight700 center font14">
				<td class="td-3">순번</td>
				<td class="td-7" style="display: none;">부서코드</td>
				<td class="td-7">부서명</td>
				<td class="td-7" style="display: none;">직급코드</td>
				<td class="td-7">직급</td>
				<td class="td-5">사번</td>
				<td class="td-5">사원명</td>
				<td class="td-7">H.P</td>
				<td class="td-7">C.P</td>
				<td class="td-7">E-mail</td>
			</tr>

			<c:if test="${count == 0}">
				<tr>
					<td colspan="10" class="center font14">등록된 사원이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${contactList}" var="emp" varStatus="status">
				<tr>			
					<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
					<td style="display: none;">${emp.deptid}</td>
					<td>${emp.buseoname}</td>
					<td style="display: none;">${emp.grade}</td>
					<td>${emp.gradename}</td>
					<td>${emp.empid}</td>
					<td id="empname" style="cursor: pointer; text-decoration: underline;">${emp.empnm}</td>
					<td>${emp.emphp}</td>
					<td>${emp.empcp}</td>
					<td>${emp.email}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이징 ui 시작 -->
	<c:if test="${count > 0}">
		<div class="page-grp center m-t15">

			<!-- 맨 앞으로 --->
			<c:choose>
				<c:when test="${curPage > 1}">
					<a href="${pageContext.request.contextPath}/empPopup?curPage=1&searchOpt=${searchOpt}&words${words}"> <span class="page"> <i
							class="fas fa-angle-double-left"></i>
					</span>
					</a>
				</c:when>
				<c:otherwise>
					<span class="page"> <i class="fas fa-angle-double-left"></i></a>
					</span>
				</c:otherwise>
			</c:choose>
			<!-- 맨 앞으로 -->

			<!-- 한 칸 앞으로 -->
			<c:choose>
				<c:when test="${curPage > 1}">
					<a href="${pageContext.request.contextPath}/empPopup?curPage=${curPage-1}&searchOpt=${searchOpt}&words${words}"> <span class="page">
							<i class="fas fa-angle-left"></i>
					</span>
					</a>
				</c:when>
				<c:otherwise>
					<span class="page"> <i class="fas fa-angle-left"></i></a>
					</span>
				</c:otherwise>
			</c:choose>
			<!-- 한 칸 앞으로 -->

			<!-- 페이지 번호 출력 -->
			<c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">

				<c:if test="${selected == num}">
					<span class="page page-active"> <a href="#" class="f6">${num}</a>
					</span>
				</c:if>

				<c:if test="${selected != num}">
					<a href="${pageContext.request.contextPath}/empPopup?curPage=${num}&searchOpt=${searchOpt}&words${words}"> <span class="page">${num}</span>
					</a>
				</c:if>

			</c:forEach>
			<!-- 페이지 번호 출력 끝 -->

			<!-- 한 칸 뒤로 -->
			<c:choose>
				<c:when test="${curPage != totalPage}">
					<a href="${pageContext.request.contextPath}/empPopup?curPage=${curPage+1}&searchOpt=${searchOpt}&words${words}"> <span class="page">
							<i class="fas fa-angle-right"></i>
					</span>
					</a>
				</c:when>
				<c:otherwise>
					<span class="page"> <i class="fas fa-angle-right"></i></a>
					</span>
				</c:otherwise>
			</c:choose>
			<!-- 한 칸 뒤로 -->

			<!-- 한 칸 뒤로 -->
			<c:choose>
				<c:when test="${curPage != totalPage}">
					<a href="${pageContext.request.contextPath}/empPopup?curPage=${totalPage}&searchOpt=${searchOpt}&words${words}"> <span class="page">
							<i class="fas fa-angle-double-right"></i>
					</span>
					</a>
				</c:when>
				<c:otherwise>
					<span class="page"> <i class="fas fa-angle-double-right"></i></a>
					</span>
				</c:otherwise>
			</c:choose>
			<!-- 한 칸 뒤로 -->
		</div>
	</c:if>
	<!-- 페이징 ui 끝 -->
</body>
<script>
	$(".emp-list tr td").click(function() {
		var tdid = $(this).attr("id");
		if(tdid == "empname"){
			var tr = $(this).parent();
			var td = tr.children();


			var deptid = td.eq(1).text();		
			var grade = td.eq(3).text();
			var empid = td.eq(5).text();
			var empnm = td.eq(6).text();

			$(opener.document).find("#dept").val(deptid);
			$(opener.document).find("#deptid").val(deptid);
			$(opener.document).find("#grade").val(grade);			
			$(opener.document).find("#empid").val(empid);
			$(opener.document).find("#empnm").val(empnm);
			
			window.close();
		}else return false;
	});
</script>
</html>