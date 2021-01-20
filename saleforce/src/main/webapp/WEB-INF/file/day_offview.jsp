<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>연차처리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        body {
            background-color: #fff;
        }

        .paper {
            width: 800px;
        }

        tr {
            height: 30px;
        }

        /* table 선색 */
        td {
            border: 1px solid #d6dce7;
        }
    </style>
    <script src="${pageContext.request.contextPath}/lib/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>

<body>
	<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/upApprove?empnm=${sessionScope.empname}" autocomplete="off">
    <div class="paper">  	
        <div class="paper-title">
            <h1 class="center noto font30">연 차 처 리</h1>
        </div>
        <div class="paper-approval m-t20">
            <div class="approval-left float-l" style="width:350px;">
                <table>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">기안자</td>
                        <td class="p-lr3" style="width:230px;">
                        <input class="center input-100" id="empnm" type="text" value="${yeon.empnm}" readonly style="background-color: #f3f4f4">
                        <input class="center" type="hidden" name="empid" value="${yeon.empid}">
                        <input type="hidden" name="empnm3" value="${yeon.empnm3}" />
                        <input type="hidden" name="dttype" value="B" />
                        </td>
                    	
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">소속</td>
                        <td class="p-lr3" style="width:230px;"><input id="buseoname" class="center input-100" type="text" value="${yeon.buseoname}" readonly style="background-color: #f3f4f4"></td>
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">기안일</td>
                        <td class="p-lr3" style="width:230px;"><input id="regdate" class="center input-100" type="date" name="regdate" value="${yeon.regdate}" readonly ></td>
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);"> 문서번호</td>
                        <td class="p-lr3" style="width:230px;"><input id="docnum" class="center input-100" type="text" name="docnum" readonly placeholder="문서번호는 자동생성입니다." value="${yeon.docnum}" readonly></td>
                    </tr>
                </table>
            </div>
            <div class="approval-right float-r">
                <table style="width:130px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">기<br><br><br>안</td>
                        <td id="gradename" class="center" style="width:100px;">${yeon.gradename}</td>
                    </tr>
                    <tr>
                        <td class="center empnm" style="width:100px;height:60px;">${yeon.empnm}</td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;"><input type="checkbox" id="chk1" name="chk1" style="width: 20px; height: 20px;" <c:if test="${yeon.chk1 eq 'on'}"> checked="checked" </c:if>></td>
                    </tr>
                </table>
                <table style="width:130px;margin-left:3px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">승<br><br><br>인</td>
                        <td class="center" style="width:100px;">팀장</td>
                    </tr>
                    <tr>
                        <td class="center p-lr3" style="width:100px;height:60px;">
                        	<c:if test="${yeon.empnm2 ne ''}">${yeon.empnm2}</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;">
                        <c:if test='${sessionScope.empname eq yeon.empnm2 || yeon.apprst eq 1}'>
                        	<input type="checkbox" name="chk2" style="width: 20px; height: 20px;" required <c:if test="${yeon.chk2 eq 'on'}"> checked </c:if>>
                        </c:if>
                        <c:if test='${sessionScope.empname eq yeon.empnm3}'>
                        	<input type="checkbox" name="chk2" style="display: none;" <c:if test="${yeon.chk2 eq 'on'}"> checked</c:if>>
                        </c:if>
                        </td>                 
                    </tr>
                </table>
                <table style="width:130px;margin-left:3px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">최<br>종<br>확<br>인</td>
                        <td class="center" style="width:100px;">부장</td>
                    </tr>
                    <tr>
                        <td class="center p-lr3" style="width:100px;height:60px;">
                        	<c:if test="${yeon.empnm3 ne ''}">${yeon.empnm3}</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;">
                        <c:if test='${sessionScope.empname eq yeon.empnm3 || yeon.apprst eq 1}'>
                        <input type="checkbox" name="chk3" style="width: 20px; height: 20px;" required <c:if test="${yeon.chk3 eq 'on'}"> checked="checked" </c:if>>
                        </c:if>
                        </td>                     	
                    </tr>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="paper-content m-t30">
            <table>
                <tr>
                	<td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">일반 / 긴급
                    </td>
                    <td class="p-lr3">
                    <select id="docst" class="sel-100 center" name="docst" disabled>
                    	<option value="N" <c:if test="${yeon.docst eq 'N'}">selected</c:if>>일반</option>
                    	<option value="Y" <c:if test="${yeon.docst eq 'Y'}">selected</c:if>>긴급</option>
                    </select> 
                    </td>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">시행일자
                    </td>
                    <td class="p-lr3"><input type="date" name="docdate" id="docdate" class="input-100 center" value="${yeon.docdate}" tabindex="1" readonly/></td>            
                </tr>
                <tr>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">제목
                    </td>
                    <td class="p-lr3" colspan="3"><input type="text" name="subject" id="subject" class="input-100" tabindex="2" value="${yeon.subject}" readonly/></td>
                </tr>

            </table>
            <div class="m-t30">
                <table>
                    <tr>
                        <td colspan="4">
                            <textarea name="content" id="editor"
                                style="width:100%;border:1px solid #E2E9ED;padding:10px;border-radius: 2px;"
                                class="content noto" tabindex="3" readonly>${yeon.content}</textarea>
                            <script>
                                CKEDITOR.replace('editor');
                                CKEDITOR.config.height = 200;
                            </script>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
       
        <div class="modal-bottom center m-t20">
             <c:if test='${ (sessionScope.empname eq yeon.empnm2 || sessionScope.empname eq yeon.empnm3) && yeon.apprst ne 1}'>
            	<button type="submit" class="btn-on" id="">결재승인 </button>
            </c:if>
        </div>
    </div>
     </form>
    
</body>
<script>
</script>
</html>