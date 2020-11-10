function loaditem() {
    $.ajax({
        url: "/saleforce/getDivList",
        type: "POST",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {    
            $.each(resData, function(key, value){
            	$("#itemdiv").append("<option value="+ value.divcd + ">"+value.divnm+"</option>");
            });
            
        },
        error: function () {
            alert("시스템 에러");
        }
    });
    
     $.ajax({
        url: "/saleforce/getGrpList",
        type: "POST",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {
            $.each(resData, function(key, value){
            	$("#itemgrp").append("<option value="+ value.grpcd + ">"+value.grpnm+"</option>");
            });
            
        },
        error: function () {
            alert("시스템 에러");
        }
    });
}