$(function () {
    $('#cfm-password').keyup(function (event) {

        var pwd = $("#emppwd").val();
        var cpwd = $("#cfm-password").val();

        if (pwd != null && pwd != '') {
            if (pwd == cpwd) {
                $("#pwdcheck").addClass("green");
                $('#btn').removeClass("disen");
                $('#btn').prop('disabled', false);

            } else {
                $("#pwdcheck").removeClass("green");
                $("#pwdcheck").addClass("red");
                $('#btn').addClass("disen");
                $('#btn').prop('disabled', true);

            }
        }

        if(event.keyCode === 13) {
            $('#btn').click();
        }
    });

    $('#emppwd').keyup(function () {

        var pwd = $("#password").val();
        var cpwd = $("#cfm-password").val();

        if (pwd != null && pwd != '') {
            if (pwd == cpwd) {
                $("#pwdcheck").addClass("green");
                $('#btn').removeClass("disen");
                $('#btn').attr({
                    "disabled": "false"
                });

            } else {
                $("#pwdcheck").removeClass("green");
                $("#pwdcheck").addClass("red");
                $('#btn').addClass("disen");
                $('#btn').attr({
                    "disabled": "disabled"
                });

            }
        }
    });


    $(".pos #emphp").keyup(function () {
        var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; //정규식 구문
        var obj = $("#emphp").val();
        if (RegExp.test(obj)) {
            alert("특수문자는 입력하실 수 없습니다.");
            $(".pos #emphp").val(obj.slice(0, -1));
        }

    });
    

});

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