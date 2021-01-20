<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>

<body>
	<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setApprove" autocomplete="off">
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
                        <input class="center input-100" id="empnm" type="text" value='${sessionScope.empname}' readonly style="background-color: #f3f4f4">
                        <input class="center" type="hidden" name="empid" value='${sessionScope.empid}'>
                        <input type="hidden" name="dttype" value="B" />
                        </td>
                    	
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">소속</td>
                        <td class="p-lr3" style="width:230px;"><input id="buseoname" class="center input-100" type="text" value='${sessionScope.buseonm}' readonly style="background-color: #f3f4f4"></td>
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">기안일</td>
                        <td class="p-lr3" style="width:230px;"><input id="regdate" class="center input-100" type="date" name="regdate" value='${sessionScope.nowdate}' readonly style="background-color: #f3f4f4"></td>
                    </tr>
                    <tr>
                        <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);"> 문서번호</td>
                        <td class="p-lr3" style="width:230px;"><input id="docnum" class="center input-100" type="text" name="docnum" readonly placeholder="문서번호는 자동생성입니다."></td>
                    </tr>
                </table>
            </div>
            <div class="approval-right float-r">
                <table style="width:130px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">기<br><br><br>안</td>
                        <td id="gradename" class="center" style="width:100px;"></td>
                    </tr>
                    <tr>
                        <td class="center empnm" style="width:100px;height:60px;"></td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;"><input type="checkbox" id="chk1" name="chk1" style="width: 20px; height: 20px;"></td>
                    </tr>
                </table>
                <c:if test="${sessionScope.grade < 5}">
                <table style="width:130px;margin-left:3px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">승<br><br><br>인</td>
                        <td class="center" style="width:100px;">팀장</td>
                    </tr>
                    <tr>
                        <td class="center p-lr3" style="width:100px; height:60px; position: relative;">
                        <input type="text" class="input-100" name="empnm2" id="empnm2"/>
                        <span id="team" onclick="popup(this)" style="position: absolute; top: 50%; transform: translateY(-50%); right: 8px; color: #000000;"> <i class="fas fa-search"></i>								
						</span> 
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;"><input type="checkbox" style="width: 20px; height: 20px;"></td>
                    </tr>
                </table>
                </c:if>
                <table style="width:130px;margin-left:3px;" class="float-l">
                    <tr>
                        <td class="center weight700 " style="width:30px; background-color: rgba(219, 228, 232, 0.8);"
                            rowspan="4">최<br>종<br>확<br>인</td>
                        <td class="center" style="width:100px;">부장</td>
                    </tr>
                    <tr>
                        <td class="center p-lr3" style="width:100px;height:60px; position: relative;">
                        <input type="text" class="input-100" name="empnm3" id="empnm3" required />
                        <span id="bu" onclick="popup(this)" style="position: absolute; top: 50%; transform: translateY(-50%); right: 8px; color: #000000;"> <i class="fas fa-search"></i>								
						</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="center" style="width:100px;"><input type="checkbox" style="width: 20px; height: 20px;"></td>
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
                    <select id="docst" class="sel-100 center" name="docst">
                    	<option value="N">일반</option>
                    	<option value="Y">긴급</option>
                    </select> 
                    </td>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">시행일자
                    </td>
                    <td class="p-lr3"><input type="date" name="docdate" id="docdate" class="input-100 center" value='${sessionScope.nowdate}' tabindex="1" /></td>            
                </tr>
                <tr>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">제목
                    </td>
                    <td class="p-lr3" colspan="3"><input type="text" name="subject" id="subject" class="input-100" tabindex="2" required /></td>
                </tr>

            </table>
            <div class="m-t30">
                <table>
                    <tr>
                        <td colspan="4">
                            <textarea name="content" id="editor"
                                style="width:100%;border:1px solid #E2E9ED;padding:10px;border-radius: 2px;"
                                class="content noto" tabindex="3" required></textarea>
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
            <button type="submit" class="btn-on appr" id="">결재</button>
        </div>
    </div>
    </form>
   
</body>
<script>
function popup(popup) {
	var id = popup.getAttribute('id');
	
	if(id == "team"){
		var url = "${pageContext.request.contextPath}/empApprPopup?grade=5";
		var name = "팀장인원 목록";
	} else if(id == "bu"){
		var url = "${pageContext.request.contextPath}/empApprPopup?grade=6";
		var name = "부장인원 목록";
	}
	
	window.open(url, name, "width=1200, height=600, toolbar=no, status=no, location=no, scrollbars=yes, memubar=no, resizable=no, top=100");
}
</script>
</html>