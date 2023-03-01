<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <%--헤더 잡코딩--%>
        <%@include file="../include/static-head.jsp"%>
        <title>마이 스타벅스 | Starbucks Korea</title>
        <%--마이페이지 CSS--%>
        <link rel="stylesheet" type="text/css" href="/css/findid.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div class="toptitle">

                <div class="find_mem_wrap">
                    <div class="find_mem_inner">

                        <strong class="find_mem_ttl">개인정보 확인 및 수정</strong>

                        <div class="find_mem_form">
                            <div class="find_mem_result">
                                <div class="find_mem_sally"><!-- 접근성_20171120 수정  -->
                                    <!-- <img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png" alt="" /> -->
                                </div><!-- 접근성_20171120 수정 end -->
                                <p class="mem_result_txt2">

                                    <span class="result_txt_sub">개인정보 수정을 위해 아래 인증 방법으로 본인 확인이 필요합니다.</span>
                                </p>
                            </div>

                            <div class="find_mem_name bd_none">
                                <strong>인증방식 선택</strong>
                                <p style="color:#666; font-size:14px; margin:0 0 10px 0;">본인 명의의 휴대폰, 아이핀을 통한 인증 방법입니다.</p>
                                <div class="mem_cert_wrap_v2">
                                    <ul class="pro1">
                                        <li class="li1">
                                            <figure class="fig1"><img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find1.jpg" alt="휴대폰 아이콘"></figure>
                                            <p class="p1">휴대폰 본인 인증</p>
                                            <p class="p2">본인 명의의 휴대폰으로 본인 인증을 통해, 개인정보 확인 및 수정하실 수 있습니다.</p>
                                            <p class="p3"><a href="javascript:void(0)" class="cert1" title="휴대폰 인증을 위한 새창 열기">인증하기</a></p><!-- 접근성_20171120 수정 -->
                                        </li>
                                        <li>
                                            <figure class="fig3 cert2"><img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find2.jpg" alt="아이핀 아이콘"></figure>
                                            <p class="p1">아이핀 (i-PIN) 인증</p>
                                            <p class="p2">아이핀 본인 인증을 통해, 개인정보 확인 및 수정하실 수 있습니다.</p>
                                            <p class="p3"><a href="javascript:void(0)" class="cert2" title="아이핀 본인 인증을 위한 새창 열기 ">인증하기</a></p><!-- 접근성_201711 수정 -->
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <%--바디 내용끝--%>
        <%--푸터 내용시작--%>
<%--        <jsp:include page="../include/footer.jsp"></jsp:include>--%>
        <%--푸터 내용끝--%>




<%--자바스크릡트 공간입니다.--%>
<div class="foodboot">
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var error = "${error}";
            var msg = "error is " + error;
            if (error) {
                alert(msg);
            }
        });
    function msRnbShow() {
        document.getElementById('msRnb').addEventListener('click', e => {
            if (e.target.matches('.sbox_arrow_down')) {
                e.target.parentElement.nextElementSibling.style.display = 'block';
                e.target.classList.remove('sbox_arrow_down');
                e.target.classList.add('sbox_arrow_up');
            }else if (e.target.matches('.sbox_arrow_up')) {
                e.target.parentElement.nextElementSibling.style.display = 'none';
                e.target.classList.remove('sbox_arrow_up');
                e.target.classList.add('sbox_arrow_down');
            }
        })
    }
    (function (){
        msRnbShow();
    })();

    </script>

<%--        <script id="cardList" type="text/x-jquery-tmpl">--%>
<%--                                            <li>--%>
<%--												<figure>--%>
<%--													{{if delegateCardYn == 'Y'}}--%>
<%--													<!-- 160125 김민호 시작 -->--%>
<%--													<!-- 접근성_20171201 aria 추가 -->--%>
<%--														<i class="representative_icon" aria-hidden="true"></i>--%>
<%--													<!-- 160125 김민호 end -->--%>
<%--													{{/if}}--%>
<%--													<img alt="${cardNickname}" src="${cardImgUrl}" onerror="this.src='https://image.istarbucks.co.kr/upload/common/img/icon/card_672x423.png';" />--%>
<%--												</figure>--%>
<%--                                                <div class="my_ms_card_info">--%>
<%--													{{if cardStatus == 'R'}}--%>
<%--                                                	    <p class="my_ms_card_id">--%>
<%--                                                        <span>${cardNickname}</span>--%>
<%--															<!-- 접근성_20171201 title 추가 -->--%>
<%--												            <a href="javascript:void(0);" class="icon_pencil" data-cardstatus="${cardStatus}"  data-cardNickname="${cardNickname}" title=" 카드명 수정">정보수정</a>--%>
<%--													    </p>--%>
<%--														<p class="my_ms_card_id_modify" style="display:none;">--%>
<%--														<label class="a11y" for="cardName_">카드명</label><!-- 접근성_20171201 label 추가 -->--%>
<%--															<input class="my_nick_modify_input" id="cardName_" type="text" maxlength="20" value="${cardNickname}" /><!-- 접근성_20171201 id 추가 -->--%>
<%--															<a class="my_nick_modify" href="javascript:void(0);" data-cardregnumber="${cardRegNumber}" role="button" title="카드명 수정">수정</a><!-- 접근성_20171201 role, title 추가 -->--%>
<%--															<a class="my_nick_cancel" href="javascript:void(0);" role="button">취소</a><!-- 접근성_20171201 role 추가 -->--%>
<%--														</p>--%>
<%--													{{/if}}--%>
<%--													{{if goldCardRegStatus == 'X' || goldCardRegStatus == 'R'}}--%>
<%--														<p class="my_ms_card_price"><span class="a11y">잔여금액</span><!-- 접근성_20171201 span 추가 --><strong class="en t_0d5f34">${$item.getBalance}</strong>원</p>--%>
<%--	                                                    <p class="my_ms_card_date">최종 사용일 : <span class="en">${balanceConfirmDate}</span></p>--%>
<%--	                                                    <div class="my_ms_card_btns">--%>
<%--															{{if cardStatus == 'R'}}--%>
<%--	                                                    	    <p class="my_ms_card_btn1"><a href="javascript:void(0);" data-type="MANAGEMENT" data-cardregnumber="${cardRegNumber}">카드 관리</a></p>--%>
<%--	                                                        	<p class="my_ms_card_btn2"><a href="javascript:void(0);" data-type="CHARGE" data-cardregnumber="${cardRegNumber}">충전하기</a></p>--%>
<%--															{{else [cardStatus == 'S']}}--%>
<%--																{{if balance > 0}}--%>
<%--																	{{if enableTransferYn == 'Y' }}--%>
<%--																		<p class="my_ms_card_btn1"><a href="javascript:void(0);" data-type="TRANSFER" data-cardregnumber="${cardRegNumber}" data-cardnickname="${cardNickname}" data-balance="${balance}">잔액 이전</a></p>--%>
<%--																	{{/if}}--%>
<%--																	{{if refundableYn == 'Y' }}--%>
<%--																		<p class="my_ms_card_btn1"><a href="javascript:void(0);" data-type="REFUND" data-cardregnumber="${cardRegNumber}" data-cardnickname="${cardNickname}" data-balance="${balance}">잔액 환불</a></p>--%>
<%--																	{{/if}}--%>
<%--																{{else}}--%>
<%--																	<p class="my_ms_card_btn1"><a href="javascript:void(0);" data-type="DELETE" data-cardregnumber="${cardRegNumber}">카드삭제</a></p>--%>
<%--																{{/if}}--%>
<%--															{{/if}}--%>
<%--	                                                    </div>--%>
<%--													{{else}}--%>
<%--														<p class="my_ms_state">${getGoldCardRegStatusText(goldCardRegStatus)}</p>--%>
<%--														<div class="my_ms_card_btns">--%>
<%--															<p class="my_ms_card_btn1"><a href="javascript:void(0);" data-type="MANAGEMENT" data-cardregnumber="${cardRegNumber}">카드 관리</a></p>--%>
<%--															{{if goldCardRegStatus == 'A'}}--%>
<%--																<p class="my_ms_card_btn2"><a href="javascript:void(0);" data-type="MODIFY_GOLD_INFO" data-cardregnumber="${cardRegNumber}">신청정보수정</a></p>--%>
<%--															{{/if}}--%>
<%--														</div>--%>
<%--                                                    {{/if}}--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                        </script>--%>
    </body>

</html>