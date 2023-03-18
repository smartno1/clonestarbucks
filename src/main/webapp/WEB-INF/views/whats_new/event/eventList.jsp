<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>이벤트 | Starbucks Korea</title>
    <link rel="stylesheet" type="text/css" href="/css/whats_new/event/eventList.css">
</head>
<body>
<div class="wrapper">
<%@include file="../../include/header.jsp"%>
<main class="main-wrapper">
    <div class="middle">
        <div class="name">
            <h2>이벤트
                <c:if test="${loginUser.auth == 'ADMIN'}">
                <a href="/whats_new/event/add">
                    <span class="material-symbols-outlined">add</span>
                    <span class="name-add">이벤트 추가</span>
                </a>
                </c:if>
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
                <div><a data-kinds="ALL" href=javascript:void(0)>전체</a></div>
                <div><a data-kinds="CARD" href=javascript:void(0) >스타벅스 카드</a></div>
                <div><a data-kinds="REWARD" href=javascript:void(0) >스타벅스 리워드</a></div>
                <div><a data-kinds="ONLINE" href=javascript:void(0) >온라인</a></div>
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
                                <a href="javascript:void(0)" data-id="${e.eventId}">
                                    <img src="${e.listImg}"/>
                                </a>
                                <p class="event-name">${e.title}</p>
                                <p class="event-period">${e.period}</p>
                            </li>
                        </c:when>
                    </c:choose>
                    </c:forEach>
                </ul>
            </div>
            <div class="event-list">
                <h2 class="event-verify">
                    종료 이벤트
                </h2>
                <ul class="event-box clear-fix">
                    <c:forEach items="${events}" var="e">
                    <c:choose>
                        <c:when test="${e.ended}">
                            <li class="event end" data-kind="${e.kind}">
                                <a href="javascript:void(0)" data-id="${e.eventId}">
                                    <i><img src="/images/whats_new/event/icon_end_event.png" alt=""></i>
                                    <img src="${e.listImg}"/>
                                </a>
                                <p class="event-name">${e.title}</p>
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

    function detailEvent(){
        document.querySelector('.event-wrapper').addEventListener("click", e => {
            const kind = document.querySelector('.selected').dataset.kinds;
            let id;
            if(e.target.matches('.event-wrapper a > img') || e.target.matches('.event-box i')){
                id = e.target.parentElement.dataset.id;
                location.href = "/whats_new/event/detail?id="+id+"&kind="+kind;
            }
            if(e.target.matches('.event-box i > img')){
                id = e.target.parentElement.parentElement.dataset.id;
                location.href = "/whats_new/event/detail?id="+id+"&kind="+kind;
            }
        })
    }

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
            showList();
        })
    }

    // 선택된 옵션에 맞는 리스트 보여주기
    function showList(){
        const kind = document.querySelector('.selected').dataset.kinds; // 선택된 kind 값을 가져오고

        location.href = "/whats_new/event/list?kind="+kind;
    }

    // 처음 전체 선택되게
    function defaultKind(){
        console.log("${kind}");
        if(${empty kind}) {
            const all = document.querySelector('.search-kind').firstElementChild;
            all.firstElementChild.classList.add('selected');
        }else{
            const kind = [...document.querySelector('.search-kind').children]
            kind.forEach(function (e){
                if(e.firstElementChild.dataset.kinds === "${kind}"){
                    e.firstElementChild.classList.add('selected');
                }
            })
        }
    }

    (function (){
        detailEvent();
        defaultKind();
        selectKind();
    })();
</script>
</html>