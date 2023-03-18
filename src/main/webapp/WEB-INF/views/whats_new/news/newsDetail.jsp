<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../include/static-head.jsp"%>
    <title>뉴스 | Starbucks Korea</title>
    <link rel="stylesheet" type="text/css" href="/css/whats_new/news/newsDetail.css">
</head>
<body>
<div class="wrapper">
    <%@include file="../../include/header.jsp"%>
    <main class="main-wrapper">
        <div class="main">
            <div class="top-section">
                <h2>뉴스
                    <c:if test="${loginUser.auth == 'ADMIN'}">
                    <a href="/whats_new/news/edit?newsId=${n.newsId}" id="edit">
                        <span class="edit">수정</span>
                    </a>
                    <a href=javascript:void(0) id="delete">
                        <span class="del" data-id="${n.newsId}">삭제</span>
                    </a>
                    </c:if>
                </h2>
                <nav class="nav">
                    <ul class="nav-ul">
                        <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
                        <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
                        <li><a href="javascript:void(0)"> 뉴스</a></li>
                    </ul>
                </nav>
            </div>
            <div class="middle-section">
                <div class="title clear-fix">
                    <h3>${n.title}</h3>
                    <ul>
                        <li>
                            <div class="share">
                                <img class="facebook" src="/images/icon/facebook.png" data-id="${n.newsId}"/>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="content">

                </div>
                <div class="go-list">
                    <a href="/whats_new/news/list?pageNum=${s.pageNum}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}&kind=${s.kind}">목록</a>
                </div>
            </div>
            <div class="bottom-section">
                <table>
                    <tbody>
                        <tr class="next">
                            <th>윗글</th>
                            <c:choose>
                                <c:when test="${not empty next}">
                                <td><a href="/whats_new/news/detail?newsId=${next.newsId}">${next.title}</a></td>
                                </c:when>
                                <c:when test="${empty next}">
                                    <td>해당글이 없습니다.</td>
                                </c:when>
                            </c:choose>
                        </tr>
                        <tr class="prev">
                            <th>아랫글</th>
                            <c:choose>
                                <c:when test="${not empty prev}">
                                    <td><a href="/whats_new/news/detail?newsId=${prev.newsId}">${prev.title}</a></td>
                                </c:when>
                                <c:when test="${empty prev}">
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
<script src="/js/share.js"></script>
<script>
    function contentShow(){
        console.log('${n.content}');
        document.querySelector('.content').innerHTML = `${n.content}`;
    }

    function deleteEvent(){
        if(document.getElementById('delete') === null) return;
        document.getElementById('delete').addEventListener('click', e => {
            if(!e.target.matches('.del')) return;

            if(confirm("정말로 삭제하시겠습니까?")){
                var id = e.target.dataset.id;
                console.log(id);
                const reqInfo = {
                    method:"POST"
                    ,body:id
                };
                fetch("/whats_new/news/delete",reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        console.log(msg);
                        if(msg === "delete success"){
                            alert("삭제에 성공하였습니다.");
                            location.href = "/whats_new/news/list";
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
