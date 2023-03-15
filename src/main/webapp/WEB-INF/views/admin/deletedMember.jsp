<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <%--헤더 잡코딩--%>
        <%@include file="../include/static-head.jsp"%>
        <title>마이 스타벅스 | Starbucks Korea</title>
        <%--마이페이지 CSS--%>
        <link rel="stylesheet" type="text/css" href="/css/admin/m_admin.css">
        <script>
            // 페이징에 넘겨줄 주소 저장.
            const href = "/admin/deleted_member";
        </script>
    </head>
    <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div class="all-mo"> <%-- 바디 전체틀 --%>
                <div class="toptittle"><%-- 머리글 --%>
                    <div class="ms_sub_tit_inner">
                        <h4><img alt="관리자 메뉴" src="/images/member_ad.png"></h4>
                        <ul class="smap">
                            <li><a href="#"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="하위메뉴"></li>
                            <li><a href="#"><span class="kor">관리자 메뉴</span></a></li>
                        </ul>
                    </div>
                    <div class="body-box"><%--body-box--%>
                        <%@include file="rightMenu.jsp"%>

                        <div class="cheak-box">
                            <h3>탈퇴회원</h3>
                            <div class="voc_info_input_guide">
                                <p class="memdwecu"><a href="/admin/deleted_member">현재 회원수 : </a></p>
                                <b class="member_count"> ${totalCount} </b>
                                <p class="memdwecu">검색된 회원수 : </p>
                                <b class="member_count"> ${pm.totalCount} </b>
                                <div class="tt_sh">
                                    <form id="search_form" >
                                        <input id="type" type="hidden" name="type" value="search">
                                        <input id="keyword" type="text" name="keyword" value="${s.keyword}" placeholder="검색어를 입력하세요.">
                                        <button type="button" class="search-button">검색</button>
                                    </form>
                                </div>
                            </div>
                            <div class="voc_info_input_btns del">
                                <table>
                                    <tr>
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>고객이름</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                    </tr>
                                    <tbody>
                                    <c:forEach items="${memberList}" var="m">
                                        <tr onclick="detail('${m.account}')">
                                            <td>${m.no}</td>
                                            <td>${m.account}</td>
                                            <td>${m.name}</td>
                                            <td>${m.phone}</td>
                                            <td>${m.email}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <%-- 페이징 시작--%>
                            <%@include file="../include/paging.jsp"%>
                            <%-- 페이징 끝--%>
                        </div>
                    </div><%--body-box end--%>
                </div>
            </div><%-- 머리글 Rmx--%>
        </div><%-- 바디 전체틀 끝--%>
            <%--푸터 내용시작--%>
    </body>
    <div class="foodboot_end">
    <jsp:include page="../include/footer.jsp"></jsp:include>
    </div><%--푸터 내용끝--%>

        <%--자바스크릡트 공간입니다.--%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var error = "${error}";
            var msg = "error is " + error;
            if (error) {
                alert(msg);
            }
        });

        // 메시지 있을때 띄우기
        if(${msg == "recovery_success"} || ${msg == "recovery_fail"} ){
            alert("${msg}");
        }

        // 검색기능 ---------------------------------------------------//
        function search(){
            document.querySelector(".search-button").addEventListener("click", e => {

                if(!e.target.matches(".search-button")) return
                const search = document.getElementById('search_form');
                console.log("search : ", search);
                search.setAttribute("action","/admin/deleted_member");
                search.setAttribute("method","GET");
                search.submit();


            });
        }

        //  상세페이지 이동--------------------------------------------------//
        function detail(account){
            location.href = "/admin/deleted_member_detail?account="+account+"&pageNum=${s.pageNum}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}&kind=${s.kind}";
        }

        (function (){
            search();

        })();

    </script>

</html>