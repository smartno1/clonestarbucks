<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/coffee/espresso/bottomProduct.css">
<section class="bottom">
    <div class="container">
        <p>관련 제품</p>
        <ul class="product-ul clear-fix">
            <c:forEach items="${menuList}" var="u">
                <li class="product-li clear-fix" data-kind="${u.kind}">
                    <a href="/menu/menuListDetail?id=${u.id}">
                        <img src="${u.image}"/>
                    </a>
                    <div>
                        <p class="product-name">${u.nameKr}</p>
                        <p class="product-descriptionSummary">${u.descriptionSummary}</p>
                        <a href="/menu/menuListDetail?id=${u.id}">자세히 보기 ></a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>