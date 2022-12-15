<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>이벤트 | Starbucks Korea</title>
    <style>

        .middle{
            width:100%;
            max-width:1100px;
            margin: 0 auto;
        }
        .name{
            margin-bottom: 20px;
        }
        .name h2{
            font-size: 30px;
            font-weight: bold;
            padding-top: 30px;
        }
        .name > h2 a{
            margin-left: 20px;
            padding-left: 10px;
            font-size: 14px;
        }
        .name h2 a span{
            vertical-align: text-bottom;
        }
        .name h2 a span.name-add{
            vertical-align: text-top;
        }
        .nav {
            position: relative;
            padding-bottom: 20px;
        }
        ul.nav-ul{
            float: right;
        }
        .nav-ul li{
            display: inline-block;
            height: 24px;
            line-height: 24px;
            font-size: 12px;
            color: #666666;
            vertical-align: middle;
        }
        .nav-ul li img {
            padding-top: 4px;
        }
        .nav-ul li:nth-child(2) img, .nav-ul li:nth-child(4) img{
            padding-top: 7px;
        }
        .search-tap{
            padding: 20px 30px;
            border: 1px solid #ddd;
            position: relative;
            border-radius: 3px;
            margin-bottom: 40px;
        }
        .search-tap .search-kind{
            width: 100%;
            height: 100%;
            position: relative;
        }
        .search-kind div a{
            float: left;
            background: #f4f4f1;
            color: black;
            height: 35px;
            line-height: 35px;
            border-radius: 3px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            width: 24.25%;
            min-width: fit-content;
            margin-right: 1%;
        }
        .search-kind div:last-child a{
            margin-right: 0;
        }
        .search-kind div a:hover{
            text-decoration-line:underline;
            cursor: pointer;
        }
        .search-kind div a.selected {
            background: #006633;
            color: #fff;
        }
        .event-list{
            padding-bottom:50px;
        }
        .event-verify{
            background-color:#f4f4f2;
            width:100%;
            font-weight:bold;
            font-size: 18px;
            padding: 20px;
            box-sizing: border-box;
        }
        .event-box{
            margin-top: 20px;
            position: relative;
        }
        .event{
            float: left;
            width: 100%;
            max-width: 23.65%;
            height: fit-content;
            margin-right: 1.8%;
            align-items:center;
            padding-bottom: 20px;

        }
        .event:nth-child(4n){
            margin-right: 0;
        }
        .event a{
            display: block;
            width: inherit;
            max-width: 260px;
            vertical-align: baseline;
            overflow: hidden;
            margin-bottom: 15px;
        }
        .event a img{
            width: 100%;
        }
        .event.onGoing a img{
            width: inherit;
            object-fit: contain;
            transition: all 0.5s linear;
        }
        .event.onGoing a img:hover{
            transform:scale(1.2)
        }
        .event.end a{
            display: block;
            position: relative;
            background-color: #646464;
        }
        .event.end a i {
            display: block;
            position: absolute;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0.7;
        }
        .event.end a i img{
            width: 100%;
            max-width: fit-content;
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .event .event-name {
            font-size: 16px;
            color: #444444;
            text-align: center;
            width: 100%;
            white-space: break-spaces;
        }
        .event .event-period{
            font-size: 12px;
            color: #666666;
            margin-top: 8px;
            text-align: center;
            width: 100%;
        }
        section{
            z-index:-66;
        }
        header{
            z-index:99;
        }
    </style>
</head>
<body>
<div class="wrapper">
<%@include file="../../include/header.jsp"%>
<main class="main-wrapper">
    <div class="middle">
        <div class="name">
            <h2>이벤트
                <a href="/board/event/addEvent">
                    <span class="material-symbols-outlined">add</span>
                    <span class="name-add">이벤트 추가</span>
                </a>
            </h2>
            <nav class="nav">
                <ul class="nav-ul">
                    <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="javascript:void(0)"> 이벤트</a></li>
                </ul>
            </nav>
        </div>
        <div class="search-tap">
            <div class="search-kind clear-fix">
                <div><a data-kinds="all" href=javascript:void(0)>전체</a></div>
                <div><a data-kinds="card" href=javascript:void(0) >스타벅스 카드</a></div>
                <div><a data-kinds="reward" href=javascript:void(0) >스타벅스 리워드</a></div>
                <div><a data-kinds="online" href=javascript:void(0) >온라인</a></div>
            </div>
        </div>
        <div class="event-wrapper">
            <div class="event-list">
                <h2 class="event-verify">
                    진행 이벤트
                </h2>
                <ul class="event-box clear-fix">
                    <c:forEach items="${events}" var="e">
                    <c:choose>
                        <c:when test="${!e.ended}">
                            <li class="event onGoing" data-kind="${e.kind}">
                                <a href="/board/event/detail?id=${e.eventId}">
                                    <img src="${e.listImg}"/>
                                </a>
                                <p class="event-name">${e.prettierTitle}</p>
                                <p class="event-period">${e.period}</p>
                            </li>
                        </c:when>
                    </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="event-wrapper">
            <div class="event-list">
                <h2 class="event-verify">
                    종료 이벤트
                </h2>
                <ul class="event-box clear-fix">
                    <c:forEach items="${events}" var="e">
                    <c:choose>
                        <c:when test="${e.ended}">
                            <li class="event end" data-kind="${e.kind}">
                                <a href="/board/event/detail?id=${e.eventId}">
                                    <i><img src="/images/board/event/icon_end_event.png" alt=""></i>
                                    <img src="${e.listImg}"/>
                                </a>
                                <p class="event-name">${e.prettierTitle}</p>
                                <p class="event-period">${e.period}</p>
                            </li>
                        </c:when>
                    </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</main>
<%@ include file="../../include/footer.jsp"%>
</div>
</body>
<script>

    /*
    * kind 선택시 색상변경
    */

    function selectKind(){
        document.querySelector('.search-kind').addEventListener('click', e => {
            if(!e.target.matches('.search-kind a')) return;
            console.log(e.target);
            const $kinds = [...document.querySelector('.search-kind').children];
            for(const k of $kinds){
                if (k.firstElementChild === e.target){
                    e.target.classList.add("selected");
                    console.log("selected-{}",e.target);
                }else{
                    k.firstElementChild.classList.remove("selected");
                    console.log("remove selected-{}",k.firstElementChild);
                }
            }
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

    (function (){
        defaultKind();
        selectKind();
    })();
</script>
</html>