<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%--헤더 잡코딩--%>
    <%@include file="../../include/static-head.jsp"%>
    <title>마이 스타벅스 | Starbucks Korea</title>
    <%--마이메뉴페이지 CSS--%>
    <link rel="stylesheet" type="text/css" href="/css/myStarbucks/myMenu/searchMyMenu.css">
</head>
<body>
<%--헤더 메뉴코너--%>
<%@include file="../../include/header.jsp"%>
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
        <div class="main-all-bg clear-fix">
            <h1>My 메뉴</h1>
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
                        <a href="/suggestion/vocList" required="login" data-href="/suggestion/vocList">My 고객의 소리</a>
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
            <main class="main">
                <div class="kind">
                    <div class="select-kind clear-fix">
                        <div><a data-kinds="ALL" href=javascript:void(0)>전체</a></div>
                        <div><a data-kinds="BEEN" href=javascript:void(0) >원두</a></div>
                        <div><a data-kinds="DRINK" href=javascript:void(0) >음료</a></div>
                        <div><a data-kinds="FOOD" href=javascript:void(0) >푸드</a></div>
                        <div><a data-kinds="PRODUCT" href=javascript:void(0) >상품</a></div>
                    </div>
                </div>
                <div class="middle-section">
                    <div id="BEEN">
                        <div class="list-top clear-fix">
                            <p>원두</p>
                            <a href="/coffee/bean/list">원두 더보기</a>
                        </div>
                        <div class="list-main">
                            <ul class="list-box">
                                <c:forEach items="${coffees}" var="e">
                                    <li class="list clear-fix" data-kind="${e.kind}">
                                        <div class="list-img">
                                            <img src="${e.image}"/>
                                        </div>
                                        <div class="list-context">
                                            <p class="list-title">${e.nameKr}</p>
                                            <p class="list-sub">${e.descriptionSummary}</p>
                                            <div>
                                                <a class="detail" href="/coffee/bean/coffeeBeanDetail?id=${e.id}">
                                                    자세히 보기
                                                </a>
                                                <a class="except" data-type="coffeeBean" data-id="${e.id}">제외</a>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div id="DRINK">
                        <div class="list-top clear-fix">
                            <p>음료</p>
                            <a href="/menu/list">음료 더보기</a>
                        </div>
                        <div class="list-main">
                            <ul class="list-box">
                                <c:forEach items="${menus}" var="e">
                                    <c:if test="${e.kind == 'category' || e.kind == 'theme'}">
                                        <li class="list clear-fix">
                                            <div class="list-img">
                                                <img src="${e.image}"/>
                                            </div>
                                            <div class="list-context">
                                                <p class="list-title">${e.nameKr}</p>
                                                <p class="list-sub">${e.descriptionSummary}</p>
                                                <div>
                                                    <a href="/menu/menuListDetail?id=${e.id}">
                                                        자세히 보기
                                                    </a>
                                                    <a class="except" data-type="menu" data-id="${e.id}">제외</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div id="FOOD">
                        <div class="list-top clear-fix">
                            <p>푸드</p>
                            <a href="/menu/food">푸드 더보기</a>
                        </div>
                        <div class="list-main">
                            <ul class="list-box">
                                <c:forEach items="${menus}" var="e">
                                    <c:if test="${e.kind == 'food'}">
                                        <li class="list clear-fix">
                                            <div class="list-img">
                                                <img src="${e.image}"/>
                                            </div>
                                            <div class="list-context">
                                                <p class="list-title">${e.nameKr}</p>
                                                <p class="list-sub">${e.descriptionSummary}</p>
                                                <div>
                                                    <a href="/menu/foodListDetail?id=${e.id}">
                                                        자세히 보기
                                                    </a>
                                                    <a class="except" data-type="menu" data-id="${e.id}">제외</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div id="PRODUCT">
                        <div class="list-top clear-fix">
                            <p>상품</p>
                            <a href="/menu/sangpum">상품 더보기</a>
                        </div>
                        <div class="list-main">
                            <ul class="list-box">
                                <c:forEach items="${menus}" var="e">
                                    <c:if test="${e.kind == 'product'}">
                                        <li class="list clear-fix">
                                            <div class="list-img">
                                                <img src="${e.image}"/>
                                            </div>
                                            <div class="list-context">
                                                <p class="list-title">${e.nameKr}</p>
                                                <p class="list-sub">${e.descriptionSummary}</p>
                                                <div>
                                                    <a href="/menu/sangpumListDetail?id=${e.id}">
                                                        자세히 보기
                                                    </a>
                                                    <a class="except" data-type="menu" data-id="${e.id}">제외</a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
            <!--추천상품 -->
        </div>

    </div>
</div>
<%--바디 내용끝--%>
<%--푸터 내용시작--%>
<jsp:include page="../../include/footer.jsp"></jsp:include>
<%--푸터 내용끝--%>

<%--자바스크릡트 공간입니다.--%>
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
    /*
 * kind 선택시 색상변경 ---------------------------------------------
 */

    function selectKind(){
        document.querySelector('.select-kind').addEventListener('click', e => {
            if(!e.target.matches('.select-kind a')) return;
            console.log(e.target);
            const $kinds = [...document.querySelector('.select-kind').children];
            for(const k of $kinds){
                if (k.firstElementChild === e.target){
                    e.target.classList.add("selected");
                    console.log("selected-{}",e.target);
                }else{
                    k.firstElementChild.classList.remove("selected");
                    console.log("remove selected-{}",k.firstElementChild);
                }
            }
            showList();
        })
    }

    // 선택된 옵션에 맞는 리스트 보여주기 -------------------------------------------------
    function showList(e){
        const kind = document.querySelector('.select-kind div a.selected').dataset.kinds;
        const all = [...document.querySelector('.middle-section').children]
        all.forEach(function (a){
            if(kind === a.getAttribute("id") || kind === "ALL"){
                a.style.display = "block";
            }else {
                a.style.display = "none";
            }
        })

    }

    // 페이지로딩시 kind가 있으면 해당 kind 선택, 없으면 전체 선택
    function defaultKind(){
        const all = document.querySelector('.select-kind').firstElementChild;
        all.firstElementChild.classList.add('selected');
    }

    // 제외
    function except(){
        document.querySelector('.middle-section').addEventListener('click', e => {
            if(!e.target.matches('.except'))return;
            if(!confirm("나만의 상품에서 제외합니다.")) return;
            const type=e.target.dataset.type;
            const id = e.target.dataset.id;
            const param = {"type":type, "id":id}
            console.info("param: ",param);
            const reqInfo = {
                method:"POST",
                headers:{'Content-Type': 'application/json'},
                body:JSON.stringify(param)
            }
            fetch('/myStarbucks/favorite/delete', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'success') {
                        alert("나만의 상품에서 제외하였습니다.");
                        location.href="/myStarbucks/favorite/list";
                    } else if (msg === 'no_exist') {
                        alert("나만의 상품에 없는 상품입니다.")
                    } else {
                        alert("상품제외에 실패하였습니다.");
                    }
                })
        })
    }

    (function (){
        msRnbShow();
        defaultKind();
        selectKind();
        except();
    })();

</script>

</html>