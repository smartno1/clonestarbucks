<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>Notice</title>

    <style>
        /*상위부분 및 검색창   */
        .main{
            width:100%;
            max-width:1100px;
            margin: 0 auto;
        }
        .top-section{
            margin-bottom: 20px;
        }
        .top-section h2{
            font-size: 30px;
            font-weight: bold;
            padding-top: 30px;
        }
        .top-section > h2 a{
            margin-left: 20px;
            padding-left: 10px;
            font-size: 14px;
        }
        .top-section h2 a span{
            vertical-align: text-bottom;
        }
        .top-section h2 a span.notice-add{
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

        /* 게시글  */
        .middle-section .title{
            position: relative;
            border-top: 1px solid #333333;
            border-bottom: 1px solid #333333;
            padding: 20px 140px 20px 20px;
        }
        .middle-section .title input{
            float: left;
            font-size: 18px;
            font-weight: bold;
            color: #222222;
            width: 80%;
        }
        .middle-section .title ul{
            float:right;
        }
        .content {
            padding: 30px 10px;
            border-bottom: 1px solid #dddddd;
            font-size: 14px;
        }
        .content textarea{
            width: 100%;
            height: fit-content;
            min-height: 300px;
            resize: none;
        }
        .button{
            position: relative;
            margin-bottom: 50px;
        }

        .go-list,
        .submit{
            float: right;
            width: 8%;
            height: 45px;
            position: relative;
            margin-top: 20px;
            margin-left: 10px;
        }
        .go-list a,
        .submit div{
            display: block;
            font-size: 14px;
            border-radius: 3px;
            background-color: #666666;
            color: #fff;
            font-weight: bold;
            text-align: center;
            height: 45px;
            line-height: 45px;
        }
        .go-list a:hover,
        .submit div:hover{
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>공지사항 수정</h2>
                <nav class="nav">
                    <ul class="nav-ul">
                        <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)"> 공지사항</a></li>
                    </ul>
                </nav>
            </div>
            <div class="middle-section">
                <form id="form" action="/whats_new/notice/edit" method="POST">
                    <div class="title clear-fix">
                        <input name="noticeId" value="${nt.noticeId}" type="hidden">
                        <input name="title" value="${nt.title}">
                        <ul>
                            <li>

                            </li>
                        </ul>
                    </div>
                    <div class="content">
                        <textarea id="content" name="content">${nt.content}</textarea>
                    </div>
                    <div class="button clear-fix">
                        <div class="go-list">
                            <a onclick="history.go(-1)">취소</a>
                        </div>
                        <div class="submit">
                            <div id="edit">수정</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="../../include/footer.jsp"%>
</div>

<script>

    function editEvent(){
        document.getElementById('edit').addEventListener('click',e => {
            if(!e.target.matches('#edit')) return;
            const $form = document.getElementById('form');
            $form.submit();
        })
    }

    (function (){
        editEvent();

    })();
</script>
</body>
</html>
