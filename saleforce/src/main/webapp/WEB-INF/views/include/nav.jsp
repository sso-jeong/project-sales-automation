<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body onload="printClock()">
	<!-- model layer -->
	<!-- 바깥은 화면 전체 크기 -->
	<div class="modal-wrapper">
		<!-- 실제 모달 크기 -->
		<div class="modal">
			<div class="modal-title flex flex-justify">
				<h2 class="noto font16 m-b10">결재 양식 선택</h2>
				<h2 class="noto font16 m-b10">결재 라인 선택</h2>
			</div>
			<div class="modal-top flex flex-justify">
				<!--문서 폼 분류 -->
				<div class="" style="width: 250px; border: 1px solid #d6dce7;">
					<div class="form-list">
						<ul id="ztree" class="ztree"></ul>
					</div>
				</div>
				<!--문서 폼 -->
				<div class="" style="width: 900px; border: 1px solid #d6dce7; margin: 0 10px; padding: 30px;">
					<iframe width="100%" height="600px" id="formIframe" frameborder="0" name="formIframe" src="${pageContext.request.contextPath}/file/b_log.html" scrolling="auto"> </iframe>
				</div>
				<!--결재 라인 -->
				<div class="p10" style="width: 250px; border: 1px solid #d6dce7;">결재라인</div>
			</div>
			<div class="modal-bottom center m-t10">
				<button class="btn-on">문서선택</button>
				<button class="btn-off popup btn-close">선택취소</button>
			</div>
		</div>

	</div>
	<!-- model layer -->
	<header>
		<div class="top-wrap flex flex-justify headbar">
			<div class="logo-wrap" style="padding-top: 8px;">
				<h2>
					<a class="roboto font22 f6" href="${pageContext.request.contextPath}/SFA_main" title="HOME">SALE FORCE</a>
				</h2>
				<a class="roboto font20 f6" href="${pageContext.request.contextPath}/SFA_main" title="HOME">AUTOMATION</a>
			</div>
			<div class="menu-wrap ">
				<nav id="topMenu">
					<ul>
						<c:if test="${sessionScope.grade == '777'}">
						<li class="topMenuLi"><a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_notice_manage" title="관리자메뉴" alt="">관리자메뉴</a>
							<ul class="subMenu">
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_auth" title="권한관리" alt="">권한관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_notice_manage" title="게시판관리" alt="">게시판관리</a></li>
							</ul></li>
						</c:if>
						<li class="topMenuLi"><a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=any" title="시스템메뉴" alt="">시스템</a>
							<ul class="subMenu">
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_schedule" title="일정" alt="">일정관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=any" title="공지사항" alt="">전체 게시판</a></li>
								<c:if test="${sessionScope.deptid == '200' || sessionScope.deptid == '777'}">
									<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=human" title="인사">인사부 게시판</a></li>
								</c:if>
								<c:if test="${sessionScope.deptid == '100' || sessionScope.deptid == '777'}">
									<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_notice_list?boardCode=sale" title="영업">영업부 게시판</a></li>
								</c:if>															
							</ul></li>
						<li class="topMenuLi"><a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_approval_ready" title="결재관리" alt="">결재관리</a>
							<ul class="subMenu">
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_approval_sign" title="결재설정" alt="">결재설정</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_approval_file" title="결재양식" alt="">결재양식</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_approval_ready" title="대기문서" alt="">대기문서</a></li>


							</ul></li>
						<li class="topMenuLi"><a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_empList" title="인사/급여메뉴" alt="">인사/급여</a>
							<ul class="subMenu3">
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_wage" title="급여관리" alt="">급여관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_commute_manage" title="근태관리" alt="">근태관리</a></li>
								<li> <a class="submenuLink" href="${pageContext.request.contextPath}/SFA_empList" title="사원관리" alt="">사원관리</a></li>
							</ul></li>
						<li class="topMenuLi"><a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_item_manage" title="영업관리메뉴" alt="">영업관리</a>
							<ul class="subMenu">
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_stock_manage" title="재고관리" alt="">재고관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_sale_manage" title="판매관리" alt="">판매관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_order_manage" title="수주관리" alt="">수주관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_company_manage" title="거래처등록" alt="">거래처관리</a></li>
								<li><a class="submenuLink" href="${pageContext.request.contextPath}/SFA_item_manage" title="품목관리" alt="">품목관리</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
			<div class="menu-icon-wrap">
				<div class="icon font20 f6">
					<span class="sig_icon"> 
					<a href="#" title="approve" class="popup f6"> <i class="fas fa-file-signature"></i></a>
					</span>
					<c:if test="${sessionScope.grade == '777'}">
						<span class="admin-icon"> 
						<a href=" ${pageContext.request.contextPath}/SFA_admin" title="관리자모드" class="f6"><i class="fas fa-user-cog"></i></a>
						</span>
					</c:if>
					<span class="login_icon"> 
					<a href="${pageContext.request.contextPath}/logout" title="로그아웃" class="f6"><i class="fas fa-door-closed"></i></a>
					</span>
				</div>
			</div>
		</div>
	</header>