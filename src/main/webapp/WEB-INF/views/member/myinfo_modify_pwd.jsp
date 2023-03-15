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
        <link rel="stylesheet" type="text/css" href="/css/member/modify_pwd.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div id="container">
                <!-- 내용 -->
                <div class="find_mem_wrap">
                    <div class="find_mem_inner">
                        <strong class="find_mem_ttl">비밀번호 변경</strong>
                        <div class="find_mem_form">
                            <figure class="find_mem_sally">
                                <img src="//image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png" alt="">
                            </figure>
                            <div class="find_mem_result">
                                <p class="mem_result_txt">
                                    <span class="result_txt_sub">새로운 비밀번호로 변경 하실 수 있습니다.</span>
                                </p>
                            </div>
                            <form id="form" action="/member/modify" method="post" >
                                <div class="renew_input_box1 id">
                                    <strong>아이디</strong>

                                    <input id="user_id" name="account" value="">
                                </div>
                                <div class="renew_input_box1 pw">
                                    <strong>현재 비밀번호</strong>
                                    <input type="password" name="password" id="user_pwd" placeholder="비밀번호를 입력해 주세요." autocomplete="off">
                                    <p class="user_pwd_txt input_warn_text" id="warn_user_pwd"></p>
                                </div>
                                <div class="renew_input_box1 npw">
                                    <strong>새 비밀번호 </strong>
                                    <input type="password" name="new_pw1" id="user_pwd_new" maxlength="20" placeholder="영문, 숫자 혼합하여 10 ~ 20자리 이내로 입력하세요." data-warn_id="warn_user_pwd_new" autocomplete="off">
                                    <p class="limit_txt user_pwd_new_txt input_warn_text" id="warn_user_pwd_new"></p>
                                    <input type="password" name="new_pw2" id="user_pwd_new_chk" maxlength="20" placeholder="비밀번호를 다시 한번 입력해 주세요." data-warn_id="warn_user_pwd_new_chk" class="mt10" autocomplete="off">
                                    <p class="limit_txt user_pwd_new_chk_txt input_warn_text" id="warn_user_pwd_new_chk"></p>
                                </div>
                            </form>
                        </div>
                        <p class="btn_mem_login">
                            <a class="btn_ok" href="javascript:void(0);" onclick="check()">확인</a>
                        </p>

                    </div>
                </div>
                <!-- 내용 end -->
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

        const checker = [];
        function check() {
            const form = document.getElementById('form');
            console.info("form : ", form);
            const pwd = document.getElementById("user_pwd").value;
            const pwd1 = document.getElementById("user_pwd_new").value;
            const pwd2 = document.getElementById("user_pwd_new_chk").value;
            const account = document.getElementById("user_id").value;
            $("#errorText").remove();
            $("input").css("border", "1px solid #d3d3d3");
            if (!account) {
                const errorText = "<span class =\"subText\" id=\"errorText\" style='color: #006633'>아이디를 입력하세요.</span>"
                $('.renew_input_box1.id').append(errorText);
                $('.renew_input_box1.id input').focus();
                $('.renew_input_box1.id input').css("border", "1px solid");

                return false;

            } else if (!pwd) {
                const errorText = "<span id=\"errorText\" style='color: #006633'>비밀번호를 입력하세요.</span>"
                $('.renew_input_box1.pw').append(errorText);
                $('#user_pwd').css("border", "1px solid");
                $('#user_pwd').focus();

                return false;

            }else if (!pwd1) {
                const errorText = "<span id=\"errorText\" style='color: #006633'>새 비밀번호를 입력하세요.</span>"
                $('.renew_input_box1.npw').append(errorText);
                $('#user_pwd_new').css("border", "1px solid");
                $('#user_pwd_new').focus();

                return false;

            }else if (!pwd2) {
                const errorText = "<span id=\"errorText\" style='color: #006633'>새 비밀번호를 입력하세요.</span>"
                $('.renew_input_box1.npw').append(errorText);
                $('#user_pwd_new_chk').css("border", "1px solid");
                $('#user_pwd_new_chk').focus();

                return false;
            }else if ( pwd1 !==  pwd2) {

                alert("입력하신 새 비밀번호가 다릅니다.");

                return false;
            }

            const formData = new FormData(form);

            const reqInfo = {
                method: 'POST'
                , body: formData
            }

            fetch('/member/myinfo_modify_pwd', reqInfo)
                .then(res => res.text())
                .then(result => {
                    let msg = "";
                    if (result === "SUCCESS") {
                        msg = "비밀번호가 변경되었습니다."
                        alert(msg);
                        location.href = "/member/sign-in";
                    } else if (result === "MISSMATCH_PW") {
                        msg = "잘못된 비밀번호입니다. \n 비밀번호를 확인해 주세요.";
                        alert(msg);
                    } else if (result === "MISSMATCH_ID") {
                        msg = "잘못된 아이디입니다. \n 아이디를 확인해 주세요."
                        alert(msg);
                    }
                })

        }


        $('#user_pwd_new').focusout(patternCheck);
        $('#user_pwd_new_chk').focusout(patternCheck);

        const regexPW = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{10,20}$/;
        function patternCheck() {
            const target = $(event.target);
            $('.renew_input_box1.npw #errorText').remove();
            target.css("border", "1px solid #d3d3d3");

            if (!regexPW.test(target.val())) {
                const errorText = "<span  id=\"errorText\">영문, 숫자 혼합하여 10~20자리 이내로 입력하세요.</span>"
                target.parent().append(errorText);
                target.focus();
                target.css("border", "1px solid");
                checker.push(false);
            }

        }

        (function (){

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