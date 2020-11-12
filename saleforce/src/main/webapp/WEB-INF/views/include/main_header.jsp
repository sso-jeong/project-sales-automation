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
<SCRIPT type="text/javascript">
	var aTree;
	var formIframe;

	var setting = {
		view : {
			dblClickExpand : false,
			showLine : true,
			selectedMulti : false
		},

		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : ""
			}
		},
		callback : {
			beforeClick : function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					formIframe.attr("src", treeNode.file + ".html");
					return true;
				}
			}
		}
	};

	var zNodes = [ {
		id : 1,
		pId : 0,
		name : "[인사총무부 문서양식]",
		open : true
	}, {
		id : 101,
		pId : 1,
		name : "업무일지",
		file : "${pageContext.request.contextPath}/file/b_log"
	}, {
		id : 102,
		pId : 1,
		name : "연차처리",
		file : "${pageContext.request.contextPath}/file/day_off"
	}, {
		id : 103,
		pId : 1,
		name : "급여명세서",
		file : "${pageContext.request.contextPath}/file/payslip"
	},

	{
		id : 2,
		pId : 0,
		name : "[영업부 문서양식]",
		open : true
	}, {
		id : 201,
		pId : 2,
		name : "수주처리",
		file : "${pageContext.request.contextPath}/file/order_manager"
	}, {
		id : 202,
		pId : 2,
		name : "판매처리",
		file : "${pageContext.request.contextPath}/file/sale_manager"
	} ];

	$(document).ready(function() {
		var t = $("#ztree");
		t = $.fn.zTree.init(t, setting, zNodes);
		formIframe = $("#formIframe");
		formIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id", 101));

	});

	function loadReady() {
		var bodyH = formIframe.contents().find("body").get(0).scrollHeight, htmlH = formIframe
				.contents().find("html").get(0).scrollHeight, maxH = Math.max(
				bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = formIframe
				.height() >= maxH ? minH : maxH;
		if (h < 760)
			h = 760;
		formIframe.height(h);
	}
</SCRIPT>
</head>