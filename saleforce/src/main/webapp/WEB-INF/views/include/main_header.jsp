<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SALE FORCE AUTOMATION SYSTEM</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-cal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle.css">

<script src="https://kit.fontawesome.com/b1cadc3305.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/appr.js"></script>
<script src="${pageContext.request.contextPath}/js/human.js"></script>
<script src="${pageContext.request.contextPath}/js/sale.js"></script>
<script src="${pageContext.request.contextPath}/js/comcode.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ztree.core.js"></script>
<script>
	$(function() {
		$(".popup").click(function() {
			$(".modal-wrapper").toggleClass("open");
		});
	});
</script>

</head>