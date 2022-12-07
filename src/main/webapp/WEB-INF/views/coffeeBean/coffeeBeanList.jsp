<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../include/static-head.jsp"%>

    <link rel="stylesheet" type="text/css" href="/css/coffeeBeanList.css">

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
        <div class="coffee-wrapper">
            <div class="coffee-list">
                <div class="coffee-type">
                    <img src="/images/icon/blondRoast.png"/><p>블론드 로스트</p>
                </div>
                <div class="coffee-bean-wrapper">
                    <c:forEach items="${list}" var="u">
                        <c:choose>
                            <c:when test="${u.type eq 'blondRoast'}">
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
									<img src="${u.seq}"/></a>
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
<script src="/js/menu.js"></script>
<script src="https://apis.google.com/js/api.js"></script>
</body>

</html>