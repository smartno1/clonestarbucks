<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>아메리카노 | Starbucks Korea</title>

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
                        <li><a href="javascript:void(0)">아메리카노</a></li>
                    </ul>
                </nav>
            </div>
        </section>

    </main>
</div>
</body>
</html>
