<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" style="background-color: #f5f6f7">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>급여명세서</title>
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
    <div class="paper" style="margin:38px auto;">
        <div class="paper-title">
            <h1 class="center noto font30">급 여 명 세 서</h1>
        </div>
        <div class="paper-approval m-t20" style="width:100%;">
            <table>
                <tr>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">
                        성명</td>
                    <td style="width:230px;">
                    	${info.empnm}
                    </td>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">
                        부서</td>
                    <td style="width:230px;">
                    	${info.buseo_name}
                    </td>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">
                        직책</td>
                    <td style="width:230px;">
                    	${info.grade_name}
                    </td>
                    <td class="center weight700 " style="width:120px; background-color: rgba(219, 228, 232, 0.8);">
                        지급일</td>
                    <td style="width:230px;">
                    	${info.payday}
                    </td>
                </tr>
            </table>
        </div>

        <div class="paper-content m-t30">
            <table>
                <tr>
                    <td class="center weight700 " style="background-color: rgba(219, 228, 232, 0.8);">지급항목
                    </td>
                    <td class="center weight700 " style="width:50%; background-color: rgba(219, 228, 232, 0.8);">지급액
                    </td>
                </tr>
                <tr>
                    <td class="center weight700">
                        기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.fund}" pattern="#,###"/> 
                    	
                    </td>
                </tr>
                <tr>
                    <td class="center weight700 ">
                        야&nbsp;&nbsp;&nbsp;&nbsp;근&nbsp;&nbsp;&nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;&nbsp;당
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.ya}" pattern="#,###"/> 
                    	
                    </td>
                </tr>
                <tr>
                    <td class="center weight700 ">
                        휴&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;&nbsp;당
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.hu}" pattern="#,###"/> 
                    	
                    </td>
                </tr>
                <tr>
                    <td class="center weight700 ">
                        연&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;&nbsp;당
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.yeon}" pattern="#,###"/> 
                    	
                    </td>
                </tr>
                <tr>
                    <td class="center weight700 ">
                        기&nbsp;&nbsp;&nbsp;&nbsp;타&nbsp;&nbsp;&nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;&nbsp;당
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.gi}" pattern="#,###"/> 
                    </td>
                </tr>
                <tr>
                    <td class="center weight700 " style="background-color: rgba(219, 228, 232, 0.8);">급여계
                    </td>
                    <td class="right weight700 p-lr3">
                    	<fmt:formatNumber value="${info.totpay}" pattern="#,###"/> 
                    </td>
                </tr>
            </table>
        </div>
        <div class="center weight700 m-t30">
            <div>귀하의 노고에 대단히 감사드립니다.</div>
            <div class="m-t30">(주) SALE FORCE AUTOMATION 대표이사 홍길동</div>
        </div>
    </div>
</body>

</html>