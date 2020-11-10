$(function() {

    //로그인 엔터키 입력시
    $('#emppwd').keyup(function(event){
        if(event.keyCode === 13) {
            $('#btn').click();
        }
    });
    //비밀번호찾기 엔터키 입력시
    $('#email').keyup(function(event){
        if(event.keyCode === 13) {
            $('#btn').click();
        }
    });
    
   $("#btn").click(function () {    	
        if ($("#empid").val() == '') {
            alert("사번을 입력해 주세요.");
            $("#empid").focus();
            $("#empid").val("");
            return false;
        } else if ($("#emppwd").val() == '') {
            alert("비밀번호를 입력하세요.");
            $("#emppwd").focus();
            $("#emppwd").val("");
            return false;
    	}
    	$.ajax({
					url		: "/springProject/SFA_login",
					type	: "POST",
					data 	: $("#frm").serialize(),
					success	: function(resData) {
						if( resData == 'success1' ) {
							alert("관리자로 로그인되었습니다.");
							window.location.href = "/springProject/SFA_admin";
							
						}else if( resData == 'success2' ){
							alert("로그인 되었습니다.");
							window.location.href = "/springProject/SFA_main";
						
						}else if( resData == 'success3' ){
							alert("접속권한이 없습니다.\n관리자에게 문의하세요.");
							window.location.href = "/springProject/SFA_login";
						
						}else{
							alert("등록된 사용자가 아닙니다.\n다시 입력해주세요.");
							window.location.reload();
							
						}
						
						
					},
					error:function(request){
        				alert("message:"+request.responseText+"\n");

					}
		});
    });
    

    $("#btn2").click(function () {
        if ($("#empid").val() == '') {
            alert("사번을 입력해 주세요.");
            $("#empid").focus();
            $("#empid").val("");
            return false;

        } else if ($("#email").val() == '') {
            alert("이메일을 입력하세요.");
            $("#email").focus();
            $("#email").val("");
            return false;

        }
        $.ajax({
					url		: "/springProject/SFA_Pwd",
					type	: "POST",
					data 	: $("#frm").serialize(),
					success	: function(resData) {
						if( resData == 'failure' ) {
							alert("사번 또는 이메일을 잘못 입력했습니다.\n확인 후 다시 입력해주세요.");
							window.location.reload();
						
						}else{
							alert("비밀번호 : "+resData);
							window.location.reload();
						}
						
					},
					error:function(request){
        				alert("message:"+request.responseText+"\n");

					}
		});

    });


});