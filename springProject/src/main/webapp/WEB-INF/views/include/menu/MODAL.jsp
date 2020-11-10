<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- modal layer -->
    <!-- 바깥은 화면 전체 크기 -->
    <div class="modal-wrapper">
        <!-- 실제 모달 크기 -->
        <div class="modal">
            <div class="modal-title flex flex-justify">
                <h2 class="noto font16 m-b10">결재 양식 선택</h2>
                <h2 class="noto font16 m-b10">결재 라인 선택</h2>
            </div>
            <div class="modal-top flex flex-justify">
                <!--문서 폼 분류 -->
                <div class="" style="width: 250px;border:1px solid #d6dce7;">
                    <div class="form-list">
                        <ul id="ztree" class="ztree"></ul>
                    </div>
                </div>
                <!--문서 폼 -->
                <div class="" style="width: 900px;border:1px solid #d6dce7;margin:0 10px;padding: 30px;">
                    <iframe width="100%" height="600px" id="formIframe" frameborder="0" name="formIframe"
                        src="file/b_log.html" scrolling="auto">
                    </iframe>
                </div>
                <!--결재 라인 -->
                <div class="p10" style="width: 250px;border:1px solid #d6dce7;">
                    결재라인
                </div>
            </div>
            <div class="modal-bottom center m-t10">
                <button class="btn-on">문서선택</button>
                <button class="btn-off popup btn-close">선택취소</button>
            </div>
        </div>

    </div>
    <!-- modal layer -->