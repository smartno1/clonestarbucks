<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>커피 | Starbucks Korea</title>
    <link rel="stylesheet" type="text/css" href="/css/coffee/bean/coffeeBeanList.css">
</head>
<body>
<%@include file="../../include/header.jsp"%>
<section class="container-wrapper">
    <div class="container">
        <div class="container-name">
            <h2>커피<c:if test="${loginUser.auth == 'ADMIN'}"><a href="/coffee/bean/addCoffee"> <span class="material-symbols-outlined">add</span> <span class="name-add">커피 추가</span></a></c:if></h2>
            <%-- <c:out value="${test}" default="foo" /> --%>
            <nav class="nav">
                <ul class="nav-ul">
                    <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean/list" class="en"> COFFEE</a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean/list"> 커피</a></li>
                </ul>
            </nav>
        </div>
        <div class="search-tap">
            <p class="tit">분류보기</p>
            <div class="arrow"><img src="/images/icon/list_up_btn.png"></div>
            <div class="search_kind clear-fix">
                <div><a data-kinds="bean" href=javascript:void(0)>스타벅스 원두</a></div>
                <div><a data-kinds="via" href=javascript:void(0) >스타벅스 비아</a></div>
                <div><a data-kinds="capsule" href=javascript:void(0) >스타벅스앳홈 by 캡슐</a></div>
            </div>
            <div class="search_type">
                <label><input class="all" type="checkbox" value="all">전체 상품보기</label>
                <label><input class="check" type="checkbox" value="blond_roast">블론드 로스트</label>
                <label><input class="check" type="checkbox" value="medium_roast">미디엄 로스트</label>
                <label><input class="check" type="checkbox" value="dark_roast">다크 로스트</label>
                <label><input class="check" type="checkbox" value="flavor">플레이버</label>
                <label><input class="check" type="checkbox" value="reserve_roast">리저브 원두</label>
                <label><input class="check" type="checkbox" value="flavor_latte">플레이버 라떼</label>
            </div>
        </div>
        <div class="coffee-wrapper blond_roast">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/blondRoast.png"/><p>블론드 로스트</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'blond_roast'}">
								<li class="coffee_bean" data-kind="${u.kind}">
									<a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/>
									</a>
									<p class="coffee_bean_name">${u.nameKr}</p>
								</li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="coffee-wrapper medium_roast">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/mediumRoast.png"/><p>미디엄 로스트</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'medium_roast'}">
								<li class="coffee_bean" data-kind="${u.kind}">
									<a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/>
									</a>
									<p class="coffee_bean_name">${u.nameKr}</p>
								</li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="coffee-wrapper dark_roast">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/darkRoast.png"/><p>다크 로스트</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'dark_roast'}">
								<li class="coffee_bean" data-kind="${u.kind}">
									<a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/></a>
									<p class="coffee_bean_name">${u.nameKr}</p>
								</li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="coffee-wrapper reserve_roast">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/reserveRoast.png"/><p>리저브 원두</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'reserve_roast'}">
								<li class="coffee_bean" data-kind="${u.kind}">
									<a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/></a>
									<p class="coffee_bean_name">${u.nameKr}</p>
								</li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="coffee-wrapper flavor">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/flavor.png"/><p>플레이버</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'flavor'}">
                                <li class="coffee_bean" data-kind="${u.kind}">
                                    <a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
                                        <img src="${u.image}"/>
                                    </a>
                                    <p class="coffee_bean_name">${u.nameKr}</p>
                                </li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </>
            </div>
        </div>
        <div class="coffee-wrapper flavor_latte">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/flavorLatte.png"/><p>플레이버 라떼</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'flavor_latte'}">
                                <li class="coffee_bean" data-kind="${u.kind}">
                                    <a href="/coffee/bean/coffeeBeanDetail?id=${u.id}">
                                        <img src="${u.image}"/>
                                    </a>
                                    <p class="coffee_bean_name">${u.nameKr}</p>
                                </li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
<script>
    /*
    * 분류보기 메뉴 업 다운
    */
    function navShow(){
        document.querySelector('.arrow').addEventListener('click', e =>{
            if(!e.target.matches('.arrow img')) return;
            console.log("arrow-{}", e.target);
            const $img = e.target;
            if($img.getAttribute("src") === "/images/icon/list_up_btn.png") {
                $img.setAttribute("src", "/images/icon/list_down_btn.png")
                $img.parentElement.previousElementSibling.style.borderBottom = "none";
                document.querySelector('.search_kind').style.display = "none";
                document.querySelector('.search_type').style.display = "none";
            }else{
                $img.setAttribute("src", "/images/icon/list_up_btn.png")
                $img.parentElement.previousElementSibling.style.borderBottom = "1px solid #ddd";
                document.querySelector('.search_kind').style.display = "block";
                document.querySelector('.search_type').style.display = "block";
            }
        })
    }
    /*
    * 원두 비아 캡슐 선택시 색상변경
    */

    function selectKind(){
        document.querySelector('.search_kind').addEventListener('click', e => {
            if(!e.target.matches('.search_kind a')) return;
            console.log(e.target);
            const $kinds = [...document.querySelector('.search_kind').children];
            for(const k of $kinds){
                if (k.firstElementChild === e.target){
                    e.target.classList.add("selected");
                    console.log("selected-{}",e.target);
                }else{
                    k.firstElementChild.classList.remove("selected");
                    console.log("remove selected-{}",k.firstElementChild);
                }
            }
            defaultType();
            selectType();
        })
    }


    /*
    * type 체크박스 선택시 기능.
    */

    // 전체 체크시 나머지 해제, 나머치 체크시 전체 해제
    function inputChecker(e){
        const $All = document.querySelector('.all');
        const $check = document.querySelectorAll('.check');
        console.log("e-{}",e);
        if(e.value === "all" && e.checked === true){
            $check.forEach(function (check) {
                console.log("allcheck");
                check.checked = false;
            })
            return;
        }
        $check.forEach(function (check) {
            console.log("check");
            if (check.checked) {
                $All.checked = false;
            }
        })
        // 체크 된 옵션을 보여주기, 체크해제된것은 안보이게,
        showList();

    }

    // type 체크시 체크된 타입의 리스트 요청
    function selectType(){
        // 체크시마다 이벤트 발생.
        document.querySelector('.search_type').addEventListener('change', e => {
            console.info("check-{}",e.target);
            inputChecker(e.target);
        })
    }
    // 선택된 옵션에 맞는 리스트 보여주기
    function showList(){
        const kind = document.querySelector('.selected').dataset.kinds; // 선택된 kind 값을 가져오고
        const $check = document.querySelectorAll('.check'); // 타입 요소를 전부 가져오고
        const all = document.querySelector('.all').checked;    // 전체선택에 따른 true, false 값 저장.

        $check.forEach(function (check) { // 타입 배열에서 하나씩 꺼냄
            const show = document.querySelector('.'+check.value); // 타입이 속한 부모 div 요소 가져오기
            const showContent = show.firstElementChild.lastElementChild.firstElementChild; // 타입이 속한 li 요소 가져오기
            const showKind = showContent ? showContent.dataset.kind : "";   // null 값 오류제거를 위해 값이 있으면 값, 없으면 빈문자열
            if(check.checked){ // 타입이 체크되었고
                if(showKind && showKind === kind) { // 목록의 kind 가 선택된 kind 이면
                    console.log("show-check: ", showContent);
                    show.style.display = "block";   // 보여준다
                }
            }else if(all){  // 타입체크는 안되있고, 전체보기 체크면
                if(showKind && showKind === kind) { // 목록의 kind 가 선택된 kind 이면
                    console.log("show-all: ", showContent);
                    show.style.display = "block";   // 보여준다
                }
            }else{  // 타입체크 x , 전체보기 x
                console.log("no show: ",show);
                show.style.display = "none";    // 숨긴다.
            }
        })
    }

    /*
    * default 값 선택 기능.
    */
    // 처음 전체선택이 되게 하고 목록이 있는 리스트만 보여주기
    function defaultType(){
        // 먼저 모든 타입을 안보이게 설정.
        const dt = document.querySelectorAll('.coffee-wrapper');
        dt.forEach(function (d){
            d.style.display = "none";
        })
        const e = document.querySelector('input.all');
        e.checked = true;
        // 전체선택시 다른 체크 해제
        inputChecker(e);
        // 선택된 옵션에 맞는 타입 보여주기
        showList();
    }

    // 처음 원두 선택되게
    function defaultKind(){
        const $kinds = [...document.querySelector('.search_kind').children];
        for(let k of $kinds){
            if(k.firstElementChild.dataset.kinds === "${kind}"){
                k.firstElementChild.classList.add('selected');
            }
        }
        defaultType();
    }



    (function (){
        defaultKind();
        navShow();
        selectKind();
        selectType();

    })();
</script>
</html>