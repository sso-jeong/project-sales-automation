<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<c:if test="${(sessionScope.empid == null || sessionScope.deptid != boardRead) && boardRead != 300}">
	<script>
		alert("게시물 열람 권한이없습니다.\n관리자에게 문의하세요.");
		window.location.href = "${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}";
	</script>
</c:if>
<style>
	<%@include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <main>
        <div class="page-wrap m-tb10">
            <div class="container">
                <div class="title">
                    <p class="noto font16 weight500 m-t10 m-b10 m-lr15">${boardTitle} 상세보기</p>
                </div>
                <div class="n-wrap board-insert m-b5 m-lr15 font14">
                    <table>
                        <tr>                       	
                        	<td class="td-10 center weight700 noto under bg-green">게시글 제목</td>
                            <td colspan="3" class="center p-lr5">
                                <strong>${article.subject}</strong>
                                <input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" />
                            </td>
                            <td class="td-10 center weight700 noto under bg-green">게시글 분류</td>
                            <td class="td-15 p-lr3">
                            	<c:if test="${article.division == 'Y'}"><span class="noto weight500" style="color: #d92550;">공지사항</span></c:if>
                                 <c:if test="${article.division == 'N'}"><span class="noto weight500" style="color: #000000;">일반</span></c:if>
                            </td>                      
                        </tr>
                        
                        <tr>
                            <td class="td-10 center weight700 noto under bg-green">작성자</td>
                            <td class="center p-lr5" id="writer">${article.writer}
                            </td>

                            <td class="td-10 center weight700 noto under bg-green">첨부파일</td>
                            <td class="center td-30 p-lr3">
                            	<c:if test="${article.fileOriName eq ''}">
										<span>첨부파일이 없습니다.</span>
								</c:if>
								<c:if test="${article.fileOriName ne ''}">
								<!-- 파일다운로드권한설정 -->
									<c:if test="${sessionScope.deptid != boardDownload && boardDownload ne '300'}">
										<span>
											<a id="msg_pop">${article.fileOriName}</a>
										</span>
									</c:if>
									<c:if test="${sessionScope.deptid == boardDownload || sessionScope.deptid eq '300' || sessionScope.deptid eq '777'}">
										<span>
										<a href="${pageContext.request.contextPath}/SFA_notice_download?boardCode=${boardCode}&aid=${article.aid}">${article.fileOriName}
										</a></span>
									</c:if>
								</c:if>
							</td>

                            <td class="td-10 center weight700 noto under bg-green">게시물조회수</td>
                            <td class="td-10 center p-lr5">${article.hit}</td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under bg-green">게시글 내용</td>
                            <td colspan="5" class="td-90 left p-lr5"
                                style="padding-top:2px;padding-bottom:2px;height: 300px;">
                                <strong>
                                    ${article.content}
                                </strong>
                            </td>
                        </tr>
                        
                    </table>
                    <div class="btn-grp center m-t10 flex flex-justify">
                        <div class="btn-left">
                            <button type="button" onClick="location.href='${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}'"
                                class="btn-red">게시글목록</button>
                        </div>
                        <div class="btn-right">
                        	<c:if test="${article.division == 'N'}">
                        		<button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_reply?boardCode=${boardCode}&aid=${article.aid}'">게시글답글</button>
                        	</c:if>                          
                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_insert?boardCode=${boardCode}'">게시글작성</button>
                            <c:if test="${article.writer == sessionScope.empname}">
	                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/SFA_notice_modify?boardCode=${boardCode}&aid=${article.aid}'">게시글수정</button>
	                            <button type="button" class="btn-off" id="delete">게시글삭제</button>
                            </c:if>
                        </div>

                    </div>
                </div>

            </div>
        </div>
         <!-- 댓글 화면 구성 -->
    	<hr style="margin:20px 0; border:1px solid #eee;"/>

        <!-- 댓글 쓰기 화면 -->
        <div class="p-lr20" style="background-color: #fff;">
        
        	<div id="commentList"></div>

	            <div style="margin-top:20px;">
	                <form id="frm">
	                	<input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" />
	                	<input type="hidden" name="aid" value="${article.aid}" />
	                	<input type="hidden" id="who" name="who" value="${sessionScope.empname}" readonly />
	                    <textarea id="comment" name="comment" 
	                        style="border:1px solid #e7e7e7;width:100%;height:100px;" 
	                        placeholder="댓글 내용을 입력하세요." class="p10 noto font16"></textarea>
	                    <div class="flex flex-justify" style="padding: 10px 0" ><!-- 비밀 댓글 & 댓글 저장 버튼-->
	                        <div class="">
	                        	<input type="checkbox" id="pwd" name="pwd" style="width: 20px; height: 20px"/> 비밀댓글
	                        </div>
	                        <div class="">
	                            <button id="btn" style="padding:20px 25px;background-color:#0C4A60;color:#fff;border-radius: 3px;" class="noto font20 weight700" type="button">댓글등록</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
        	</div>
    </main> 
</body>

<script>
	 $(function() {
		listComment(); 
		
		$("#msg_pop").click(function(e) {
			alert("다운로드 권한이 없습니다.");
			e.preventDefault();
		});

		$("#btn").click(function(){
			checkComment();
		});

		$("#delete").click(function() {
			  var msg = "해당 게시글을 삭제하시겠습니까?"
	
				if (confirm(msg)) {
					var formData = {
							boardCode : $('#boardCode').val(),
							aid : ${article.aid}
					};
	
					$.ajax({
						url : "${pageContext.request.contextPath}/SFA_notice_delete",
						type : "post",
						data : formData,
						success : function(data) {
							if (data == "succees") {
								window.location.href= "${pageContext.request.contextPath}/SFA_notice_list?boardCode=${boardCode}";
							} else
								alert("삭제 오류!!!\n관리자에게 문의 하세요")
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:" + error);
						}
					});
				}
			
		});
	 });

 	function checkComment() { //동작 기능만 -> 실행 x
		
		if( $("#comment").val() == '' ) {
			alert("댓글 내용을 입력하세요.");
			$("#comment").focus();
			return false; //return -> 프로그램이 끝날 때, 반환형이 있을 때
		}

		var formData = $("#frm").serialize(); //form 안의 name 값의 데이터를 전부 가져오기

		$.ajax({
			url		: "${pageContext.request.contextPath}/comment_register",
			type	: "POST",
			data	: formData,
			success	: function(resData) {
				alert("댓글이 등록 되었습니다.");
				listComment();
				$("#comment").val(''); //$("#comment").val(); - 값을 가지고 올 때
				$("#pwd").prop("checked", false);
			},
			
			error	: function() {
				alert("관리자에게 문의하세요.");
			},

			complete: function() {}
			
		});
	}

	function listComment() {
		var name = $('#who').val();
		var writer = $('#writer').val();
		var formData = $("#frm").serialize();
		
		$.ajax({
			url		: "${pageContext.request.contextPath}/comment_list",
			type	: "POST",
			data	: formData, //내 게시판 코드, 게시물 번호가 필요
			success	: function(resData) { //개수1, 내용 1줄

				//resData.list -> who(key), 관리자(value) 
				
				var a = '';
				$.each(resData.list, function(key, value){ //내용을 key, value로 분류
				a += '<div>';
                	a += '<div class="flex" style="margin:10px 0;">';
                		a += '<div style="width:6%">';
                        	a += '<span style="background-color:#0C4A60;width:50px;height:50px;border-radius: 50%;display: inline-block;line-height: 50px;text-align: center;">';
                         	a += '<i class="far fa-user f6 font20"></i>';
                         	a += '</span>';
                     	a += '</div>';
                    a += '<div style="width:94%;">';
                     	a += '<div class="noto font16 weight700" style="color:#555;">';
                    	 	a += '<span>'+value.who+'</span>';
                    		a += '<span style="margin-left:20px;">';
                    		a += '<i class="far fa-calendar-alt"></i> '+value.regdate +'</span>';
                    	a += '</div>';
                    	a += '<div id="" class="viewComment'+value.cid+' noto font16" style="margin-top:5px;color:#666;">';
                    	if(value.pwd == "on"){	
							if(name == value.who || name == writer) {
								a += "<span>"+ value.comment+"</span>";
							}else {
								a += '<i class="fas fa-lock"></i><span>&nbsp비밀 댓글입니다.</span>'; 
							}
        				}else {
        					a += "<span>"+ value.comment+"</span>";
        				}
                    		
                    	a += "</div>";
                    	
    
               	
                 	a += '</div>';
                    a += '</div>';
                 a += '</div>';
                 a += '<div style="text-align: right;">';
                 	if(name == value.who) {
                 		a += '<button class="s-btn-on" onClick="changeComment('+value.cid+', \''+value.comment+'\')">수정</button>';
                     	a += '<button class="s-btn-off" onClick="deleteComment('+value.cid+')">삭제</button>';
                     }           	
                 a += '</div>';

					a += '<hr style="margin:20px 0;border:1px solid #f7f7f7;" />';
                 
             	a += '</div>';
				});

				var b = '';
					b += '<h2>댓글 : '+resData.count+'</h2>';

				$("#commentList").html(b+a); //위에서 작업한 변수 a 내용을 id commentList에 표시
			},
			
			error	: function() {
				alert("관리자에게 문의하세요.");
			},

			complete: function() {}
			
		});
	}

	function deleteComment(cid) {
		var msg = "선택하신 댓글 삭제하시겠습니까?";
		if( confirm(msg) ) { //confirm y, n

			var formData = {
					cid 		: cid,
					boardCode	: $("#boardCode").val() //input hidden 숨겨져 있는 boardCode 값
			}
			
			$.ajax({
				url		: "${pageContext.request.contextPath}/comment_delete",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					alert("댓글이 삭제되었습니다.");
					listComment();
				},
				error	: function() {
					alert("관리자에게 문의하세요.");
				},
				complete: function() {}
				
			});
		}
	}

	function changeComment(cid, comment) {
		var a = '';
			a += "<div>";
				a += '<textarea name="comment_'+cid+'" class="noto p10 font20" style="border:1px solid #e7e7e7;width:100%;height:100px;">'+comment+'</textarea>';
			a += "</div>";

			a += "<div style='margin-top:5px;'>";
				a += "<button type='button' class='btn-red f6' style='padding:7px 10px;' onClick='modifyComment("+cid+")'>변경</button>";
			a += "</div>";
			
			$(".viewComment" + cid).html(a);
	}

	function modifyComment(cid) {
		var comment = $('[name = comment_'+ cid + ']').val();

		var formData = {
				cid 		: cid,
				boardCode	: $("#boardCode").val(),
				comment		: comment
		}

		$.ajax({
			url		: "${pageContext.request.contextPath}/comment_modify",
			type	: "POST",
			data	: formData,
			success	: function(resData) {
				alert("댓글이 수정 되었습니다.");
				listComment();
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete: function() {}
			
		});
		
	}
</script>

</html>