<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<header>
        <div class="top-wrap flex flex-justify">
            <div class="logo-wrap" style="padding-top: 8px;">
                <h2><a class="roboto font22 f6" href="${pageContext.request.contextPath}/SFA_main" title="HOME">SALE FORCE</a></h2>
                <a class="roboto font20 f6" href="${pageContext.request.contextPath}/SFA_main" title="HOME">AUTOMATION</a>
            </div>
            <div class="menu-wrap ">
                <nav id="topMenu">
                    <ul>
                    	<c:if test="${sessionScope.grade == '7'}">
                    	<li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_admin" title="관리자메뉴"
                                alt="">관리자메뉴</a>
                            <ul class="subMenu">
                                <li> <a class="submenuLink" href="${pageContext.request.contextPath}/SFA_auth" title="권한관리" alt="">권한관리</a></li>
                                <li> <a class="submenuLink" href="sfa_notice_manage.html" title="게시판관리" alt="">게시판관리</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                        <li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="sfa_notice.html" title="시스템메뉴"
                                alt="">시스템</a>
                            <ul class="subMenu">
                                <li> <a class="submenuLink" href="sfa_schedule.html" title="일정" alt="">일정관리</a></li>
                                <li> <a class="submenuLink" href="sfa_notice.html" title="공지사항" alt="">공지사항</a></li>
                            </ul>
                        </li>
                        <li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="SFA_approval_ready.html" title="결재관리"
                                alt="">결재관리</a>
                            <ul class="subMenu">
                                <li> <a class="submenuLink" href="SFA_approval_sign.html" title="결재설정" alt="">결재설정</a>
                                </li>
                                <li> <a class="submenuLink" href="SFA_approval_file.html" title="결재양식" alt="">결재양식</a>
                                </li>
                                <li> <a class="submenuLink" href="SFA_approval_ready.html" title="대기문서" alt="">대기문서</a>
                                </li>


                            </ul>
                        </li> 
                        
                        <c:choose>
                    	<c:when test="${sessionScope.grade eq '7'}">
                    	<li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_empList" title="인사/급여메뉴"
                                alt="">인사/급여</a>
                            <ul class="subMenu3">
                                <li> <a class="submenuLink" href="sfa_wage.html" title="급여관리" alt="">급여관리</a></li>
                                <li> <a class="submenuLink" href="sfa_tna_manage.html" title="근태관리" alt="">근태관리</a></li>
                                <li> <a class="submenuLink" href="${pageContext.request.contextPath}/SFA_empList" title="사원목록" alt="">사원관리</a></li>
                            </ul>
                        </li>
                    	</c:when>
                    	<c:when test="${sessionScope.deptid eq '100'}">
                    	<li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="${pageContext.request.contextPath}/SFA_empList" title="인사/급여메뉴"
                                alt="">인사/급여</a>
                            <ul class="subMenu">
                                <li> <a class="submenuLink" href="sfa_wage.html" title="급여관리" alt="">급여관리</a></li>
                                <li> <a class="submenuLink"  href="sfa_tna_manage.html" title="근태관리" alt=""> 근태관리</a></li>
                                <li> <a class="submenuLink" href="${pageContext.request.contextPath}/SFA_empList" title="사원관리" alt="">사원관리</a></li>
                            </ul>
                        </li>
                    	</c:when>
                    	</c:choose>
                        
                        <c:if test="${(sessionScope.grade eq '7') or (sessionScope.deptid eq '200')}">
                        <li class="topMenuLi">
                            <a class="menuLink noto weight700 font16 f6" href="sfa_item_manage.html" title="영업관리메뉴"
                                alt="">영업관리</a>
                            <ul class="subMenu">
                                <li> <a class="submenuLink" href="sfa_stock_manage.html" title="재고관리" alt="">재고관리</a>
                                </li>
                                <li> <a class="submenuLink" href="sfa_sale_manage.html" title="판매관리" alt="">판매관리</a>
                                </li>
                                <li> <a class="submenuLink" href="sfa_order_manage.html" title="수주관리" alt="">수주관리</a>
                                </li>
                                <li> <a class="submenuLink" href="sfa_company_manage.html" title="거래처등록"
                                        alt="">거래처관리</a></li>
                                <li> <a class="submenuLink" href="sfa_item_manage.html" title="품목관리" alt="">품목관리</a>
                                </li>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="menu-icon-wrap">
                <div class="icon font20 f6">
                    <span class="sig_icon">
                        <a href="#" title="approve" class="popup f6"> <i class="fas fa-file-signature"></i></a>
                    </span>
                    <span class="admin-icon">
                        <a href=" ./SFA_admin.html" title="admin" class="f6"><i class="fas fa-user-cog"></i></a>
                    </span>
                    <span class="login_icon">
                        <a href="${pageContext.request.contextPath}/logout" title="login" class="f6"><i class="fas fa-door-closed"></i></a>
                    </span>
                </div>
            </div>
        </div>
</header>