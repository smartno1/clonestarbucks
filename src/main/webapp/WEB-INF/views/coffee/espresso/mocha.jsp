<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>모카 | Starbucks Korea</title>

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
                        <li><a href="javascript:void(0)">모카</a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="middle">
            <div class="pic">
                <img src="/images/coffee/espresso/mocha_img01.jpg" alt="">
            </div>
            <div class="info">
                <p class="p1">“모카는 초콜릿의 달콤함과 커피의 쌉싸름한 맛을 동시에 느낄 수 있습니다.”</p>
                <p class="p2">갓 추출한 에스프레소에 모카 시럽을 넣어 잘 섞어줍니다. 여기에 스팀 밀크를 추가하여 진한 커피 맛과 달콤한 초콜릿 맛이 잘 조화되도록 합니다.
                    더욱 달콤한 맛을 원한다면 휘핑크림을 올려 즐겨보세요.</p>

            </div>
        </section>
        <%@include file="bottomProduct.jsp"%>
    </main>
    <%@include file="../../include/footer.jsp"%>
</div>
</body>
</html>
