function sale() {
    $.ajax({
        url: "/saleforce/getGrpList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#grpnm").append("<option value=" + value.grpcd + ">" + value.grpnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getDivList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#divnm").append("<option value=" + value.divcd + ">" + value.divnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function company() {
    $.ajax({
        url: "/saleforce/getTypeList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#typenm").append("<option value=" + value.typecd + ">" + value.typenm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getDttypeList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#dttypenm").append("<option value=" + value.dttypecd + ">" + value.dttypenm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function stock() {
    $.ajax({
        url: "/saleforce/getStktypeList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#stktypenm").append("<option value=" + value.stktypecd + ">" + value.stktypenm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function empList() {
    $.ajax({
        url: "/saleforce/getGenderList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#gendernm").append("<option value=" + value.gendercd + ">" + value.gendernm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
    
     $.ajax({
        url: "/saleforce/getbirthtype",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#birttypenm").append("<option value=" + value.birttypecd + ">" + value.birttypenm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getChaList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#chanm").append("<option value=" + value.chacd + ">" + value.chanm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getMiliList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#milinm").append("<option value=" + value.milicd + ">" + value.milinm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getImpList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#impnm").append("<option value=" + value.impcd + ">" + value.impnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getPatrList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#patrnm").append("<option value=" + value.patrcd + ">" + value.patrnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getReliList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#relinm").append("<option value=" + value.relicd + ">" + value.relinm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getMarList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#marnm").append("<option value=" + value.marcd + ">" + value.marnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
    
   
}

function tna() {
    $.ajax({
        url: "/saleforce/getDlList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#dlnm").append("<option value=" + value.dlcd + ">" + value.dlnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getHuList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#hunm").append("<option value=" + value.hucd + ">" + value.hunm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function wage() {
    $.ajax({
        url: "/saleforce/getPayList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#paynm").append("<option value=" + value.paycd + ">" + value.paynm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getCaList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#canm").append("<option value=" + value.cacd + ">" + value.canm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getDatgrpList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#datgrpnm").append("<option value=" + value.datgrpcd + ">" + value.datgrpnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function approval() {
    $.ajax({
        url: "/saleforce/getAprformList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#aprformnm").append("<option value=" + value.aprformcd + ">" + value.aprformnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getAprcaList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#aprcanm").append("<option value=" + value.aprcacd + ">" + value.aprcanm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getAprsingList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#aprsingnm").append("<option value=" + value.aprsingcd + ">" + value.aprsingnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });

    $.ajax({
        url: "/saleforce/getReasonList",
        type: "POST",
        data: "",
        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
        dataType: "json", // 수신 데이터 타입
        success: function (resData) {

            $.each(resData, function (key, value) {
                $("#reasonnm").append("<option value=" + value.reasoncd + ">" + value.reasonnm + "</option>");
            });

        },
        error: function () {
            alert("시스템 에러");
        }
    });
}

function load() {
 	 $.ajax({
		        url: "/saleforce/getBuseoList",
		        type: "POST",
		        data: "",
		        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
		        dataType: "json", // 수신 데이터 타입
		        success: function (resData) {
		        
		            $.each(resData, function(key, value){
		            	$("#deptid").append("<option value="+ value.buseo_id + ">"+value.buseo_name+"</option>");
		            });
		            
		        },
		        error: function () {
		            alert("시스템 에러");
		        }
		    });
		    
	$.ajax({
		        url: "/saleforce/getGradeList",
		        type: "POST",
		        data: "",
		        contentType: 'application/x-www-urlencoded; charset=utf-8', // 수신 방식
		        dataType: "json", // 수신 데이터 타입
		        success: function (resData) {
		        
		            $.each(resData, function(key, value){
		            	$("#grade").append("<option value="+ value.grade_id + ">"+value.grade_name+"</option>");
		            });
		            
		        },
		        error: function () {
		            alert("시스템 에러");
		        }
		  });
}