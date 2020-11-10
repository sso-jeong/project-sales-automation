$(function () {

	$("#empid").keyup(function() {

			var dataForm = {
				empid:$("#empid").val()
			};
			
			$.ajax({
				url : "/springProject/idCheck",
				type : "POST",
				data : dataForm,
				success : function(data) {
					if(data=="success") {
						//$("#idchk").html("사용할 수 있는 아이디입니다.");
						  $("#idchk").addClass("green");
			              $('#reg_btn').removeClass("disen");
			              $('#reg_btn').prop('disabled', false);

					}else {
						//$("#idchk").html("사용할 수 없는 아이디입니다.");
						//$("#empid").val("");
						  $("#idchk").removeClass("green");
			              $("#idchk").addClass("red");
			              $('#reg_btn').addClass("disen");
			              $('#reg_btn').prop('disabled', true);
					}
				},
				error : function() {
					alert("시스템오류");
				}
			});
		});

     $('#cfm-password').keyup(function (event) {

        var pwd = $("#emppwd").val();
        var cpwd = $("#cfm-password").val();

        if (pwd != null && pwd != '') {
            if (pwd == cpwd) {
                $("#pwdcheck").addClass("green");
                $('#reg_btn').removeClass("disen");
                $('#reg_btn').prop('disabled', false);

            } else {
                $("#pwdcheck").removeClass("green");
                $("#pwdcheck").addClass("red");
                $('#reg_btn').addClass("disen");
                $('#reg_btn').prop('disabled', true);

            }
        }

        if(event.keyCode === 13) {
            $('#reg_btn').click();
        }
    });

    $('#emppwd').keyup(function () {

        var pwd = $("#emppwd").val();
        var cpwd = $("#cfm-password").val();

        if (pwd != null && pwd != '') {
            if (pwd == cpwd) {
                $("#pwdcheck").addClass("green");
                $('#reg_btn').removeClass("disen");
                $('#reg_btn').attr({
                    "disabled": "false"
                });

            } else {
                $("#pwdcheck").removeClass("green");
                $("#pwdcheck").addClass("red");
                $('#reg_btn').addClass("disen");
                $('#reg_btn').attr({
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

$(function load() {
 	$.ajax({
        url: "/springProject/getBuseoList",
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
        url: "/springProject/getGradeList",
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
});