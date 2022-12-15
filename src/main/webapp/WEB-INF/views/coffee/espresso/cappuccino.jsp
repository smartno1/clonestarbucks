<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>카푸치노 | Starbucks Korea</title>

    <style>
        .wrap{
            width: 100%;
            letter-spacing: -0.5px;
        }
        .Header {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }
        .Header .container-name{
            /*margin-top: 120px;*/
            margin-bottom: 20px;
            width: 100%;
            height: 98px;
            background: #ffffff;
            position: relative;
        }
        .Header .container-name h2{
            font-size: 30px;
            font-weight: bold;
            padding-top: 30px;
        }
        .Header .container-name p {
            font-size: 16px;
            color: #666;
            padding-top: 20px;
        }
        .Header .nav .nav-ul{
            float: right;
            position: absolute;
            right: 0;
            top: 60px;
        }
        .Header .nav .nav-ul li{
            display: inline-block;
            height: 24px;
            line-height: 24px;
            font-size: 12px;
            color: #666666;
            vertical-align: middle;
        }
        .Header .nav .nav-ul li img {
            padding-top: 4px;
        }
        .Header .nav .nav-ul li > img{
            padding-top: 7px;
        }
        .middle {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }
        .middle .pic img{
            width: 100%;
            max-width: fit-content;
        }
        .middle .info {
            padding: 30px 0 60px 0;
        }
        .middle .info .p1{
            font-size: 20px;
            color: #006633;
            font-style: italic;
            line-height: 1.6;
            padding-bottom: 20px;
        }
        .middle .info .p2{
            font-size: 14px;
            color: #666;
            line-height: 1.6;
        }
        .bottom{
            background: #f4f4f2;
            padding: 40px 0 80px 0;
        }
        .bottom .container{
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }
    </style>
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
                        <li><a href="javascript:void(0)">카푸치노</a></li>
                    </ul>
                </nav>
            </div>
        </section>
        <section class="middle">
            <div class="pic">
                <img src="/images/coffee/espresso/cappuccino_img01.jpg" alt="">
            </div>
            <div class="info">
                <p class="p1">“카푸치노는 바리스타가 가진 가장 고도화된 기술입니다.”</p>
                <p class="p2">스타벅스의 바리스타는 카푸치노에 공기가 들어간 가벼운 거품과 맛있는 에스프레소가 만나 조화를 이루는 시점에 대해 고도의 트레이닝을 하며 테스트를 통과해야만 합니다.
                    무게에 따라 더 가벼운 카푸치노와 혹은 더 무거운 카푸치노를 원한다면 바리스타에게 미리 요청하세요. 취향에 맞는 카푸치노를 제조해드립니다.</p>

            </div>
        </section>
        <section class="bottom">
            <div class="container">
                <ul class="list clear-fix">
                    <li class="">
                    </li>
                </ul>
            </div>
        </section>
    </main>
    <%@include file="../../include/footer.jsp"%>
</div>
</body>
</html>
