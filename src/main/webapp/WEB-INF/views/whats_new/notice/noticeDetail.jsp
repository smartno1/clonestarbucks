<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>Notice</title>
    <link rel="stylesheet" type="text/css" href="/css/whats_new/notice/detailNotice.css">
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>공지사항
                    <c:if test="${loginUser.auth == 'ADMIN'}">
                    <a href="/whats_new/notice/edit?noticeId=${nt.noticeId}" id="edit">
                        <span class="edit">수정</span>
                    </a>
                    <a href=javascript:void(0) id="delete">
                        <span class="del" data-id="${nt.noticeId}">삭제</span>
                    </a>
                    </c:if>
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
        if(document.getElementById('delete') === null) return;
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
