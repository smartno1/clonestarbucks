<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../include/static-head.jsp"%>

    <link rel="stylesheet" type="text/css" href="/css/coffeeBeanList.css">
<style>

    .search-tap{
        padding: 30px 30px 0 30px;
        border: 1px solid #ddd;
        position: relative;
        border-radius: 3px;
        margin-bottom: 40px;
    }
    .search-tap .tit{
        font-size: 16px;
        font-weight: bold;
        padding-bottom: 30px;
        color: black;
        border-bottom: 1px solid #ddd;
    }
    .search-tap .arrow {
        position: absolute;
        right: 30px;
        top: 17px;
    }
    .search-tap .search_kind{
        padding-top: 30px ;
        position: relative;
        padding-bottom: 10px;
        min-width: 435px;
    }
    .search_kind div a{
        float: left;
        background: #f4f4f1;
        color: black;
        height: 35px;
        line-height: 35px;
        border-radius: 3px;
        font-size: 14px;
        font-weight: 400;
        text-align: center;
        width: 20%;
        margin-right: 10px;
    }
    .search_kind div a:hover{
        text-decoration-line:underline;
    }
    .search_kind div a.selected {
        background: #006633;
        color: #fff;
    }
    .search_type {
        padding-bottom: 24px;
    }
    input[type="checkbox"] {
        height: 12px;
        width: 12px;
        vertical-align: middle;
        border-radius: 0;
        cursor: pointer;
    }
    label{
        font-size: 12px;
        margin-right: 20px;
        cursor: pointer;
        /*vertical-align: middle;*/

    }
</style>
</head>
<body>
<%@include file="../include/header.jsp"%>
<section class="container-wrapper">
    <div class="container">
        <div class="container-name">
            <h2>커피</h2>
            <%-- <c:out value="${test}" default="foo" /> --%>
            <span class="title-home">
                <span class="material-symbols-outlined home">home</span>&nbsp;
                <span> COFFEE > 커피</span>
                &nbsp;&nbsp;<a href="/coffee/addCoffee"><span class="material-symbols-outlined">add</span></a>
		    </span>
        </div>
        <div class="search-tap">
            <p class="tit">분류보기</p>
            <div class="arrow"><img src="/images/icon/list_up_btn.png"></div>
            <div class="search_kind clear-fix">
                <div><a href="/coffee/bean?type=bean" class="selected">스타벅스 원두</a></div>
                <div><a href="/coffee/bean?type=via">스타벅스 비아</a></div>
                <div><a href="/coffee/bean?type=capsule">스타벅스앳홈 by 캡슐</a></div>
            </div>
            <div class="search_type">
                <label><input type="checkbox" value="all">전체 상품보기</label>
                <label><input type="checkbox" value="blondRoast">블론드 로스트</label>
                <label><input type="checkbox" value="mediumRoast">미디엄 로스트</label>
                <label><input type="checkbox" value="darkRoast">다크 로스트</label>
                <label><input type="checkbox" value="flavor">플레이버</label>
                <label><input type="checkbox" value="reserveRoast">리저브 원두</label>
                <label><input type="checkbox" value="flavorLatte">플레이버 라떼</label>
            </div>
        </div>
        <div class="coffee-wrapper">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/blondRoast.png"/><p>블론드 로스트</p>
                </div>
                <ul class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'blondRoast'}">
								<li class="coffee_bean">
									<a href="/coffee/coffeeBeanDetail?id=${u.id}">
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
        <div class="coffee-wrapper">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/mediumRoast.png"/><p>미디엄 로스트</p>
                </div>
                <div class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'mediumRoast'}">
								<span class="coffee_bean">
									<a href="/coffee/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/>
									</a>
									<span class="coffee_bean_name">${u.nameKr}</span>
								</span>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="coffee-wrapper">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/darkRoast.png"/><p>다크 로스트</p>
                </div>
                <div class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'darkRoast'}">
								<span class="coffee_bean">
									<a href="/coffee/coffeeBeanDetail?id=${u.id}">
									<img src="${u.image}"/></a>
									<span class="coffee_bean_name">${u.nameKr}</span>
								</span>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="coffee-wrapper">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/reserveRoast.png"/><p>리저브 원두</p>
                </div>
                <div class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'reserveRoast'}">
								<span class="coffee_bean">
									<a href="/coffee/coffeeBeanDetail?id=${u.id}">
									<img src="${u.seq}"/></a>
									<span class="coffee_bean_name">${u.nameKr}</span>
								</span>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>