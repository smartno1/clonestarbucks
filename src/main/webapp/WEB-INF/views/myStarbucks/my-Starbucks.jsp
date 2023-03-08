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
        <link rel="stylesheet" type="text/css" href="/css/myStarbucks.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div class="toptitle">
                <div class="toptitle-bg">
                    <div class="toptitle-tt">
                        <h4><img alt="My 음료/매장" src="/images/my_Starbucks/ms_ttl.png"></h4>
                        <ul class="smap">
                            <li><a href="/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="작은 맵 화살표"></li>
                            <li><a href="/myStarbucks/index">My Starbucks</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-all">
                <div class="main-all-bg" >
                    <nav class="ms_nav" id="msRnb">
                        <ul>
                            <li>
                                <a href="javascript:void(0);" class="sbox">My 리워드<span class="sbox_arrow_down" ></span></a>
                                <ul style="display: none">
                                    <!-- 160609 텍스트 수정 -->
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/reward.do">· 리워드 및 혜택</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/reward_star_history.do">· 별 히스토리</a></li>
                                    <!-- 160609 텍스트 수정 end -->
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="sbox">My 스타벅스 카드<span class="sbox_arrow_down"></span></a>
                                <ul style="display: none">
                                    <!-- 160609 텍스트 수정 -->
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/mycard_index.do">· 보유 카드</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/mycard_info_input.do">· 카드 등록</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/mycard_charge.do">· 카드 충전</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/mycard_lost.do">· 분실신고/잔액이전</a></li>
                                    <!-- 160609 텍스트 수정 end -->
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="sbox">My 스타벅스 e-Gift Card<span class="sbox_arrow_down"></span></a>
                                <ul style="display: none">
                                    <li><a href="javascript:void(0);" required="login" data-href="/msr/sceGift/gift_step1.do">· 선물하기</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/egiftCard.do">· 선물 내역</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/egiftCard_shopping_bag.do">· 장바구니 내역</a></li>
                                </ul>
                            </li>
                            <li class="msRnb_btn">
                                <a href="javascript:void(0);" class="sbox" required="login" data-href="javascript:void(0);">My 쿠폰<span class="sbox_arrow_down"></span></a>
                                <ul style="display: none">
                                    <li><a href="/my/ecoupon.do?t=REG">· 등록하기</a></li>
                                    <li><a href="/my/ecoupon.do?t=GIFT">· 선물하기</a></li>
                                    <li><a href="/my/ecoupon.do?t=USE">· 사용하기</a></li>
                                </ul>
                            </li>
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/my/calendar.do">My 캘린더</a></li>
                            <!-- <li class="msRnb_btn"><a href="/my/drink_shop.do" required="login">My 음료/매장</a></li> -->
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/my/my_menu.do">My 메뉴</a></li>



                            <li>
                                <a href="/myStarbucks/vocList" required="login" data-href="/my/vocList.do">My 고객의 소리</a>
                            </li>
                            <!-- <li class="msRnb_btn"><a href="/my/order_status_list.do" required="login">케익 주문 현황</a></li> -->
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/my/eReceiptList.do">전자영수증</a></li>
                            <li class="msRnb_btn"><a href="javascript:void(0);" onclick="fn_rewardTumblerMsrCheck();">개인컵 리워드 설정</a></li>
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/edt/expressDtList.do">My DT Pass</a></li>
                            <li>
                                <a href="javascript:void(0);" class="sbox">개인정보관리<span class="sbox_arrow_down"></span></a>
                                <ul>
                                    <li><a href="/member/my_info">· 개인정보확인 및 수정</a></li>
                                    <li><a href="/member/myinfo_out" required="login" data-href="/my/myinfo_out.do">· 회원 탈퇴</a></li>
                                    <li><a href="/member/myinfo_modify_pwd" required="login" data-href="/my/myinfo_modify_pwd.do">· 비밀번호 변경</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <div class="mybox_lave">
                        <section class="ms_user_info ms_user_add">
                            <article class="ms_user_info_left">
                                <h5><span class="en">My</span> 리워드</h5>
                                <div class="plcc-logo" style="display:none;">
                                    <img src="/common/img/util/plcc-logo.png" >
                                </div>
                                <figure class="en ms_user_starbg">
                                    <span class="totalStar">${loginUser.level}</span>
                                </figure>
                                <p class="ms_user_stat_notice">
                                    <strong>21</strong>개의 별★이 더 모이면<br>
                                    <strong class="en t_bd9b60">Gold Level</strong>
                                    만의 특별한 혜택이!</p>
                            </article>
                            <article class="ms_user_info_right">
                                <p class="ms_user_stat">
                                    <span><strong class="userName">${loginUser.name}</strong> 님은</span>
                                    <span>현재 <strong class="en userGrade t_0d5f34">Green Level</strong>이십니다.</span></p>
                                <div class="plcc-logo" style="display:none;">
                                    <img src="/common/img/util/plcc-logo.png" >
                                </div>
                                <div class="ms_user_stat_btns">
                                    <ul>
                                        <li><a href="./reward.do">리워드 및 혜택</a></li>
                                        <li><a href="./reward_star_history.do">별 히스토리</a></li>
                                        <li class="btn_black"><a href="/member/my_info">개인정보 수정</a></li>
                                        <li class="btn_gray"><a class="gray" href="/member/myinfo_modify_pwd">비밀번호 변경</a></li>
                                    </ul>
                                </div>
                            </article>

                        </section>

                    </div>

                    <div class="mycad_roll" >
                        <div class="my_ms_card_inner">
                            <div class="card_head">
                                <h5><span class="en">My</span> 스타벅스 카드</h5>
                                <p class="recent_card">총 보유카드 : 1장</p>
                                <aside>
                                    <span><strong class="curSlideNo">1</strong>/<span class="totalCnt">1</span></span>
                                    <p>
                                        <a class="back" href="javascript:void(0);">이전카드 보기</a>
                                        <a class="forward" href="javascript:void(0);">다음카드 보기</a>
                                    </p>
                                </aside>

                                <i class="card_list_btn1">
                                    <a href="javascript:void(0);">
                                        <img src="//image.istarbucks.co.kr/common/img/util/card_list_btn1.png" alt="보유카드 상세정보">
                                    </a>
                                </i>

                            </div>
                            <div class="my_ms_card_cont">
                                <div class="bx-wrapper" >
                                    <div class="bx-viewport" >
                                        <ul class="slider" >
                                            <li class="bx-clone">
                                                <figure>
                                                    <i class="representative_icon" aria-hidden="true"></i>
                                                    <img alt="스타벅스 e카드" src="https://image.istarbucks.co.kr/cardImg/20200108/.png" onerror="this.src='https://image.istarbucks.co.kr/upload/common/img/icon/card_672x423.png';">
                                                </figure>
                                                <div class="my_ms_card_info">
                                                    <p class="my_ms_card_id">
                                                        <span>스타벅스 e카드</span>
                                                        <a href="javascript:void(0);" class="icon_pencil" data-cardstatus="R" data-cardnickname="스타벅스 e카드" title=" 카드명 수정">정보수정</a>
                                                    </p>
                                                    <p class="my_ms_card_id_modify" style="display:none;">
                                                        <label class="a11y" for="cardName_">카드명</label>
                                                        <input class="my_nick_modify_input" id="cardName_" type="text" maxlength="20" value="스타벅스 e카드">
                                                        <a class="my_nick_modify" href="javascript:void(0);" data-cardregnumber="46295672" role="button" title="카드명 수정">수정</a><a class="my_nick_cancel" href="javascript:void(0);" role="button">취소</a>
                                                    </p>
                                                    <p class="my_ms_card_price">
                                                        <span class="a11y">잔여금액</span>
                                                        <strong class="en t_0d5f34">300</strong>원
                                                    </p>
                                                    <p class="my_ms_card_date">
                                                        최종 사용일 : <span class="en">2022-04-08 11:24:42</span>
                                                    </p>
                                                    <div class="my_ms_card_btns">
                                                        <p class="my_ms_card_btn1">
                                                            <a href="javascript:void(0);" data-type="MANAGEMENT">카드 관리</a>
                                                        </p>
                                                        <p class="my_ms_card_btn2">
                                                            <a href="javascript:void(0);" data-type="CHARGE" >충전하기</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li >
                                                <figure>
                                                    <i class="representative_icon" aria-hidden="true"></i>
                                                    <img alt="스타벅스 e카드" src="https://image.istarbucks.co.kr/cardImg/20200108/.png" onerror="this.src='https://image.istarbucks.co.kr/upload/common/img/icon/card_672x423.png';">
                                                </figure>
                                                <div class="my_ms_card_info">
                                                    <p class="my_ms_card_id">
                                                        <span>스타벅스 e카드</span>
                                                        <a href="javascript:void(0);" class="icon_pencil" data-cardstatus="R" data-cardnickname="스타벅스 e카드" title=" 카드명 수정">정보수정</a>
                                                    </p>
                                                    <p class="my_ms_card_id_modify" style="display:none;">
                                                        <label class="a11y" for="cardName_">카드명</label>
                                                        <input class="my_nick_modify_input" id="cardName_" type="text" maxlength="20" value="스타벅스 e카드">
                                                        <a class="my_nick_modify" href="javascript:void(0);" data-cardregnumber="46295672" role="button" title="카드명 수정">수정</a>
                                                        <a class="my_nick_cancel" href="javascript:void(0);" role="button">취소</a>
                                                    </p>
                                                    <p class="my_ms_card_price"><span class="a11y">잔여금액</span>
                                                        <strong class="en t_0d5f34">300</strong>원</p>
                                                    <p class="my_ms_card_date">
                                                        최종 사용일 : <span class="en">2022-04-08 11:24:42</span>
                                                    </p>
                                                    <div class="my_ms_card_btns">
                                                        <p class="my_ms_card_btn1">
                                                            <a href="javascript:void(0);" data-type="MANAGEMENT" data-cardregnumber="46295672">카드 관리</a>
                                                        </p>
                                                        <p class="my_ms_card_btn2">
                                                            <a href="javascript:void(0);" data-type="CHARGE" data-cardregnumber="46295672">충전하기</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li  class="bx-clone">
                                                <figure>
                                                    <i class="representative_icon" aria-hidden="true"></i>
                                                    <img alt="스타벅스 e카드" src="https://image.istarbucks.co.kr/cardImg/20200108/.png" onerror="this.src='https://image.istarbucks.co.kr/upload/common/img/icon/card_672x423.png';">
                                                </figure>
                                                <div class="my_ms_card_info">
                                                    <p class="my_ms_card_id">
                                                        <span>스타벅스 e카드</span>
                                                        <a href="javascript:void(0);" class="icon_pencil" data-cardstatus="R" data-cardnickname="스타벅스 e카드" title=" 카드명 수정">정보수정</a>
                                                    </p>
                                                    <p class="my_ms_card_id_modify" style="display:none;">
                                                        <label class="a11y" for="cardName_">카드명</label>
                                                        <input class="my_nick_modify_input" id="cardName_" type="text" maxlength="20" value="스타벅스 e카드">
                                                        <a class="my_nick_modify" href="javascript:void(0);" data-cardregnumber="46295672" role="button" title="카드명 수정">수정</a>
                                                        <a class="my_nick_cancel" href="javascript:void(0);" role="button">취소</a>
                                                    </p>
                                                    <p class="my_ms_card_price"><span class="a11y">잔여금액</span>
                                                        <strong class="en t_0d5f34">300</strong>원</p>
                                                    <p class="my_ms_card_date">
                                                        최종 사용일 : <span class="en">2022-04-08 11:24:42</span>
                                                    </p>
                                                    <div class="my_ms_card_btns">
                                                        <p class="my_ms_card_btn1">
                                                            <a href="javascript:void(0);" data-type="MANAGEMENT" data-cardregnumber="46295672">카드 관리</a>
                                                        </p>
                                                        <p class="my_ms_card_btn2"><a href="javascript:void(0);" data-type="CHARGE" data-cardregnumber="46295672">충전하기</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>

                        </div>


                    </div>
                    <div class="icon_ber">
                        <div class="my_ms_per_icon">
                            <ul>
                                <li class="my_ms_per_icon1">
                                    <a href="javascript:void(0);">
                                        <span class="icon"></span>
                                        <span class="txt">전자영수증</span> <!-- 20210302 수정(인박스-전자영수증으로 변경) -->
                                    </a>
                                </li>
                                <li class="my_ms_per_icon2">
                                    <a href="javascript:void(0);">
                                        <span class="icon"></span>
                                        <span class="txt">캘린더</span>
                                    </a>
                                </li>
                                <li class="my_ms_per_icon3">
                                    <a href="javascript:void(0);">
                                        <span class="icon"><strong class="validCouponCnt">1</strong></span>
                                        <span class="txt">e-쿠폰</span>
                                    </a>
                                </li>
                                <li class="my_ms_per_icon4">
                                    <a href="/my/mycard_charge.do">
                                        <span class="icon"></span>
                                        <!-- 160609 텍스트 수정 -->
                                        <span class="txt">카드 충전</span>
                                        <!-- 160609 텍스트 수정 end -->
                                    </a>
                                </li>
                                <li class="my_ms_per_icon5">
                                    <a href="/my/mycard_info_input.do">
                                        <span class="icon"></span>
                                        <!-- 160609 텍스트 수정 -->
                                        <span class="txt">카드 등록</span>
                                        <!-- 160609 텍스트 수정 end -->

                                    </a>
                                </li>
                            </ul>
                        </div >
                    </div>   <!--아이콘바끝 -->
                    <!-- 추천상품시작-->
                    <div class="my_ms_rank">
                        <form name="edwForm" method="post">
                            <fieldset>
                                <legend>스타벅스 메뉴 순위 폼</legend>
                                <div class="my_ms_rank_head">
                                    <p class="p1">스타벅스 코리아를 사랑하는</p>
                                    <div class="my_ms_select">
                                        <label for="my_ms_age" class="a11y">연령대</label><!-- 접근성_20171201 class 추가, 텍스트 수정 -->
                                        <select id="my_ms_age" class="rank_select"><!-- 접근성_20171201 class 추가 -->
                                            <option value="10">10대</option>
                                            <option value="20">20대</option>
                                            <option value="30">30대</option>
                                            <option value="40" selected="selected">40대</option>
                                            <option value="50">50대</option>
                                        </select>
                                    </div>
                                    <div class="my_ms_select">
                                        <label for="my_ms_select" class="a11y">성별</label><!-- 접근성_20171201 class 추가, 텍스트 수정 -->
                                        <select id="my_ms_select" class="rank_select"><!-- 접근성_20171201 class 추가 -->
                                            <option value="M" selected="selected">남성</option>
                                            <option value="F">여성</option>
                                        </select>
                                    </div>
                                    <!-- 150706 DOM 수정 - 텍스트 수정 -->
                                    <p class="my_ms_last_txt">이 즐기는 메뉴가 궁금하시죠?</p>
                                    <!-- 150706 DOM 수정 - 텍스트 수정 end -->
                                    <a href="javascript:void(0)" class="my_ms_setBtn" role="button" title="메뉴 확인하기">확인</a><!-- 접근성_20171201 확인버튼 추가 -->
                                </div>
                                <span class="criteria">스타벅스 리워드<br>최근 일주일 판매 집계 기준</span> <!-- 스타벅스 리워드 수정 -->
                                <article class="my_ms_rank_wrap">
                                    <div class="my_ms_rank_each my_ms_rank_each1">
                                        <div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
                                            <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 317px;">
                                                <ul class="edw1" style="width: 1115%; position: relative; transition-duration: 0.5s; transform: translate3d(-1225px, 0px, 0px);">
                                                <li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">
                                                    <h1>부문별 음료 판매 순위<br><strong>콜드 브루</strong></h1>
                                                    <figure>
                                                        <a href="javascript:void(0);" class="goDrink" data-sku="9200000000487">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000487]_20210430112319040.jpg"></a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="javascript:void(0);" class="goDrink" data-sku="9200000000487">바닐라 크림 콜드 브루</a>
                                                    </p>
                                                    <p class="second_rank">
                                                        <span class="left"><strong>2위</strong></span>
                                                        <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000000038">콜드 브루</a></span>
                                                    </p>
                                                    <p class="third_rank">
                                                        <span class="left"><strong>3위</strong></span>
                                                        <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000002081">돌체 콜드 브루</a></span>
                                                    </p>
                                                </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>에스프레소</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="94">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[94]_20210430103337006.jpg">
                                                            </a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="94">카페 아메리카노</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="110563">아이스 카페 아메리카노</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="41">카페 라떼</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>프라푸치노</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="168016">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[168016]_20210415154152122.jpg">
                                                            </a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="168016">P 자바 칩 프라푸치노</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000002760">더블 에스프레소 칩 프라푸치노</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="168066">P 초콜릿 크림 칩 프라푸치노</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>블렌디드</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="9200000003276">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000003276]_20210416154001403.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goDrink" data-sku="9200000003276">딸기 딜라이트 요거트 블렌디드</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="169001">망고 바나나 프라푸치노</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000004512">망고 패션 티 블렌디드</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>기타 제조 음료</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goDrink" data-sku="9200000003813">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2023/01/[9200000003813]_20230131134054082.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="9200000003813"> 봄 딸기 라떼</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="72">시그니처 핫 초콜릿</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="110621">아이스 시그니처 초콜릿</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                    <h1>부문별 음료 판매 순위<br><strong>브루드 커피</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="2">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[2]_20210430111934117.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="2">오늘의 커피</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="106509">아이스 카페 아메리카노</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="107031">카페 라떼</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>스타벅스 피지오</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goDrink" data-sku="107051">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[107051]_20210419112151972.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="107051">쿨 라임 피지오</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000004121">유자 패션 피지오</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="107031">패션 탱고 티 레모네이드 피지오</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>스타벅스 주스(병음료)</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="5210008070">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[5210008070]_20210426095034991.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goDrink" data-sku="5210008070">딸기주스 190M</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9300000003775">딸기 가득 요거트 190M</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9300000002565">햇사과 주스 190M</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>티</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="9200000000190">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000190]_20210419131723532.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goDrink" data-sku="9200000000190">쉐이큰 자몽허니 블랙티</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000000187">자몽허니 블랙티</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000002956">유자 민트 티</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 음료 판매 순위<br><strong>콜드 브루</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goDrink" data-sku="9200000000487">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000487]_20210430112319040.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goDrink" data-sku="9200000000487">바닐라 크림 콜드 브루</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000000038">콜드 브루</a></span>	</p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="9200000002081">돌체 콜드 브루</a></span>
                                                        </p></li><li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">
                                                    <h1>부문별 음료 판매 순위<br><strong>에스프레소</strong></h1>
                                                    <figure>
                                                        <a href="javascript:void(0);" class="goDrink" data-sku="94">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[94]_20210430103337006.jpg"></a></figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="javascript:void(0);" class="goDrink" data-sku="94">카페 아메리카노</a></p>
                                                    <p class="second_rank">
                                                        <span class="left"><strong>2위</strong></span>
                                                        <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="110563">아이스 카페 아메리카노</a></span>
                                                    </p>
                                                    <p class="third_rank">
                                                        <span class="left"><strong>3위</strong></span>
                                                        <span class="right"><a href="javascript:void(0);" class="goDrink" data-sku="41">카페 라떼</a></span>
                                                    </p>
                                                </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my_ms_rank_each my_ms_rank_each2">
                                        <div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
                                            <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 317px;">
                                                <ul class="edw2" style="width: 1115%; position: relative; transition-duration: 0s; transform: translate3d(-245px, 0px, 0px);">
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">
                                                        <h1>부문별 푸드 판매 순위<br><strong>브런치유어웨이</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goFood" data-sku="9300000002178">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/06/[9300000002178]_20210602104935718.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000002178">베이컨 치즈 토스트</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right">
                                                                <a href="javascript:void(0);" class="goFood" data-sku="5110003062">바비큐 치킨 치즈 치아바타</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000001927">에그에그 샌드위치</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 푸드 판매 순위<br><strong>브레드</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goFood" data-sku="9300000003334">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9300000003334]_20210310092057351.jpg">
                                                        </a></figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goFood" data-sku="9300000003334">리얼 블루베리 베이글</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000002445">스모크드 소시지 브레드</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000003223">바질 토마토 크림치즈 베이글</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 푸드 판매 순위<br><strong>케이크</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goFood" data-sku="5110007181"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[5110007181]_20210421164728509.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="5110007181">부드러운 생크림 카스텔라</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000003393">he 촉촉 초콜릿 생크림 케이크</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000000132">클라우드 치즈 케이크</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>샌드위치&amp;샐러드</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9300000002178"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/06/[9300000002178]_20210602104935718.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000002178">베이컨 치즈 토스트</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="5110003062">바비큐 치킨 치즈 치아바타</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000001927">에그에그 샌드위치</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>따뜻한 푸드</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9900000000680"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9900000000680]_20210426103936780.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9900000000680">판매트러플 머쉬룸 수프</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9900000001201">판매 토마토 로제 수프</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9900000001200">판매 단호박 크림 수프</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>과일&amp;요거트</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="5110009051"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[5110009051]_20210422111651003.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="5110009051">하루 한 컵 레드</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000001912">한라봉 가득 핸디 젤리</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000001911">사과 가득 핸디 젤리</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>스낵&amp;미니디저트</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9300000001924"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9300000001924]_20210421133005814.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000001924">다크 초콜릿 마카롱</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="5110008078">뉴 바닐라 마카롱</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="5110008075">뉴 블루베리 마카롱</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>아이스크림</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="5110009050"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[5110009050]_20210422110047018.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="5110009050">유기농 아이스크림 바닐라볼</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000000810">유기농 아이스크림 초콜릿볼</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9900000000171">자바 칩 유기농 아이스크림 초콜릿볼</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>프리미어 푸드</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9300000001785"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9300000001785]_20210422124351504.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000001785">리저브초콜릿 월넛 돔 쿠키</a></p></li><li style="float: left; list-style: none; position: relative; width: 245px;">	<header>부문별 푸드 판매 순위<br><strong>브런치유어웨이</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9300000002178"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/06/[9300000002178]_20210602104935718.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000002178">베이컨 치즈 토스트</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="5110003062">바비큐 치킨 치즈 치아바타</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000001927">에그에그 샌드위치</a></span>	</p></li><li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">	<header>부문별 푸드 판매 순위<br><strong>브레드</strong></header>	<figure><a href="javascript:void(0);" class="goFood" data-sku="9300000003334"><img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2021/03/[9300000003334]_20210310092057351.jpg"></a></figure>	<p class="first_bev">1위</p>	<p class="coffee_name"><a href="javascript:void(0);" class="goFood" data-sku="9300000003334">리얼 블루베리 베이글</a></p>	<p class="second_rank">		<span class="left"><strong>2위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000002445">스모크드 소시지 브레드</a></span>	</p>	<p class="third_rank">		<span class="left"><strong>3위</strong></span>		<span class="right"><a href="javascript:void(0);" class="goFood" data-sku="9300000003223">바질 토마토 크림치즈 베이글</a></span>	</p></li></ul></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
                                    </div>
                                    <div class="my_ms_rank_each my_ms_rank_each3">
                                        <div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
                                            <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 317px;">
                                                <ul class="edw3" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(-245px, 0px, 0px);">
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">
                                                        <h1>부문별 원두 판매 순위<br><strong>스타벅스 비아</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goCoffee" data-sku="11023539">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2016/01/[11023539]_20160120174040919.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goCoffee" data-sku="11023539">비아 콜롬비아 12개입</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11048092">비아 이탈리아 로스트 12개입</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11037745">비아 파이크 플레이스 로스트 12개입</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 원두 판매 순위<br><strong>스타벅스 원두</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goCoffee" data-sku="11017024">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/07/[11017024]_20150722231935988.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name">
                                                            <a href="javascript:void(0);" class="goCoffee" data-sku="11017024">에스프레소 로스트 250</a>
                                                        </p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11078143">스프링 시즌 블렌드 250</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11019857">콜롬비아 250</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 원두 판매 순위<br><strong>리저브 원두</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goCoffee" data-sku="11142545">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2023/01/[11142545]_20230117150815493.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goCoffee" data-sku="11142545">Reserve 케냐 티리크와 250</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11142544">Reserve 코스타리카 허니 프로세스 250</a>
                                                            </span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11080493">Reserve 크리스마스 250</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;">
                                                        <h1>부문별 원두 판매 순위<br><strong>스타벅스 비아</strong></h1>
                                                        <figure><a href="javascript:void(0);" class="goCoffee" data-sku="11023539">
                                                            <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2016/01/[11023539]_20160120174040919.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goCoffee" data-sku="11023539">비아 콜롬비아 12개입</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11048092">비아 이탈리아 로스트 12개입</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11037745">비아 파이크 플레이스 로스트 12개입</a></span>
                                                        </p>
                                                    </li>
                                                    <li style="float: left; list-style: none; position: relative; width: 245px;" class="bx-clone">
                                                        <h1>부문별 원두 판매 순위<br><strong>스타벅스 원두</strong></h1>
                                                        <figure>
                                                            <a href="javascript:void(0);" class="goCoffee" data-sku="11017024">
                                                                <img alt="" src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/07/[11017024]_20150722231935988.jpg"></a>
                                                        </figure>
                                                        <p class="first_bev">1위</p>
                                                        <p class="coffee_name"><a href="javascript:void(0);" class="goCoffee" data-sku="11017024">에스프레소 로스트 250</a></p>
                                                        <p class="second_rank">
                                                            <span class="left"><strong>2위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11078143">스프링 시즌 블렌드 250</a></span>
                                                        </p>
                                                        <p class="third_rank">
                                                            <span class="left"><strong>3위</strong></span>
                                                            <span class="right"><a href="javascript:void(0);" class="goCoffee" data-sku="11019857">콜롬비아 250</a></span>
                                                        </p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </fieldset>
                        </form>
                    </div>
                    <!--추천상품 -->
                </div>

            </div>
        </div>
        <%--바디 내용끝--%>
        <%--푸터 내용시작--%>
<%--        <jsp:include page="../include/footer.jsp"></jsp:include>--%>
        <%--푸터 내용끝--%>




<%--자바스크릡트 공간입니다.--%>

    <jsp:include page="../include/footer.jsp"></jsp:include>
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

        // 회원정보 수정시 메시지 띄우기 ------------------------------------//
        if(${msg == "mod-success"}){
            alert("회원 정보가 수정되었습니다.");
        }else if(${msg == "mod-failed"}){
            alert("회원 정보 수정에 실패하였습니다");
        }
    //  오른쪽 메뉴의 펼치기 기능 ------------------------------------------------//
    function msRnbShow() {
        document.getElementById('msRnb').addEventListener('click', e => {
            if (e.target.matches('.sbox_arrow_down')) {
                e.target.parentElement.nextElementSibling.style.display = 'block';
                e.target.classList.replace('sbox_arrow_down','sbox_arrow_up');
            }else if (e.target.matches('.sbox_arrow_up')) {
                e.target.parentElement.nextElementSibling.style.display = 'none';
                e.target.classList.replace('sbox_arrow_up','sbox_arrow_down');
            }else if(e.target.matches('.sbox')){
                e.target.nextElementSibling.style.display = 'block';
                e.target.classList.replace('sbox','sbox_up');
                e.target.firstElementChild.classList.replace('sbox_arrow_down','sbox_arrow_up');
            }else if(e.target.matches('.sbox_up')){
                e.target.nextElementSibling.style.display = 'none';
                e.target.classList.replace('sbox_up','sbox');
                e.target.firstElementChild.classList.replace('sbox_arrow_up','sbox_arrow_down');
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