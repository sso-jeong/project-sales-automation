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