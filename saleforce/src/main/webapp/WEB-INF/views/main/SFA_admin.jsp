<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>
<style>
.modal-wrapper {
	background-color: rgba(0, 0, 0, 0.3);
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	visibility: hidden;
	opacity: 0;
}

.modal-wrapper.open {
	visibility: visible;
	opacity: 1;
	transition: 0.3s;
}

.modal-wrapper.open .modal {
	opacity: 1;
}

.modal {
	width: 1500px;
	height: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	opacity: 0;
	border-radius: 5px;
	padding: 20px;
	box-shadow: -60px 0 100px -90px #000, 60px 0px 100px -90px #000;
}
</style>
</head>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<main>
	<div class="middle m-tb10">
		<div class="main-wrap1  flex flex-justify">
			<div class="notice-wrap">
				<div class="notice m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">공지사항 알림글</h3>
					<span class="m-t10 m-b5"> <a href="sfa_notice.html" title="공지사항으로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>
				<div class="tbl-wrap m-b10 m-lr10">
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트입니다. 공지가 잘 들어갔는지 테스트 중입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 게시물 등록 테스트 중입니다. 작성자는 관리자입니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
					<div class="notice-content flex flex-justify p-tb10" style="border-bottom: 1px solid #e7e7e7;">
						<div class="notice-left">
							<p class="noto weight700 font14">
								<a href="SFA_notice_view.html"> <span style="color: #d92550; margin-right: 10px;">[공지]</span> 안녕하세요. SFA에서 공지를 알려드립니다.
								</a>
							</p>
						</div>
						<div class="notice-right">
							<span class="noto font14" style="color: #555;">09.10</span>
						</div>
					</div>
				</div>
			</div>
			<div class="sale-wrap">
				<div class="sale m-lr10 flex flex-justify">
					<h3 class="font16 noto m-t10 m-b5">SFA 수주</h3>
					<span class="m-t10 m-b5"> <a href="sfa_order_manage.html" title="수주관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="tbl-wrap m-b10 m-lr10">
					<table id="sale" class="table center" style="table-layout: fixed;">
						<tr class="weight700 center">
							<td class="td-5">순번</td>
							<td class="td-7">거래처코드</td>
							<td class="td-13">거래처명</td>
							<td class="td-5">대표자명</td>
							<td class="td-5">업태</td>
							<td class="td-5">종목</td>
							<td class="td-10">전화/FAX</td>
							<td>주소</td>
							<td class="td-10">홈페이지</td>
							<td class="td-10">담당자/연락처</td>
							<td class="td-5">비고</td>
						</tr>
						<tr class="center">
							<td class="td-5">5</td>
							<td class="td-5">4</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>(재)부산테크노파크</nobr></td>
							<td class="td-7">박승완</td>
							<td class="td-7">제조업</td>
							<td class="td-7">제조</td>
							<td class="td-10">051-720-8926/<br>051-720-8927
							</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>부산광역시 기장군 일광면 횡계길 7 (해양생물산업육성센터)</nobr></td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>www.btp.or.kr</nobr></td>
							<td class="td-10">김승완/<br>010-7789-4456
							</td>
							<td class="center">-</td>
						</tr>
						<tr class="center">
							<td class="td-5">4</td>
							<td class="td-5">10</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>(주) 송림드리움</nobr></td>
							<td class="td-7">박태정</td>
							<td class="td-7">제조업</td>
							<td class="td-7">제조</td>
							<td class="td-10">051-862-8170/<br>051-860-8171
							</td>
							<td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>부산광역시 연제구 과정로287번길 52 (연산동) (총 2 필지) </nobr></td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>-</nobr></td>
							<td class="td-10">김태정/<br>010-6589-1254
							</td>
							<td class="center">-</td>
						</tr>
						<tr class="center">
							<td class="td-5">3</td>
							<td class="td-5">28</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>신일테크</nobr></td>
							<td class="td-7">이선용</td>
							<td class="td-7">제조업</td>
							<td class="td-7">제조</td>
							<td class="td-10">051-324-5039/<br>051-324-5040
							</td>
							<td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>부산광역시 사상구 강변대로456번길 38 (엄궁동, 신일테크) </nobr></td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>www.shiniltech.co.kr</nobr></td>
							<td class="td-10">박용선/<br>010-7854-3652
							</td>
							<td class="center">-</td>
						</tr>
						<tr class="center">
							<td class="td-5">2</td>
							<td class="td-5">30</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>신정산업사</nobr></td>
							<td class="td-7">김효준</td>
							<td class="td-7">제조업</td>
							<td class="td-7">도금</td>
							<td class="td-10">051-324-5039/<br>051-324-5040
							</td>
							<td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>부산광역시 사하구 다대로300번길 15 (장림동) </nobr></td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>-</nobr></td>
							<td class="td-10">이준효/<br>010-4569-7896
							</td>
							<td class="center">-</td>
						</tr>
						<tr class="center">
							<td class="td-5">1</td>
							<td class="td-5">32</td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>신정테크</nobr></td>
							<td class="td-7">강동현</td>
							<td class="td-7">제조업</td>
							<td class="td-7">도금</td>
							<td class="td-10">051-415-4429/<br>051-415-4430
							</td>
							<td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>부산광역시 영도구 대평로20번길 13 (대평동1가) </nobr></td>
							<td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;"><nobr>-</nobr></td>
							<td class="td-10">김현동/<br>010-1234-5698
							</td>
							<td class="center">-</td>
						</tr>
					</table>
				</div>
			</div>

		</div>

		<div class="main-wrap2  flex flex-justify">
			<div class="calendar-wrap">
				<div class="calendar m-lr10 flex flex-justify">
					<h3 class="noto font16 m-t10 m-b5">일정 안내</h3>
					<span class="m-t10 m-b5"> <a href="sfa_schedule.html" title="일정관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="cal-wrap m-b10 m-lr10">
					<div class="main">
						<div class="content-wrap">
							<div class="content-left">
								<div class="main-wrap">
									<div id="main-day" class="main-day"></div>
									<div id="main-date" class="main-date"></div>
								</div>
								<div class="todo-wrap">
									<div class="todo-title noto">일정리스트</div>
									<div class="input-wrap">
										<input type="text" placeholder="일정을 입력해주세요." id="input-box" class="input-box">
										<button type="button" id="input-data" class="input-data noto">추가</button>
										<div id="input-list" class="input-list"></div>
									</div>
								</div>
							</div>
							<div class="content-right">
								<table id="calendar" class="center">
									<thead>
										<tr class="btn-wrap clearfix">
											<td><label id="prev" style="cursor: pointer;"> &#60; </label></td>
											<td class="center" id="current-year-month" colspan="5"></td>
											<td><label id="next" style="cursor: pointer;"> &#62; </label></td>
										</tr>
										<tr>
											<td class="center sun noto">일</td>
											<td class="center noto">월</td>
											<td class="center noto">화</td>
											<td class="center noto">수</td>
											<td class="center noto">목</td>
											<td class="center noto">금</td>
											<td class="center noto sat">토</td>
										</tr>
									</thead>
									<tbody id="calendar-body" class="calendar-body" style="cursor: pointer;"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="stock-wrap">
				<div class="stock m-lr10 flex flex-justify">
					<h3 class="noto font16 m-t10 m-b5">현재 재고</h3>
					<span class="m-t10 m-b5"> <a href="sfa_stock_manage.html" title="재고관리로 이동" alt="" class="font16"><i class="fas fa-share-square"></i></a>
					</span>
				</div>

				<div class="tbl-wrap m-b10 m-lr10">
					<table id="stock" class="table center" style="table-layout: fixed;">
						<tr class="weight700 center">
							<td class="td-5">순번</td>
							<td class="td-7">재고코드</td>
							<td class="td-7">품목코드</td>
							<td>품목명</td>
							<td>규격</td>
							<td class="td-10">잔량(개)</td>
						</tr>
						<tr>
							<td class="td-5">10</td>
							<td class="td-7">11002-0107</td>
							<td class="td-7">11002</td>
							<td class="left p-lr5">30mm차륜형대공포용 고저각베어링</td>
							<td class="td-5 left p-lr5">30mm</td>
							<td class="td-7 right p-lr5">242,890</td>
						</tr>
						<tr>
							<td class="td-5">9</td>
							<td class="td-7">11004-0104</td>
							<td class="td-7">11004</td>
							<td class="left p-lr5">1대역 스파이럴안테나</td>
							<td class="td-5 left p-lr5">스파이럴</td>
							<td class="td-7 right p-lr5">703</td>
						</tr>
						<tr>
							<td class="td-5">8</td>
							<td class="td-7">11021-0127</td>
							<td class="td-7">11021</td>
							<td class="left p-lr5">GASKET,VOR/ILS ANTENNA</td>
							<td class="td-5 left p-lr5">ANTENNA</td>
							<td class="td-7 right p-lr5">19,996</td>
						</tr>
						<tr>
							<td class="td-5">7</td>
							<td class="td-7">11036-0136</td>
							<td class="td-7">11036</td>
							<td class="left p-lr5">프로펠러</td>
							<td class="td-5 left p-lr5">프로펠러</td>
							<td class="td-7 right p-lr5">1,115,217</td>
						</tr>
						<tr>
							<td class="td-5">6</td>
							<td class="td-7">11036-0136</td>
							<td class="td-7">11036</td>
							<td class="left p-lr5">프로펠러</td>
							<td class="td-5 left p-lr5">프로펠러</td>
							<td class="td-7 right p-lr5">1,115,217</td>
						</tr>
						<tr>
							<td class="td-5">5</td>
							<td class="td-7">11002-0107</td>
							<td class="td-7">11002</td>
							<td class="left p-lr5">30mm차륜형대공포용 고저각베어링</td>
							<td class="td-5 left p-lr5">30mm</td>
							<td class="td-7 right p-lr5">242,890</td>
						</tr>
						<tr>
							<td class="td-5">4</td>
							<td class="td-7">11004-0104</td>
							<td class="td-7">11004</td>
							<td class="left p-lr5">1대역 스파이럴안테나</td>
							<td class="td-5 left p-lr5">스파이럴</td>
							<td class="td-7 right p-lr5">703</td>
						</tr>
						<tr>
							<td class="td-5">3</td>
							<td class="td-7">11021-0127</td>
							<td class="td-7">11021</td>
							<td class="left p-lr5">GASKET,VOR/ILS ANTENNA</td>
							<td class="td-5 left p-lr5">ANTENNA</td>
							<td class="td-7 right p-lr5">19,996</td>
						</tr>
						<tr>
							<td class="td-5">2</td>
							<td class="td-7">11036-0136</td>
							<td class="td-7">11036</td>
							<td class="left p-lr5">프로펠러</td>
							<td class="td-5 left p-lr5">프로펠러</td>
							<td class="td-7 right p-lr5">1,115,217</td>
						</tr>
						<tr>
							<td class="td-5">1</td>
							<td class="td-7">11036-0136</td>
							<td class="td-7">11036</td>
							<td class="left p-lr5">프로펠러</td>
							<td class="td-5 left p-lr5">프로펠러</td>
							<td class="td-7 right p-lr5">1,115,217</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>

</body>
<script>
	$(function() {
		$("tr:nth-child(2n)").addClass("tr-even");
	})
</script>
<script src="js/main_cal.js"></script>


</html>