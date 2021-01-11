$(function login() {
    //로그인 엔터키 입력시
    $('#emppwd').keyup(function(event){
        if(event.keyCode === 13) {
            $('#loginbtn').click();
        }
    });
    
    //로그인 ajax
    $('#loginbtn').click(function() {
    
    	var id = $('#empid').val();
    	var pwd = $('#emppwd').val();
    	
    	if(id == ""){
    		alert("사번을 입력해주세요"); 
    		$('#empid').focus();
    		return false;	
    	}else if(pwd == ""){
    		alert("비밀번호를 입력해주세요");
    		$('#emppwd').focus();	
    		return false;
    	}
    	
		var dataForm = {
			empid : $('#empid').val(),
			emppwd : $('#emppwd').val()
		};

		$.ajax({
			url : "/saleforce/login",
			type : "post",
			data : dataForm,
			success : function(data) {
				if(data == "admin"){
					window.location.href = "/saleforce/SFA_admin";
				}
				else if(data == "standard"){
					window.location.href = "/saleforce/SFA_main";
				} else if(data == "noauth") {
					alert("로그인 권한이 없습니다.\n관리자에게 로그인 권한을 요청해주세요.");
					window.location.reload();
				} else {
					alert("등록된 사용자가 아니거나 패스워드가 틀립니다.");
					window.location.reload();
				}
			},
			error : function(request) {
                alert("message:" + request.responseText);
            }
		});
	});
    
    
    //비밀번호찾기 엔터키 입력시
    $('#email').keyup(function(event){
        if(event.keyCode === 13) {
            $('#pwdbtn').click();
        }
    });
    
    
    
    $('#pwdbtn').click(function(){
    
    	var id = $('#empid').val();
    	var email = $('#email').val();
    	
    	if(id == ""){
    		alert("사번을 입력해주세요"); 
    		$('#empid').focus();
    		return false;	
    	}else if(email == ""){
    		alert("이메일을 입력해주세요");
    		$('#email').focus();	
    		return false;
    	}
    	
    	var dataForm = {
			empid : $('#empid').val(),
			email : $('#email').val()
		};

		$.ajax({
			url : "/saleforce/pwdFind",
			type : "post",
			data : dataForm,
			success : function(data) {
				if(data == "fail"){
					alert("아이디와 이메일을 확인해주시기 바랍니다");
					window.location.reload();
					
				} else {
					alert(data);
					window.location.href = "/saleforce/loginpage";
				}
			},
			error : function(request) {
                alert("message:" + request.responseText);
            }
		});
    });
});