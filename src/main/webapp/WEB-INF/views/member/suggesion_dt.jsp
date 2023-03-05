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
        <link rel="stylesheet" type="text/css" href="/css/suggesion_dt.css">
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
                        <nav class="ms_nav" id="msRnb">
                            <ul>
                                <li class="msRnb_btn"><a href="/member/member_admin">회원관리</a></li>
                                <li class="msRnb_btn"><a href="/member/del_member">탈퇴회원관리</a></li>
                                <li class="msRnb_btn"><a href="/member/suggestion">문의관리</a></li>

                            </ul>
                        </nav>

                        <div class="cheak-box">
                            <h3>문의관리</h3>
                            <div class="voc_info_input_btns">
                                <table>
                                    <tbody>
                                    <tr>
                                        <th>아이디</th>
                                        <td><input id="user_id" name="account" value=""></td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td><input  name="account" value=""></td>
                                    </tr>
                                    <tr >
                                        <th class="text_tt1">문의내용</th>
                                        <td><textarea></textarea></td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div><%--body-box end--%>

                    </div>

                </div><%-- 머리글 Rmx--%>



            </div><%-- 바디 전체틀 끝--%>





        </div>
        <%--바디 내용끝--%>






        <%--푸터 내용시작--%>

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
    function msRnbShow() {
        document.getElementById('msRnb').addEventListener('click', e => {
            if (e.target.matches('.sbox_arrow_down')) {
                e.target.parentElement.nextElementSibling.style.display = 'block';
                e.target.classList.remove('sbox_arrow_down');
                e.target.classList.add('sbox_arrow_up');
            }else if (e.target.matches('.sbox_arrow_up')) {
                e.target.parentElement.nextElementSibling.style.display = 'none';
                e.target.classList.remove('sbox_arrow_up');
                e.target.classList.add('sbox_arrow_down');
            }
        })
    }
    (function (){
        msRnbShow();
    })();

    </script>


    </body>

</html>