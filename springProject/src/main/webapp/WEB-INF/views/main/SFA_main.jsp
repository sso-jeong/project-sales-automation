<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/menu/USER_HEADER.jsp"%>
<body onload="printClock()">
	<%@ include file="/WEB-INF/views/include/menu/MODAL.jsp"%>
	<%@ include file="/WEB-INF/views/include/menu/MENU.jsp"%>
    <main>
        <div class="middle m-tb10">
            <div class="main-wrap1  flex flex-justify">
                <div class="main-notice-wrap">
                    <div class="notice m-lr10 flex flex-justify">
                        <h3 class="font16 noto m-t10 m-b5">공지사항 알림글</h3>
                        <span class="m-t10 m-b5">
                            <a href="sfa_notice.html" title="공지사항으로 이동" target="_blank" alt="" class="font16"><i
                                    class="fas fa-share-square"></i></a>
                        </span>
                    </div>
                    <div class="tbl-wrap m-b10 m-lr10">
                        <div class="notice-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="notice-left">
                                <p class="noto weight700 font14">
                                    <a href="SFA_notice_view.html" target="_blank">
                                        <span style="color:#d92550; margin-right:10px;">[공지]</span>
                                        안녕하세요. SFA에서 공지를 알려드립니다.
                                    </a>
                                </p>
                            </div>
                            <div class="notice-right">
                                <span class="noto font14" style="color:#555;">09.10</span>
                            </div>
                        </div>
                        <div class="notice-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="notice-left">
                                <p class="noto weight700 font14">
                                    <a href="SFA_notice_view.html" target="_blank">
                                        <span style="color:#d92550; margin-right:10px;">[공지]</span>
                                        게시물 등록 테스트입니다.
                                    </a>
                                </p>
                            </div>
                            <div class="notice-right">
                                <span class="noto font14" style="color:#555;">09.10</span>
                            </div>
                        </div>
                        <div class="notice-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="notice-left">
                                <p class="noto weight700 font14">
                                    <a href="SFA_notice_view.html" target="_blank">
                                        <span style="color:#d92550; margin-right:10px;">[공지]</span>
                                        게시물 등록 테스트입니다. 공지가 잘 들어갔는지 테스트 중입니다.
                                    </a>
                                </p>
                            </div>
                            <div class="notice-right">
                                <span class="noto font14" style="color:#555;">09.10</span>
                            </div>
                        </div>
                        <div class="notice-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="notice-left">
                                <p class="noto weight700 font14">
                                    <a href="SFA_notice_view.html" target="_blank">
                                        <span style="color:#d92550;margin-right:10px;">[공지]</span>
                                        게시물 등록 테스트 중입니다. 작성자는 관리자입니다.
                                    </a>
                                </p>
                            </div>
                            <div class="notice-right">
                                <span class="noto font14" style="color:#555;">09.10</span>
                            </div>
                        </div>
                        <div class="notice-content flex flex-justify p-tb10" style="border-bottom:1px solid #e7e7e7;">
                            <div class="notice-left">
                                <p class="noto weight700 font14">
                                    <a href="SFA_notice_view.html" target="_blank">
                                        <span style="color:#d92550; margin-right:10px;">[공지]</span>
                                        안녕하세요. SFA에서 공지를 알려드립니다.
                                    </a>
                                </p>
                            </div>
                            <div class="notice-right">
                                <span class="noto font14" style="color:#555;">09.10</span>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="file-wrap">
                    <div class="file m-lr10 flex flex-justify">
                        <h3 class="noto font16 m-t10 m-b5">결재 대기 문서</h3>
                        <span class="m-t10 m-b5">
                            <a href="SFA_approval_ready.html" title="결재 대기 문서로 이동" alt="" class="font16"><i
                                    class="fas fa-share-square"></i></a>
                        </span>
                    </div>

                    <div class="app-content m-t10 m-lr10">
                        <div style="border-bottom:1px solid #e7e7e7; padding-bottom:10px;"
                            class="app-list flex flex-justify noto weight700 font14">
                            <div class="app-date center" style="width:15%;">기안일</div>
                            <div class="app-form center" style="width:15%;">결재양식</div>
                            <div class="app-subject center" style="width:50%;">결재문서제목</div>
                            <div class="app-file center" style="width:20%;">첨부</div>
                        </div>
                        <div class="p-t10">
                            <div style="border-bottom:1px solid #e7e7e7;"
                                class="app-list flex flex-justify noto font14 p-tb10">
                                <div class="app-date center" style="width:15%;">2020.09.16</div>
                                <div class="app-form center" style="width:15%;">업무일지</div>
                                <div class="app-subject left p-lr5" style="width:50%;">0916 업무일지입니다.</div>
                                <div class="app-file center" style="width:20%;">0916_업무일지.pdf</div>
                            </div>
                        </div>
                        <div class="p-t10">
                            <div style="border-bottom:1px solid #e7e7e7;"
                                class="app-list flex flex-justify noto font14 p-tb10">
                                <div class="app-date center" style="width:15%;">2020.09.16</div>
                                <div class="app-form center" style="width:15%;">업무일지</div>
                                <div class="app-subject left p-lr5" style="width:50%;">0916 업무일지입니다.</div>
                                <div class="app-file center" style="width:20%;">0916_업무일지.pdf</div>
                            </div>
                        </div>
                        <div class="p-t10">
                            <div style="border-bottom:1px solid #e7e7e7;"
                                class="app-list flex flex-justify noto font14 p-tb10">
                                <div class="app-date center" style="width:15%;">2020.09.16</div>
                                <div class="app-form center" style="width:15%;">업무일지</div>
                                <div class="app-subject left p-lr5" style="width:50%;">0916 업무일지입니다.</div>
                                <div class="app-file center" style="width:20%;">0916_업무일지.pdf</div>
                            </div>
                        </div>
                        <div class="p-t10">
                            <div style="border-bottom:1px solid #e7e7e7;"
                                class="app-list flex flex-justify noto font14 p-tb10">
                                <div class="app-date center" style="width:15%;">2020.09.15</div>
                                <div class="app-form center" style="width:15%;">수주처리</div>
                                <div class="app-subject  left p-lr5" style="width:50%;">0915 신진금속 수주 건입니다.</div>
                                <div class="app-file center" style="width:20%;">0915_신진금속.pdf</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tna-wrap">
                    <div class="tna m-lr10">
                        <h3 class="noto font16 m-t10 m-b5">근태관리</h3>
                        <span>${sessionScope.empid}|${sessionScope.empnm}|${sessionScope.deptid}|${sessionScope.grade}|${sessionScope.empauth}</span>
                    </div>

                    <div class="tbl-wrap m-b10 m-lr10">
                        <div class="main-attend">
                            <div class="m-t10 weight700 center"
                                style="border:1px solid #0C4A60; width:100%; height:30px; line-height:30px; color:#0C4A60;font-size:16px; text-align:center;"
                                id="clock">
                            </div>
                            <div class="attend flex flex-justify noto font14 weight700 m-t20">
                                <span>출근시간</span>
                                <span>AM 08:55</span>
                            </div>
                            <div class="attend flex flex-justify noto font14 weight700 m-t15">
                                <span>퇴근시간</span>
                                <span>PM -</span>
                            </div>
                            <div class="attend flex flex-justify noto font14 weight700 m-t15">
                                <span>현재상태</span>
                                <span>
                                    <select class="sel-attend">
                                        <option value="">업무중</option>
                                        <option value="">외근중</option>
                                        <option value="">퇴근</option>
                                    </select>
                                </span>
                            </div>
                            <div class="attend flex flex-justify noto font14 weight700 m-t20">
                                <button class="noto font14 weight700 attend-btn-on">출근하기</button>
                                <button class="noto font14 weight700 attend-btn-off">퇴근하기</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="main-wrap2  flex flex-justify">
                <div class="calendar-wrap" style=" width: 39.2%;">
                    <div class="calendar m-lr10 flex flex-justify">
                        <h3 class="noto font16 m-t10 m-b5">일정 안내</h3>
                        <span class="m-t10 m-b5">
                            <a href="sfa_schedule.html" title="일정관리로 이동" alt="" class="font16"><i
                                    class="fas fa-share-square"></i></a>
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
                                            <input type="text" placeholder="일정을 입력해주세요." id="input-box"
                                                class="input-box">
                                            <button type="button" id="input-data" class="input-data noto">추가</button>
                                            <div id="input-list" class="input-list"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-right">
                                    <table id="calendar" class="center">
                                        <thead>
                                            <tr class="btn-wrap clearfix">
                                                <td>
                                                    <label id="prev" style="cursor: pointer;">
                                                        &#60;
                                                    </label>
                                                </td>
                                                <td class="center" id="current-year-month" colspan="5"></td>
                                                <td>
                                                    <label id="next" style="cursor: pointer;">
                                                        &#62;
                                                    </label>
                                                </td>
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
                                        <tbody id="calendar-body" class="calendar-body noto" style="cursor: pointer;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sale-wrap" style="width: 60%;margin-top: 15px;">
                    <div class="sale m-lr10 flex flex-justify">
                        <h3 class="font16 noto m-t10 m-b5">SFA 수주</h3>
                        <span class="m-t10 m-b5">
                            <a href="sfa_order_manage.html" title="수주관리로 이동" alt="" class="font16"><i
                                    class="fas fa-share-square"></i></a>
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
                                <td class="td-5">10</td>
                                <td class="td-5">4</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>(재)부산테크노파크</nobr>
                                </td>
                                <td class="td-7">박승완</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-720-8926/<br>051-720-8927</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 기장군 일광면
                                        횡계길 7 (해양생물산업육성센터)</nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>www.btp.or.kr</nobr>
                                </td>
                                <td class="td-10">김승완/<br>010-7789-4456</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">9</td>
                                <td class="td-5">10</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>(주) 송림드리움</nobr>
                                </td>
                                <td class="td-7">박태정</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-862-8170/<br>051-860-8171</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 연제구 과정로287번길 52 (연산동) (총 2 필지)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">김태정/<br>010-6589-1254</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">8</td>
                                <td class="td-5">28</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신일테크</nobr>
                                </td>
                                <td class="td-7">이선용</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-324-5039/<br>051-324-5040</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 사상구 강변대로456번길 38 (엄궁동, 신일테크)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>www.shiniltech.co.kr</nobr>
                                </td>
                                <td class="td-10">박용선/<br>010-7854-3652</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">7</td>
                                <td class="td-5">30</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신정산업사</nobr>
                                </td>
                                <td class="td-7">김효준</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">도금</td>
                                <td class="td-10">051-324-5039/<br>051-324-5040</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 사하구 다대로300번길 15 (장림동)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">이준효/<br>010-4569-7896</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">6</td>
                                <td class="td-5">32</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신정테크</nobr>
                                </td>
                                <td class="td-7">강동현</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">도금</td>
                                <td class="td-10">051-415-4429/<br>051-415-4430</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 영도구 대평로20번길 13 (대평동1가)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">김현동/<br>010-1234-5698</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">5</td>
                                <td class="td-5">4</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>(재)부산테크노파크</nobr>
                                </td>
                                <td class="td-7">박승완</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-720-8926/<br>051-720-8927</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 기장군 일광면
                                        횡계길 7 (해양생물산업육성센터)</nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>www.btp.or.kr</nobr>
                                </td>
                                <td class="td-10">김승완/<br>010-7789-4456</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">4</td>
                                <td class="td-5">10</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>(주) 송림드리움</nobr>
                                </td>
                                <td class="td-7">박태정</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-862-8170/<br>051-860-8171</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 연제구 과정로287번길 52 (연산동) (총 2 필지)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">김태정/<br>010-6589-1254</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">3</td>
                                <td class="td-5">28</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신일테크</nobr>
                                </td>
                                <td class="td-7">이선용</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">제조</td>
                                <td class="td-10">051-324-5039/<br>051-324-5040</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 사상구 강변대로456번길 38 (엄궁동, 신일테크)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>www.shiniltech.co.kr</nobr>
                                </td>
                                <td class="td-10">박용선/<br>010-7854-3652</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">2</td>
                                <td class="td-5">30</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신정산업사</nobr>
                                </td>
                                <td class="td-7">김효준</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">도금</td>
                                <td class="td-10">051-324-5039/<br>051-324-5040</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 사하구 다대로300번길 15 (장림동)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">이준효/<br>010-4569-7896</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="center">
                                <td class="td-5">1</td>
                                <td class="td-5">32</td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>신정테크</nobr>
                                </td>
                                <td class="td-7">강동현</td>
                                <td class="td-7">제조업</td>
                                <td class="td-7">도금</td>
                                <td class="td-10">051-415-4429/<br>051-415-4430</td>
                                <td class="td-17 left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>부산광역시 영도구 대평로20번길 13 (대평동1가)
                                    </nobr>
                                </td>
                                <td class="left p-lr5" style="text-overflow: ellipsis; overflow: hidden;">
                                    <nobr>-</nobr>
                                </td>
                                <td class="td-10">김현동/<br>010-1234-5698</td>
                                <td class="center">-</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
<script src="${pageContext.request.contextPath}/js/main_cal.js"></script>
<script>
    function printClock() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        var dayList = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];


        if (dd < 10) {
            dd = '0' + dd
        }

        if (mm < 10) {
            mm = '0' + mm
        }

        today = yyyy + '년' + '&nbsp' + mm + '월' + '&nbsp' + dd + '일' + '&nbsp' + dayList[today.getDay()];

        var clock = document.getElementById("clock"); // 출력할 장소 선택
        var currentDate = new Date(); // 현재시간
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate
            .getDate() // 현재 날짜
        var amPm = 'AM '; // 초기값 AM
        var currentHours = addZeros(currentDate.getHours(), 2);
        var currentMinute = addZeros(currentDate.getMinutes(), 2);
        var currentSeconds = addZeros(currentDate.getSeconds(), 2);

        if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            amPm = 'PM ';
            currentHours = addZeros(currentHours - 12, 2);
        }

        if (currentSeconds >= 50) { // 50초 이상일 때 색을 변환해 준다.
            currentSeconds = '<span style="color:#de1951;">' + currentSeconds + '</span>'
        }
        // clock.innerHTML = currentHours + ":" + currentMinute + ":" + currentSeconds +
        //     " <span style='font-size:16px;'>" + amPm + "</span>"; //날짜를 출력해 줌
        clock.innerHTML = today + " <span style='font-size:16px;'>" + amPm + "</span>" + currentHours + ":" +
            currentMinute +
            ":" + currentSeconds; //날짜를 출력해 줌

        setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
        var zero = '';
        num = num.toString();
        if (num.length < digit) {
            for (i = 0; i < digit - num.length; i++) {
                zero += '0';
            }
        }
        return zero + num;
    }
</script>

</html>