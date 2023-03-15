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
        <link rel="stylesheet" type="text/css" href="/css/member/myinfo_out.css">
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
                        <h4><img alt="My 음료/매장" src="/images/my_Starbucks/tit02.png"></h4>
                        <ul class="smap">
                            <li><a href="/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="작은 맵 화살표"></li>
                            <li><a href="/my/index.do">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-all">
                <div class="main-all-bg" >
                    <nav class="ms_nav" id="msRnb">
                        <ul>
                            <li>
                                <a href="javascript:void(0);">My 리워드<span class="sbox_arrow_down" ></span></a>
                                <ul style="display: none">
                                    <!-- 160609 텍스트 수정 -->
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/reward.do">· 리워드 및 혜택</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/reward_star_history.do">· 별 히스토리</a></li>
                                    <!-- 160609 텍스트 수정 end -->
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);">My 스타벅스 카드<span class="sbox_arrow_down"></span></a>
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
                                <a href="javascript:void(0);">My 스타벅스 e-Gift Card<span class="sbox_arrow_down"></span></a>
                                <ul style="display: none">
                                    <li><a href="javascript:void(0);" required="login" data-href="/msr/sceGift/gift_step1.do">· 선물하기</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/egiftCard.do">· 선물 내역</a></li>
                                    <li><a href="javascript:void(0);" required="login" data-href="/my/egiftCard_shopping_bag.do">· 장바구니 내역</a></li>
                                </ul>
                            </li>
                            <li class="msRnb_btn">
                                <a href="javascript:void(0);" required="login" data-href="javascript:void(0);">My 쿠폰<span class="sbox_arrow_down"></span></a>
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
                                <a href="/member/vocList" required="login" data-href="/my/vocList.do">My 고객의 소리</a>
                            </li>
                            <!-- <li class="msRnb_btn"><a href="/my/order_status_list.do" required="login">케익 주문 현황</a></li> -->
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/my/eReceiptList.do">전자영수증</a></li>
                            <li class="msRnb_btn"><a href="javascript:void(0);" onclick="fn_rewardTumblerMsrCheck();">개인컵 리워드 설정</a></li>
                            <li class="msRnb_btn"><a href="javascript:void(0);" required="login" data-href="/edt/expressDtList.do">My DT Pass</a></li>
                            <li>
                                <a href="javascript:void(0);">개인정보관리<span class="sbox_arrow_down"></span></a>
                                <ul>
                                    <li><a href="/member/my_info">· 개인정보확인 및 수정</a></li>
                                    <li><a href="/member/myinfo_out" required="login" data-href="/my/myinfo_out.do">· 회원 탈퇴</a></li>
                                    <li><a href="/member/myinfo_modify_pwd" required="login" data-href="/my/myinfo_modify_pwd.do">· 비밀번호 변경</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <div class="mem_info_wrap">
                        <div class="mem_txt_zone">
                            <p class="p1">
                                <span class="s1 userName">${loginUser.name}</span>님의
                                <span class="year">2023</span>년
                                <span class="month">2</span>월
                                <span class="date">26</span>일
                                <span class="end">현재 스타벅스 서비스 현황입니다.</span><br>
                                <span class="s2">아래 사항들을 확인하시고,</span>
                                <span class="s2 end">회원탈퇴에 대해 다시 한번 신중히 결정해주세요.</span>
                            </p>
                            <ul class="mem_level">
                                <li class="li1" style="color: rgb(0, 102, 51);">Green Level</li>
                                <li class="li2">유효한 스타벅스 별 : <span>4개</span></li>
                                <li class="li3">사용 가능한 쿠폰 : <span>0장</span></li>
                            </ul>
                        </div>
                    </div>
<%--                    나의 등금치 별 현황 / 쿠폰--%>
                    <div class="mem_tit_area_all"> <%--                    나의 등금치 카드보유현황--%>
                        <div class="mem_tit_area">
                                <p class="mem_tit"><span class="userName">아톰봉봉</span>님의 등록된 스타벅스 카드</p>
                                <p class="mem_my_card">총 보유카드 : 1장</p>
                        </div>

                    <table summary="나의 스타벅스 카드 웹 버전" class="myCardInfo mb50">
                        <caption class="hid">나의 스타벅스 카드, 카드명, 카드번호, 최종 사용일 카드 등록일, 잔액에 대한 테이블</caption>
                        <colgroup>
                            <col width="165">
                            <col width="121">
                            <col width="179">
                            <col width="159">
                            <col width="117">
                            <col width="89">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">카드</th>
                            <th scope="col">카드명</th>
                            <th scope="col">카드번호</th>
                            <th scope="col">최종 사용일</th>
                            <th scope="col">카드 등록일</th>
                            <th scope="col">잔액</th>
                        </tr>
                        </thead>
                        <tbody><tr>           <td><img src="https://image.istarbucks.co.kr/cardThumbImg/20200108/.png" alt="" class="cardImg"></td>           <td>스타벅스 e카드</td>           <td class="en">**** - **** - **02 - 1852</td>           <td class="en">2022-04-08 11:24:42</td>           <td class="en">2022-02-16 09:50:51</td>           <td class="b"><span class="en"><strong>300</strong></span>원</td>          </tr></tbody>
                    </table>
                    <div class="ms_warning">
                        <p class="myinfo_tit">스타벅스 리워드 서비스 해지 시 유의사항</p>

                        <div class="warning">
                            <ul>
                                <li>회원 탈퇴는 계정에 등록된 스타벅스 카드에 잔액이 없는 경우 또는 잔액이 있는 스타벅스 카드가 모두 등록 해지된 경우 가능합니다. 스타벅스 카드에 잔액이 있는 경우, 전액 소진, 잔액이전 또는 환불 신청 등을 통해 잔액이 0원이 된 후 회원 탈퇴가 가능합니다.</li>
                                <li>회원 탈퇴 시에는 고객님의 개인정보 및 등록된 스타벅스 카드의 정보가 모두 삭제되어 더 이상 스타벅스 리워드 혜택을 받으실 수 없습니다.</li>
                                <li>회원 탈퇴 시 등록 해지한 스타벅스 카드는 등록하지 않은 상태에서도 스타벅스에서 정상적으로 사용 가능하지만 별 적립, 분실신고 시 잔액보장 등의 스타벅스 리워드 혜택을 받으실 수 없습니다.</li>
                                <li>중지된 스타벅스 카드에 잔액이 있는 경우, 잔액이전 또는 환불을 통해 잔액이 0원이 되어야 회원 탈퇴가 가능하며, 중지된 스타벅스 카드는 재사용 또는 계정 재등록이 불가합니다. </li>
                                <li>골드카드는 수령 등록이 완료된 경우에만 회원 탈퇴가 가능합니다.</li>
                                <li>잔액이 남아있지 않은 골드카드는 탈퇴와 함께 자동으로 중지되어 재사용 또는 재등록이 불가합니다.</li>
                                <li>온라인 스토어에서 진행 중인 주문 내역 등이 있는 경우, 배송완료일로부터 9일 이후 회원 탈퇴가 가능합니다.</li><!-- 220901 수정 -->
                                <li>단체 주문 배달 서비스의 진행 중인 예약 주문 건이 있는 경우, 배달 완료 후 탈퇴할 수 있습니다.</li> <!-- 230215 추가 -->
                                <li class="last">회원 탈퇴한 날로부터 30일 이후 회원가입이 가능합니다.</li>
                            </ul>
                            <textarea class="textArea" id="del_reason" name="del_reason" placeholder="탈퇴사유를 적어주세요"></textarea>
                        </div>
                        <p class="agree_txt">
                        <div class="ez-checkbox">
                            <input type="checkbox" name="agree1" id="agree1" class="ez-hide">
                        </div>
                        <label for="agree1">회원탈퇴 후 스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실에 대해 동의합니다.</label>
                        </p>

                    </div>

                        <div class="ms_btn">
                            <p><a href="javascript:void(0)" id="del_btn">스타벅스 리워드 <!-- 및 e-프리퀀시 --> 서비스 이용내역 일괄삭제</a></p>
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

        <script type="text/javascript">
            $(document).ready(function () {
                var error = "${error}";
                var msg = "error is " + error;
                if (error) {
                    alert(msg);
                }
            });
            // 오늘 날짜 십입
            const today = new Date()
            const year = today.getFullYear();
            const month = today.getMonth()+1;
            const date = today.getDate();
            console.info("date : ", today,year,month,date);
            document.querySelector('.year').textContent =""+year;
            document.querySelector('.month').textContent =""+month;
            document.querySelector('.date').textContent =""+date;

            // 회원탈퇴 클릭시 동의 체크 후 submit
            document.getElementById('del_btn').addEventListener('click', e => {
                if(!e.target.matches("#del_btn")) return;
                console.log("del start");
                if(document.getElementById('agree1').checked){  // 동의가 체크 되었으면
                    const reason = document.getElementById('del_reason').value;
                    const formData = new FormData;
                    const reqInfo = {
                        method : "POST",
                        body : reason
                    }
                    fetch("/member/del_account", reqInfo)
                        .then(res => res.text())
                        .then(msg => {
                            if(msg === "SUCCESS"){
                                alert("회원탈퇴가 완료되었습니다. \n그동안 이용해 주셔서 감사합니다.");
                                location.href = "/";
                            }else if(msg === "FAIL"){
                                alert("회원탈퇴 과정에 문제가 발생하였습니다.");
                            }else if(msg === "NO_LOGIN"){
                                alert("로그인 중이 아닙니다.");
                            }
                        })
                }else{
                    alert("스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실 동의에 체크해 주십시오.")
                }
            })


            //    오른쪽 메뉴창 안에 아래 화살표 클릭시 펼치기
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
        <jsp:include page="../include/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

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