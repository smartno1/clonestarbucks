<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <%--헤더 잡코딩--%>
        <%@include file="../include/static-head.jsp"%>
        <%--마이페이지 CSS--%>
        <link rel="stylesheet" type="text/css" href="/css/myStarbucks.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <section class="container-wrapper1">
                <div class="toptitle">
                    <div class="toptitle-bg">
                            <div class="toptitle-tt">
                                <h4><img alt="My 음료/매장" src="/images/my_Starbucks/ms_ttl.png"></h4>
                                <ul class="smap">
                                    <li><a href="/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                                    <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="작은 맵 화살표"></li>
                                    <li><a href="/my/index.do">My Starbucks</a></li>
                                </ul>
                            </div>
                    </div>
                </div>
                <div class="main-all">
                    <div class="main-all-bg">
                        <div class="mybox_lave">
                            <section class="ms_user_info ms_user_add">
                                <article class="ms_user_info_left">
                                    <h5><span class="en">My</span> 리워드</h5>
                                    <div class="plcc-logo" style="display:none;">
                                        <img src="/common/img/util/plcc-logo.png" >
                                    </div>
                                    <figure class="en ms_user_starbg">
                                        <span class="totalStar">4</span>
                                    </figure>
                                    <p class="ms_user_stat_notice">
                                        <strong>21</strong>개의 별★이 더 모이면<br>
                                        <strong class="en t_bd9b60">Gold Level</strong>
                                        만의 특별한 혜택이!</p>
                                </article>
                                <article class="ms_user_info_right">
                                    <p class="ms_user_stat">
                                        <span><strong class="userName">홍길동</strong> 님은</span>
                                        <span>현재 <strong class="en userGrade t_0d5f34">Green Level</strong>이십니다.</span></p>
                                    <div class="plcc-logo" style="display:none;">
                                        <img src="/common/img/util/plcc-logo.png" >
                                    </div>
                                    <div class="ms_user_stat_btns">
                                        <ul>
                                            <li><a href="./reward.do">리워드 및 혜택</a></li>
                                            <li><a href="./reward_star_history.do">별 히스토리</a></li>
                                            <li class="btn_black"><a href="./myinfo_modify_login.do">개인정보 수정</a></li>
                                            <li class="btn_gray"><a class="gray" href="./myinfo_modify_pwd.do">비밀번호 변경</a></li>
                                        </ul>
                                    </div>
                                </article>

                            </section>

                        </div>
                        <div class="mycad_roll">
                            <div class="my_ms_card_inner">
                                <div class="card_head">
                                    <h5><span class="en">My</span> 스타벅스 카드</h5>
                                    <p class="recent_card">총 보유카드 : 1장</p>
                                    <aside>
                                        <span><strong class="curSlideNo">1</strong>/<span class="totalCnt">1</span></span>
                                        <p>
                                            <a class="back" href="javascript:void(0);">이전카드 보기</a>
                                            <a class="forward" href="javascript:void(0);">다음카드 보기</a>
                                        </p>
                                    </aside>

                                    <i class="card_list_btn1"><a href="javascript:void(0);"><img src="//image.istarbucks.co.kr/common/img/util/card_list_btn1.png" alt="보유카드 상세정보"><!-- 접근성_20171201 alt 수정 --></a></i>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
        </section>
        <%--바디 내용끝--%>
        <%--푸터 내용시작--%>
<%--        <jsp:include page="../include/footer.jsp"></jsp:include>--%>
        <%--푸터 내용끝--%>




<%--자바스크릡트 공간입니다.--%>

    <jsp:include page="../include/footer.jsp"></jsp:include>
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
    </script>

    </body>

</html>