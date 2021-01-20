<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.emp-list tr:first-child {
	background-color: rgba(219, 228, 232, 0.8);
}
.emp-list .tr-even:hover {
	background-color: rgba(219, 228, 232, 0.8);
}
.photo-area {
	width: 120px;
	height: 160px;
}

.photo-area img {
	width: 100%;
	height: 100%;
	display: inline-block;
}
<%@ include file="/WEB-INF/views/include/modal.jsp"%>
</style>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<main>
		<div class="page-wrap m-tb10">
			<div class="container">
				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">사원관리 > 사원
						등록</p>
				</div>
				<div class="emp-insert m-b5 m-lr15">
					<form name="frm" id="frm" method="post" action="${pageContext.request.contextPath}/setRegAll"
						autocomplete="off" enctype="multipart/form-data">
						<div class="emp-info flex flex-justify">
							<div class="emp-left">
								<div class="photo-area" style="margin-right:5px;">
									<img id="img" name="img" src="${pageContext.request.contextPath}/images/noImage2.jpg" alt="" />
								</div>

							</div>
							<div class="emp-right" style="width: 94%;">
							
								<table>
									<tr>
										<td class="td-7 under center bg-green weight700">사원번호</td>
										<td class="td-13 p-lr3"><input type="text" name="empid" id="empid" 
											class="input-100 inputbg" placeholder="사원번호는  자동 생성입니다." readonly ></td>
										<td class="td-7 under center bg-green weight700">사원명/성별</td>
										<td class="td-13 p-lr3"><input type="text" name="empnm" id="empnm"
											class="input-73" tabindex="1" maxlength="14" autofocus required> 
											<select	name="gendernm" class="sel-25" id="gendernm" tabindex="2">
										</select></td>
										<td class="td-7 under center bg-green weight700">생년월일</td>
										<td class="td-13 p-lr3"><input type="text" name="birth" id="birth"
											class="input-73" tabindex="3"  maxlength="10" required>
											<select	name="birttypenm" class="sel-25" id="birttypenm" tabindex="2">
											</select>
										</td>
										<td class="td-7 under center bg-green weight700">주민등록번호</td>
										<td class="td-7 p-lr3"><input type="text" name="regnum" id="regnum"
											class="input-100" tabindex="5"  maxlength="14" required></td>
										<td class="td-7 under center bg-green weight700">채용형태</td>
										<td class="p-lr3"><select name="chanm" class="sel-100" id="chanm">
										</select></td>

										<td class="td-7 under center bg-green weight700">병역구분</td>
										<td class="p-lr3"><select name="milinm" class="sel-100" id="milinm">
										</select></td>
									</tr>

									<tr>
										<td class="td-7 under center bg-green weight700">부서명/직급</td>
										<td class="p-lr3">
										<select name="deptid" class="sel-50" id="deptid" tabindex="7"></select>
										<select name="grade" class="sel-50" id="grade" tabindex="8"></select>
										</td>

										<td class="td-7 under center bg-green weight700">주소</td>
										<td class="p-lr3" colspan="3"><input type="text" name="empaddr"
											id="empaddr" tabindex="9" class="input-100"  maxlength="50" required></td>
											
										<td class="td-7 under center bg-green weight700">입사일자</td>
										<td class="p-lr3"><input type="date" name="joindate"
											id="joindate" tabindex="9" class="input-100" required></td>

										<td class="td-7 under center bg-green weight700">장애여부</td>
										<td class="p-lr3"><select name="impnm" class="sel-100" id="impnm">
										</select></td>
										<td class="td-7 under center bg-green weight700">보훈대상</td>
										<td class="p-lr3"><select name="patrnm" class="sel-100" id="patrnm">
										</select></td>

									</tr>
									<tr>
										<td class="td-7 under center bg-green weight700">H.P</td>
										<td class="td-7 p-lr3"><input type="tel" name="emphp" id="emphp"
											class="input-100" tabindex="9"
											pattern="[0-1]{3}-[0-9]{3,4}-[0-9]{4}"
											placeholder="000-000(0)-0000" required></td>
										<td class="td-7 under center bg-green weight700">내선번호</td>
										<td class="td-7 p-lr3"><input type="tel" name="empcp" id="empcp"
											tabindex="10" class="input-100"
											pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
											placeholder="000-000(0)-0000" required></td>
										<td class="td-7 under center bg-green weight700">이메일</td>
										<td class="p-lr3"><input type="email" name="email" id="email"
											tabindex="11" class="input-100" placeholder="abc@sfa.com"  maxlength="25" 
											required></td>
										<td class="td-7 under center bg-green weight700">계좌번호</td>
										<td class="p-lr3"><input type="text" name="accountnum" id="accountnum"
											tabindex="12" class="input-100"  maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">종교</td>
										<td class="p-lr3"><select name="relinm" class="sel-100" id="relinm">
										</select></td>

										<td class="td-7 under center bg-green weight700">결혼여부</td>
										<td class="p-lr3"><select name="marnm" class="sel-100" id="marnm">
										</select></td>
									</tr>

									<tr>
										<td class="td-7 under center bg-green weight700">희망직무</td>
										<td class="p-lr3"><input type="text" name="hope" id="hope"
											class="input-100"  maxlength="10" required></td>
										<td class="td-7 under center bg-green weight700">보유자격</td>
										<td class="p-lr3"><input type="text" name="licence" id="licence"
											class="input-100"  maxlength="20" required></td>
										<td class="td-7 under center bg-green weight700">취미</td>
										<td class="p-lr3"><input type="text" name="hobby" id="hobby"
											class="input-100" maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">특기</td>
										<td class="p-lr3"><input type="text" name="forte" id="forte"
											class="input-100" maxlength="20" required></td>

										<td class="td-7 under center bg-green weight700">어학/상벌사항</td>
										<td class="p-lr3" colspan="3"><input type="text" name="linguistic"
											id="linguistic" class="input-49" required> <input type="text"
											name="reward" id="reward" class="input-49" maxlength="20" required>
											<input type="hidden" name="emppwd" id="emppwd">
										</td>
									</tr>
									
									
								</table>
							</div>
						</div>
						<div class="flex flex-justify">
							<!-- <div class="photo-btn center p-lr18 m-t15">
								<button class="s-btn-on">수정</button>
								<button class="s-btn-off del">삭제</button>
							</div> -->
							<div class="photo-btn center m-t5" style="position: relative;">
                                <input type="file" style="width: 237px;" class="file" id="file" name="file" accept="image/*" />
                                <input type="text" style="width: 163px; left: 75px; position: absolute;" id="filesrc" />
                            </div>
							<div>
							
							<!-- 1. 등록된 사원이 있을 때
								[초기화], [등록], [삭제]
								2. 등록된 사원이 없을 때
								[초기화], [등록] -->
								
								<c:if test="${count == 0}">
									<button type="reset" class="btn-on center m-t5 new"
									>초기화</button>
									<button type="submit" class="btn-off center m-t5 insert">신규등록</button>
								</c:if>
								<c:if test="${count != 0}">
									<button type="reset" class="btn-on center m-t5 new">초기화</button>
									<button type="button" title="UPDATE" class="btn-on center m-t5 up" id="up">수정</button>
									<button type="button" class="btn-off center m-t5 del" id="del">삭제</button>	
									<button type="submit" title="INSERT" style="display:none;" class="btn-on center m-t5 insert">신규등록</button>
								</c:if>
							</div>
						</div>


					</form>

					<hr style="border: solid 1px #0C4A60; margin-top: 5px;">
				</div>

				<div class="title">
					<p class="noto font16 weight500 m-t5 m-b5 m-lr15">사원관리 > 사원
						목록</p>
				</div>

				<div class="search-wrap flex flex-justify">
					<div class="">
						<button type="button" class="btn-on m-l15 m-b5" id="deleteAll">선택삭제</button>
						<span class="btn-normal ">검색 된 품목수 : ${count}개 | ${curPage}/${totalPage} PAGE</span>					
					</div>
					<div class="form-wrap">
						<form method="post"
							action="${pageContext.request.contextPath}/SFA_empList"
							style="margin: 0 15px;" autocomplete="off">
							<select class="" name="searchOpt">
								<option value="all"
									<c:if test="${searchOpt eq 'all'}">selected</c:if>>전체검색</option>
								<option value="empnm"
									<c:if test="${searchOpt eq 'empnm'}">selected</c:if>>사원명</option>
								<option value="buseo_name"
									<c:if test="${searchOpt eq 'buseo_name'}">selected</c:if>>부서명</option>
								<option value="grade_name"
									<c:if test="${searchOpt eq 'grade_name'}">selected</c:if>>직급</option>
							</select> <input type="text" name="words" required />
							<button type="submit" class="btn-on">검색</button>
						</form>
					</div>
				</div>

				<div class="emp-list m-b5 m-lr15">
					<table class="list center empList" id="empList" style="table-layout: fixed;">
						<tr class="weight700 center font14">
							<td class="td-3">
								<input type="checkbox" style="width: 20px; height: 20px;" class="chk" onClick="chkAll();" id="chkAll"/>
							</td>

							<td class="td-3">순번</td>
							<td class="td-7" style="display: none;">부서코드</td>
							<td class="td-7">부서명</td>
							<td class="td-7" style="display: none;">직급코드</td>
							<td class="td-7">직급</td>
							<td class="td-5">사번</td>
							<td class="td-5">사원명</td>
							<td class="td-7">생년월일</td>
							<td class="td-7">주민등록번호</td>
							<td class="td-3">성별</td>
							<td>주소</td>
							<td class="td-5">H.P</td>
							<td class="td-7">E-mail</td>
							<td class="td-7">계좌번호</td>
							<td class="td-7">입사일자</td>
						</tr>

						<c:if test="${count == 0}">
							<tr>
								<td colspan="14" class="center font14">등록된 사원이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="emp" varStatus="status">
							<tr style="cursor: pointer;">
								<td class="td-3">
								<input type="checkbox" id="chk2" name="chk" class="chk" data-uid="${emp.empid}" style="width: 20px; height: 20px;" />
								</td>
								<td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
								<td style="display: none;">${emp.deptid}</td>
								<td>${emp.buseoname}</td>
								<td style="display: none;">${emp.grade}</td>
								<td>${emp.gradename}</td>
								<td>${emp.empid}</td>
								<td>${emp.empnm}</td>
								<td>${emp.birth}</td>
								<td>${emp.regnum}</td>
								<td style="display: none;">${emp.gender}</td>
								<td>${emp.gendernm}</td>
								<td>${emp.empaddr}</td>
								<td>${emp.emphp}</td>
								<td>${emp.email}</td>
								<td>${emp.accountnum}</td>
								<td>${emp.joindate}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이징 ui 시작 -->
				<c:if test="${count > 0}">
					<div class="page-grp center m-t5">

						<!-- 맨 앞으로 -->
						<c:choose>
							<c:when test="${curPage > 1}">
								<a
									href="${pageContext.request.contextPath}/SFA_empList?curPage=1&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-double-left"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-double-left"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 맨 앞으로 -->

						<!-- 한 칸 앞으로 -->
						<c:choose>
							<c:when test="${curPage > 1}">
								<a
									href="${pageContext.request.contextPath}/SFA_empList?curPage=${curPage-1}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-left"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-left"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 앞으로 -->

						<!-- 페이지 번호 출력 -->
						<c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">

							<c:if test="${selected == num}">
								<span class="page page-active"> <a href="#" class="f6">${num}</a>
								</span>
							</c:if>

							<c:if test="${selected != num}">
								<a
									href="${pageContext.request.contextPath}/SFA_empList?curPage=${num}&searchOpt=${searchOpt}&words${words}">
									<span class="page">${num}</span>
								</a>
							</c:if>

						</c:forEach>
						<!-- 페이지 번호 출력 끝 -->

						<!-- 한 칸 뒤로 -->
						<c:choose>
							<c:when test="${curPage != totalPage}">
								<a
									href="${pageContext.request.contextPath}/SFA_empList?curPage=${curPage+1}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-right"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-right"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 뒤로 -->

						<!-- 한 칸 뒤로 -->
						<c:choose>
							<c:when test="${curPage != totalPage}">
								<a
									href="${pageContext.request.contextPath}/SFA_empList?curPage=${totalPage}&searchOpt=${searchOpt}&words${words}">
									<span class="page"> <i class="fas fa-angle-double-right"></i>
								</span>
								</a>
							</c:when>
							<c:otherwise>
								<span class="page"> <i class="fas fa-angle-double-right"></i></a>
								</span>
							</c:otherwise>
						</c:choose>
						<!-- 한 칸 뒤로 -->
					</div>
				</c:if>
				<!-- 페이징 ui 끝 -->
			</div>
		</div>
	</main>

</body>
<script>
	$(function(){
		$("tr:nth-child(n)").addClass("tr-even");
		//alert("성공");
		load();
		empList();
		var tr = $("#empList tr:nth-child(2)");
		var td = tr.children();        
		var empID = td.eq(6).text();
		empload(empID);

		$("#empList tr").click(function() {
			var tr2 = $(this);
			var td2 = tr2.children();

			var empID = td2.eq(6).text();
			//alert(empID);
			empload(empID);

		});

		$('#new').click(function() {
	    	$('#img').attr('src', "${pageContext.request.contextPath}/images/noImage2.jpg");
		});

		$('#up').click(function() {		
			//alert("성공");
			var msg = $("#empnm").val() + "의 정보를 수정하시겠습니까?";

			var formData = new FormData($("#frm")[0]);
			
			if(confirm(msg)) {
				
				$.ajax({
					url: "${pageContext.request.contextPath}/SFA_setEmpOthers",
			        type: "post",
			        data: formData,
			        processData: false, 
			       	contentType: false,
			        success : function(data) {
				        window.location.reload();
			        },
			        error: function(request) {
			            alert("message:"+request.responseText);
			        },
				});
			}
		});

		$('#del').click(function(){
			var msg = $("#empnm").val() + "의 정보를 삭제하시겠습니까?"
			var empid = $('#empid').val();

			if(confirm(msg)) {
				var formData = { empid : empid};
				$.ajax({
					url: "${pageContext.request.contextPath}/deleteEmpList",
			        type: "post",
			        data: formData,
			        success : function(data) {
				        if(data == "success") window.location.reload();
				        else alert("삭제 오류!!!\n관리자에게 문의 하세요")
			        },
			        error: function(request) {
			            alert("message:"+request.responseText);
			        }
				});
			}
		});

		$('#file').on("change", function () {
	        var input = document.getElementById("file");
	        var fReader = new FileReader();
	        $('#filesrc').val(input.files[0].name);
	        fReader.readAsDataURL(input.files[0]);
	        fReader.onloadend = function (event) {
	            var img = document.getElementById("img");
	            img.src = event.target.result;
	            img.height = 100;
	        }
	    });
	    

		$("#deleteAll").click(function(){
			//alert("성공");
			var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";
			
	         if ( confirm(msg) ) {
		        var chkArray = new Array();
		        $(".chk:checked").each(function() { //each = 향상된 for
		        	chkArray.push( $(this).attr("data-uid") );
			    });

		        $.ajax({
	                url: "${pageContext.request.contextPath}/deleteEmpAll",
	                type: "POST",
	                data: {chkArr : chkArray}, //controller <- chkArr
	                success: function (resData) {
		                if(resData == "success"){
		                	window.location.reload();
			            }else alert("선택된 사원이없습니다.");
	                    
	                },
	                error: function (request) {
	                	alert("message:"+request.responseText);
	                },
	                complete: function () {
	                    
	                }
	            });
	        }
		});

/* 		// 한 개의 체크박스 선택 해제 시 전체 선택 체크박스도 해제
		$(".chk").click(function(){
			if($("input[name='chk']:checked").length == 3){
				$("#chkAll").prop("checked", true);
			} else {
				$("#chkAll").prop("checked", false);
			}
		});  */
		
	});
	
</script>

<script>
function empload(empID){
	
	var formData = {
			empID : empID
		};
					
	$.ajax({
		url : "${pageContext.request.contextPath}/SFA_empOne",
		type : "POST",
		data : formData,
		success : function(emp) {
		 	$('#empid').val(emp.empid);
			$('#empnm').val(emp.empnm);
			$('#emppwd').val(emp.emppwd);
			$('#deptid').val(emp.deptid);
			$('#grade').val(emp.grade);
			$('#birth').val(emp.birth);
			$('#regnum').val(emp.regnum);
			$('#gendernm').val(emp.gender);
			$('#empaddr').val(emp.empaddr);
			$('#emphp').val(emp.emphp);
			$('#email').val(emp.email);
			$('#accountnum').val(emp.accountnum);
			$('#joindate').val(emp.joindate);
			$('#empcp').val(emp.empcp);
			$('#hope').val(emp.hope);
			$('#licence').val(emp.licence);
			$('#hobby').val(emp.hobby);
			$('#forte').val(emp.forte);
			$('#birttypenm').val(emp.birthtype);
			$('#chanm').val(emp.chagubun);
			$('#milinm').val(emp.miligubun);
			$('#impnm').val(emp.impediment);
			$('#patrnm').val(emp.patriotism);
			$('#relinm').val(emp.religion);
			$('#linguistic').val(emp.linguistic);
			$('#marnm').val(emp.marrygubun);
			$('#reward').val(emp.reward);
			if(emp.empPhoto != null){
        		$('#img').attr('src', "images/upload/emp/"+emp.empPhoto);
	        }else $('#img').attr('src',"${pageContext.request.contextPath}/images/noImage2.jpg");
	        $("#filesrc").val(emp.photoName);  
		},
		error : function(request) {
			alert("message:" + request.responseText + "\n");
		}
	});	

	
}

var flag = false;
function chkAll() {
	
    var chk = document.getElementsByName("chk");
    if (flag == false) { //선택 x
        flag = true;

        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = true;
        }

    } else {
        flag = false;
        for (var i = 0; i < chk.length; i++) {
            chk[i].checked = false;
        }
    }

}
</script>

</html>