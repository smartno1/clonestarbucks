<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../include/static-head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/css/menu/menuList.css">


</head>
<body>
<%@include file="../include/header.jsp"%>
<section class="container-wrapper">
    <div class="container">
        <div class="container-name">
            <h2>상품<c:if test="${loginUser.auth == 'ADMIN'}"><a href="/menu/productAdd"><span class="material-symbols-outlined">add</span> <span class="name-add">상품추가</span></a></c:if></h2>
            <%-- <c:out value="${test}" default="foo" /> --%>
            <nav class="nav">
                <ul class="nav-ul">
                    <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean" class="en">상품</a></li>
                     </ul>
            </nav>
        </div>
        <div class="search-tap">
            <p class="tit">분류보기</p>
            <div class="arrow"><img src="/images/icon/list_up_btn.png"></div>
            <div class="search_kind clear-fix">
                <div><a data-kind="sangpum" href=javascript:void(0)>상품</a></div>
            </div>


            <div class="search_type" >

                <label><input class="all" type="checkbox">전체보기</label>
                <label><input class="check" type="checkbox" value="mugcup" >머그컵</label>
                <label><input class="check" type="checkbox" value="thermos">보온병</label>
<%--                <label><input class="check" type="checkbox" value="dark_roast">다크로스트</label>--%>



            </div>

        </div>
        <div class="menu001">
        <div class="coffee-wrapper mugcup" >
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/blondRoast.png"/><p>머그컵</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${sangpum}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'mugcup'}">
                                <li class="coffee_bean">
                                    <a href="/menu/productDetail?id=${u.id}">
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
        <div class="coffee-wrapper thermos">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/mediumRoast.png"/><p>보온병</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${sangpum}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'thermos'}">
                                <li class="coffee_bean">
                                    <a href="/menu/productDetail?id=${u.id}">
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



        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
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
    // function doDisplay(){
    //     var con = document.querySelector(".hi-text").style.display = 'none';
    //     var con = document.getElementById("ben1").style.display ='block';
    //     var con = document.querySelector(".menu001").style.display ='none';
    //     var con = document.querySelector(".coffee-wrapper1").style.display ='block';
    // }
    // function doDisplay1(){
    //     var con = document.querySelector(".hi-text").style.display ='block';
    //     var con = document.getElementById("ben1").style.display ='none';
    //     var con = document.querySelector(".menu001").style.display ='block';
    //     var con = document.querySelector(".coffee-wrapper1").style.display ='none';
    // }
    /*
    * 원두 비아 캡슐 선택시 해당 리스트 보여주기
    */
    // kind 선택시 색상 변경
    function selectKind(){
        document.querySelector('.search_kind').addEventListener('click', e => {
            if(!e.target.matches('.search_kind a')) return;
            console.log(e.target);
            if(e.target === "via"){

            }
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
        })

    }
    // kind 선택시 해당 리스트 보여주기


    // 전체 체크시 나머지 해제, 나머치 체크시 전체 해제
    function inputChecker(e){
        const $All = document.querySelector('.all');
        const $check = document.querySelectorAll('.check');
        console.log("e-{}",e);
        if(e === $All && e.checked === true){
            $check.forEach(function (check) {
                console.log("allcheck");
                check.checked = false;
            })
        }
        $check.forEach(function (check) {
            console.log("check");
            if (check.checked) {
                $All.checked = false;
            }
        })
    }

    // type 체크시 체크된 타입의 리스트 요청
    function selectType(){
        // 체크시마다 이벤트 발생.
        document.querySelector('.search_type').addEventListener('change', e => {
            console.info("check-{}",e.target);
            inputChecker(e.target);

            // 체크 된 옵션을 보여주기, 체크해제된것은 안보이게,
            showTypeList();
        })
    }
    // 체크 된 옵션을 보여주기, 체크해제된것은 안보이게,
    function showTypeList(){
        const $check = document.querySelectorAll('.check'); // 타입 요소를 전부 가져오고
        const $All = document.querySelector('.all');    // 전체선택 타입 요소 가져오고
        let all = false;
        if($All.checked){ all = true;  }    // 전체선택이면 true 변수 설정.

        $check.forEach(function (check) { // 타입 배열에서 하나씩 꺼냄
            const show = document.querySelector('.'+check.value); // 타입에 맞는 리스트 가져오기
            const showContent = show.firstElementChild.lastElementChild.firstElementChild;
            if(check.checked){ // 타입이 체크되었고
                if(showContent) { // 리스트에 목록이 있으면
                    console.log("show-check: ", showContent);
                    show.style.display = "block";   // 보여준다
                }
            }else if(all){  // 타입체크는 안되있고, 전체보기 체크면
                if(showContent) { // 리스트에 목록이 있으면
                    console.log("show-all: ", showContent);
                    show.style.display = "block";   // 보여준다
                }
            }else{  // 타입체크 x , 전체보기 x
                console.log("no show: ",show);
                show.style.display = "none";    // 숨긴다.
            }
        })
    }

    // 처음 전체선택이 되게 하고 목록이 있는 리스트만 보여주기
    function defaultType(){

        // 먼저 모든 타입을 안보이게 설정.
        const dt = document.querySelectorAll('.coffee-wrapper');
        dt.forEach(function (d){
            d.style.display = "none";
        })

        if(${type == "mugcup"}){
            console.log("mugcup");
            const $type = document.querySelector('input[value="mugcup"]')
            $type.checked = true;

        }else if(${type == "thermos"}){
            const $type = document.querySelector('input[value="thermos"]')
            $type.checked = true;
        }else{
            console.log("All")
            document.querySelector('input.all').checked = true;
        }

        // 선택된 옵션에 맞는 타입 보여주기
        showTypeList();
    }

    // 처음 원두 선택되게
    function defaultKind(){
        const $kinds = [...document.querySelector('.search_kind').children];
        $kinds[0].firstElementChild.classList.add('selected');
    }
    (function (){

        defaultKind();
        defaultType();
        navShow();
        selectKind();
        selectType();

    })();
</script>
</html>