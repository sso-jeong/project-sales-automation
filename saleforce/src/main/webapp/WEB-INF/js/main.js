$(function () {
    var navTop = $("nav").offset().top;
    $(window).scroll(function () {
        if ($(window).scrollTop() > navTop) {
            $("nav").css({
                position: "fixed",
                top: "0px",
                left: "0px"
            });

        } else {
            $("nav").css({
                position: "static"
            });
        }
    });

    $(document).keydown(function (event) {
        if ($(".modal-wrapper").hasClass("open")) {
            if (event.keyCode == 27 || event.which == 27) {
                $(".modal-wrapper").removeClass("open");
            }
        }
    });

    // $('.price').keyup(function() {
    //     var sur = $('.price').val() / 10; 
    //     if($('.surtax')){
    //         $('.surtax').val(sur);
    //     }
    // });

    // 데이터 클릭시 수정,삭제 버튼 
    $('.list tr').click(function () {
    	var td = $(".list tr:eq(1)").children();
		var chknull = td.eq(1).text();
		if(chknull != ""){			
        $('.up').css('display', 'inline-block');
        $('.del').css('display', 'inline-block');
        $('.new').css('display', 'inline-block');
        $('.insert').css('display', 'none');
        }
    });

    $('.new').click(function () {
        $('.up').css('display', 'none');
        $('.del').css('display', 'none');
        $('.new').css('display', 'inline-block');
        $('.insert').css('display', 'inline-block');
    });


    // 재고관리 이중테이블
    $('.stock-left table2').click(function () {
        $('.stock-left table').toggleClass('on');

        if ($(this).hasClass("on")) {
            $('.stock-left').css('width', '65%');
            $('.stock-right').css('display', 'block');

        } else {
            $('.stock-left').css('width', '100%');
            $('.stock-right').css('display', 'none');
        }
    });

    $('.stock-left2 .list tr').click(function () {
        $(this).toggleClass('on');

        if ($(this).hasClass("on")) {
            $(this).css('background-color', 'rgba(219, 228, 232, 0.8)');
        } else {
            $(this).css('background-color', '');
        }

    });
    // 근태관리 이중테이블

    $(".tna-list tr").click(function () {

        var str = "";
        var tdArr = new Array();

        var tr = $(this);
        var td = tr.children();

        td.each(function (i) {
            tdArr.push(td.eq(i).text());
        });

        var type = td.eq(9).text();

        if (type != '내근') {
            $('.tna-left table .tna').toggleClass('on');

            if ($(this).children().hasClass("on")) {
                $('.tna-left').css('width', '65%');
                $('.tna-right').css('display', 'block');
                $(this).css('background-color', 'rgba(219, 228, 232, 0.8)');

            } else {
                $('.tna-left').css('width', '100%');
                $('.tna-right').css('display', 'none');
                $(this).css('background-color', '');
            }
        } else {
            alert("내근 외 기록이 없습니다.");
        }

    });

    //상단메뉴바 흐림 효과 

    $('.menuLink').mouseover(function () {
        $(this).addClass("on");
        $('.topMenuLi>a').not('a.on').css('color', 'rgba(242,247,255,.5)');
    });


    $('.menuLink').mouseleave(function () {
        $(this).removeClass("on");
        $('.menuLink').css('color', '#fff');
    });

    $('.subMenu').mouseover(function () {
        $(this).parent('li').children('a').addClass("on");
        $('.topMenuLi>a').not('a.on').css('color', 'rgba(242,247,255,.5)');
    });

    $('.subMenu').mouseleave(function () {
        $(this).parent('li').children('a').removeClass("on");
        $('.menuLink').css('color', '#fff');
    });

    //첨부파일
    $('.signsave').click(function () {
        var input = document.getElementById("file");
        var fReader = new FileReader();
        fReader.readAsDataURL(input.files[0]);
        fReader.onloadend = function (event) {
            var img = document.getElementById("sign");
            img.src = event.target.result;
            img.height = 100;
        }
    });

});

//select box 값 변경 이벤트
function change() {

    //휴가명 자동
    var nm = $('.tna option:selected').text();
    $('#vacnm').val(nm);

    //입고일자, 출고일자 자동선택.
    var type = $('.type').val();

	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
		 
    if ((type) == "A" || type == "B") {
        $('.outdt').attr('disabled', true);
        $('.indt').attr('disabled', false);
        $('.outdt').val('');
        $('.indt').val(yyyy+"-"+mm+"-"+dd);
    } else if (type == "C") {
        $('.indt').attr('disabled', true);
        $('.outdt').attr('disabled', false);
        $('.indt').val('');
        $('.outdt').val(yyyy+"-"+mm+"-"+dd);
    }
}