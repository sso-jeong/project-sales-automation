$(function(){
		$.ajax({
	        url: "/springProject/getGenderList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#gendernm").append("<option value="+ value.gendercd + ">"+value.gendernm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	     $.ajax({
	        url: "/springProject/getChaList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#chanm").append("<option value="+ value.chacd + ">"+value.chanm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	    $.ajax({
	        url: "/springProject/getMiliList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#milinm").append("<option value="+ value.milicd + ">"+value.milinm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	     $.ajax({
	        url: "/springProject/getImpList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#impnm").append("<option value="+ value.impcd + ">"+value.impnm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	    $.ajax({
	        url: "/springProject/getPatrList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#patrnm").append("<option value="+ value.patrcd + ">"+value.patrnm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	     $.ajax({
	        url: "/springProject/getReliList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#relinm").append("<option value="+ value.relicd + ">"+value.relinm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
	    
	    $.ajax({
	        url: "/springProject/getMarList",
	        type: "POST",
	        data: "",
	        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
	        dataType: "json", // 수신 데이터 타입
	        success: function (resData) {
	        
	            $.each(resData, function(key, value){
	            	$("#marnm").append("<option value="+ value.marcd + ">"+value.marnm+"</option>");
	            });
	            
	        },
	        error: function () {
	            alert("시스템 에러");
	        }
	    });
});