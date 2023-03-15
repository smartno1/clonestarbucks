<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>아메리카노 | Starbucks Korea</title>

    <link rel="stylesheet" type="text/css" href="/css/coffee/espresso/common.css">
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="wrap">
        <section class="Header">
            <div class="container-name">
                <h2>아메리카노</h2>
                <nav class="nav">
                    <ul class="nav-ul">
                        <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="/coffee/espresso/list" class="en">COFFEE</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="/coffee/espresso/list">에스프레소 음료</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)">아메리카노</a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="middle">
            <div class="pic">
                <img src="/images/coffee/espresso/americano_img01.jpg" alt="">
            </div>
            <div class="info">
                <p class="p1">“아메리카노는 에스프레소의 진한 풍미를 잘 느낄 수 있는 음료입니다. ”</p>
                <p class="p2">아메리카노는 에스프레소 샷 두 개를 추출하여 바로 컵에 붓고, 그 위에 뜨거운 물을 재빠르게 부어 얇은 크레마 층이 형성되는 음료입니다.
                    갓 분쇄된 에스프레소만이 깊은 풍미를 가진 아메리카노를 만들 수 있습니다.</p>
            </div>
        </section>
        <%@include file="bottomProduct.jsp"%>

    </main>
    <%@include file="../../include/footer.jsp"%>
</div>
<script>

</script>
</body>
</html>
