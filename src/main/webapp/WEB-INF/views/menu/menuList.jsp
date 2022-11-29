<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../include/static-head.jsp"%>

    <link rel="stylesheet" type="text/css" href="/css/coffeeBeanList.css">
    <link rel="stylesheet" type="text/css" href="/css/menulist.css">


</head>
<body>
<%@include file="../include/header.jsp"%>
<section class="container-wrapper">
    <div class="container">
        <div class="container-name">
            <h2>음료<a href="/menu/addMenuForm"><span class="material-symbols-outlined">add</span> <span class="name-add">음료추가</span></a></h2>

            <nav class="nav">
                <ul class="nav-ul">
                    <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean" class="en"> MENU</a></li>
                    <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                    <li><a href="/coffee/bean"> 음료</a></li>
                </ul>
            </nav>
        </div>
        <div class="search-tap">
            <p class="tit">분류보기</p>
            <div class="arrow"><img src="/images/icon/list_up_btn.png"></div>
            <div class="search_kind clear-fix">
                <div><a data-kind="bean" href=javascript:void(0)></a></div>
                <div><a data-kind="via" href=javascript:void(0)>테마</a></div>

            </div>
            <div class="search_type">
                <label><input class="all" type="checkbox" value="all">전체 상품보기</label>
                <label><input class="check" type="checkbox" value="blond_roast">콜드브루 커피</label>
                <label><input class="check" type="checkbox" value="medium_roast">브루드커피</label>
                <label><input class="check" type="checkbox" value="dark_roast">에스프레소</label>
                <label><input class="check" type="checkbox" value="flavor">프라푸치노</label>

            </div>
        </div>
        <div class="coffee-wrapper blond_roast">
            <div class="coffee-list">
                <div class="coffee-type">
                    <h2>콜드블루 커피</h2><img src="/images/icon/logo_decaf.png"/><p>디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'blond_roast'}">
                                <li class="coffee_bean">
                                    <a href="/coffee/coffeeBeanDetail?id=${u.id}">
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
                    <h2>브루드 커피</h2><img src="/images/icon/logo_decaf.png"/><p>디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'medium_roast'}">
                                <li class="coffee_bean">
                                    <a href="/coffee/coffeeBeanDetail?id=${u.id}">
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
                    <h2>에스프레소 커피</h2><img src="/images/icon/logo_decaf.png"/><p>디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'dark_roast'}">
                                <li class="coffee_bean">
                                    <a href="/coffee/coffeeBeanDetail?id=${u.id}">
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
                    <h2>콜드블루 커피</h2><img src="/images/icon/logo_decaf.png"/><p>디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'reserve_roast'}">
                                <li class="coffee_bean">
                                    <a href="/coffee/coffeeBeanDetail?id=${u.id}">
                                        <img src="${u.seq}"/></a>
                                    <p class="coffee_bean_name">${u.nameKr}</p>
                                </li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>