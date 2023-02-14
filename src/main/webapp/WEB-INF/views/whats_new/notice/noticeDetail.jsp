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
        .middle-section .title h3{
            float: left;
            font-size: 18px;
            font-weight: bold;
            color: #222222;
            width: 80%;
        }
        .middle-section .title ul{
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            border-left: 1px solid #ddd;
            padding-left: 10px;
        }
        .middle-section .title .share img{
            width:28px;
        }
        .middle-section .title .share img:hover{
            cursor:pointer;
        }
        .content {
            padding: 30px 10px;
            border-bottom: 1px solid #dddddd;
            font-size: 14px;
        }
        .go-list {
            width: 100%;
            height: 45px;
            position: relative;
            margin-top: 20px;
        }
        .go-list a{
            display: block;
            font-size: 14px;
            border-radius: 3px;
            background-color: #666666;
            color: #fff;
            font-weight: bold;
            text-align: center;
            height: 45px;
            line-height: 45px;
            width: 8%;
            margin-left: 92%;
        }
        .go-list a:hover{
            cursor: pointer;
            text-decoration: underline;
        }
        /* 하단 윗글, 아랫글 */
        .bottom-section {
            margin-top: 50px;
            padding-bottom: 80px;
        }
        .bottom-section table{
            width: 100%;
        }
        .bottom-section table tr th{
            padding: 15px 0 15px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #222222;
            background: #f4f4f2;
            text-align: left;
            border-bottom: 1px solid #dddddd;
            width: 20%;
        }
        .bottom-section table tr td{
            padding: 15px 0 15px 20px;
            font-size: 14px;
            color: #666666;
            border-bottom: 1px solid #dddddd;
        }
        .bottom-section table tr.next{
            border-top: 1px solid #333333;
        }
        .bottom-section table tr.prev th,
        .bottom-section table tr.prev td{
            border-bottom: 1px solid #333333;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>공지사항
                    <a href="/whats_new/notice/edit?noticeId=${nt.noticeId}" id="edit">
                        <span class="edit">수정</span>
                    </a>
                    <a href=javascript:void(0) id="delete">
                        <span class="del" data-id="${nt.noticeId}">삭제</span>
                    </a>
                </h2>
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
                <div class="title clear-fix">
                    <h3>${nt.title}</h3>
                    <ul>
                        <li>
                            <div class="share">
                                <img class="facebook" src="/images/icon/facebook.png" data-id="${nt.noticeId}"/>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="content">

                </div>
                <div class="go-list">
                    <a href="/whats_new/notice/list?pageNum=${s.pageNum}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}&kind=${s.kind}">목록</a>
                </div>
            </div>
            <div class="bottom-section">
                <table>
                    <tbody>
                        <tr class="next">
                            <th>윗글</th>
                            <c:choose>
                                <c:when test="${not empty nextNt}">
                                <td><a href="/whats_new/notice/detail?noticeId=${nextNt.noticeId}">${nextNt.title}</a></td>
                                </c:when>
                                <c:when test="${empty nextNt}">
                                    <td>해당글이 없습니다.</td>
                                </c:when>
                            </c:choose>
                        </tr>
                        <tr class="prev">
                            <th>아랫글</th>
                            <c:choose>
                                <c:when test="${not empty prevNt}">
                                    <td><a href="/whats_new/notice/detail?noticeId=${prevNt.noticeId}">${prevNt.title}</a></td>
                                </c:when>
                                <c:when test="${empty prevNt}">
                                    <td>해당글이 없습니다.</td>
                                </c:when>
                            </c:choose>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <%@ include file="../../include/footer.jsp"%>
</div>

<script>
    function contentShow(){
        document.querySelector('.content').innerHTML = `${nt.content}`;
    }

    function deleteEvent(){
        document.getElementById('delete').addEventListener('click', e => {
            if(!e.target.matches('.del')) return;

            if(confirm("정말로 삭제하시겠습니까?")){
                var id = e.target.dataset.id;
                console.log(id);
                const reqInfo = {
                    method:"DELETE"
                    ,body:id
                };
                fetch("/whats_new/notice/delete",reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        console.log(msg);
                        if(msg === "delete success"){
                            alert("삭제에 성공하였습니다.");
                            location.href = "/whats_new/notice/list";
                        }else{
                            alert("삭제에 실패하였습니다.");
                        }
                    })
            }

        })
    }

    (function (){
        deleteEvent();
        contentShow();

    })();
</script>
</body>
</html>
