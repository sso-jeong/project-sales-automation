function item() {
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