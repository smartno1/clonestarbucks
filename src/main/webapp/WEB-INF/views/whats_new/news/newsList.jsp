<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>Title</title>

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
        .search_kind div a.selected {
            background: #006633;
            color: #fff;
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
                    <a href="/whats_new/event/addEvent">
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
        </div>
    </main>

    <%@ include file="../../include/footer.jsp"%>
</div>
</body>
</html>
