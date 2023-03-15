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
        <link rel="stylesheet" type="text/css" href="/css/suggestion/voc.css">
    </head>
        <body>
        <%--헤더 메뉴코너--%>
        <%@include file="../include/header.jsp"%>
        <%--헤더 메뉴코너끝--%>
        <%--바디 내용시작--%>
        <div class="container-wrapper1">
            <div class="toptitle">
                <div class="toptitle-bg">
                    <div class="toptitle-tt">
                        <h4><img alt="고객의 소리" src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png"></h4>
                        <ul class="smap">
                            <li><a href="/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로"></a></li>
                            <li><img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" alt="작은 맵 화살표"></li>
                            <li><a href="/suggestion/vocList">MY 고객의소리</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-all">
                <div class="main-all-bg" >
                    <nav class="ms_nav" id="msRnb">
                        <ul>
                            <li class="msRnb_btn"><a href="javascript:void(0)">자주 하는 질문</a></li> <!-- 20210809 수정 -->
                            <li class="msRnb_btn"><a href="javascript:void(0)">고객의 소리</a></li>
                            <li class="msRnb_btn"><a href="javascript:void(0)">스토어 케어</a></li>
                            <li><a href="javascript:void(0);">스타벅스 이용 팁<span class="sbox_arrow_down"></span></a>
                                <ul>
                                    <li><a href="javascript:void(0)">· 홈페이지 이용 팁</a></li>
                                    <li><a href="javascript:void(0)">· 애플리케이션 이용 팁</a></li>
                                    <li><a href="javascript:void(0)">· 제휴카드 안내</a></li>
                                </ul></li>
                            <li class="msRnb_btn"><a href="javascript:void(0)">고객 경험 설문조사</a></li> <!-- 20210811 수정 -->
                        </ul>
                    </nav>
                    <div class="ms_cont">
                        <!-- (고객의 소리) 고객의 소리 문의 하기 -->
                        <section class="my_suggestion_inquiry">
                            <!-- s: 고객의 소리 개선 220615 -->
                            <dl class="suggestion_inquiry_text">
                                <dt><span>귀한 말씀 들려 주십시오.</span><span>작은 소리도 듣겠습니다.</span></dt>
                                <!-- <dd>스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다.<br>만족스러운 서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다.<br>보다 나은 서비스로 보답하겠습니다.</dd> --><!-- 삭제 220830 -->
                            </dl>
                            <ul class="inquiry_date">
                                <li><span>전화상담(1522-3232) : 365일, 07:00~22:00</span></li>
                                <!-- <li><span>고객의 소리 : 365일, 09:00~18:00</span></li> --><!-- 삭제 220830 -->
                                <li class="description">※ 답변완료 시, APP PUSH로 알려드립니다.</li>
                                <li class="description">※ 최근 3개월 문의내역만 조회 가능합니다.</li> <!-- 추가 220830 -->
                            </ul>
                            <!-- e: 고객의 소리 개선 220615 -->
                            <p class="btn_suggestion_inquiry">
                                <c:if test="${loginUser == null}">
                                    <a href="/member/sign-in">로 그 인</a>
                                </c:if>
                                <c:if test="${loginUser != null}">
                                    <a href="/suggestion/csQuestion" id="suggestionIn">고객의 소리 문의 하기</a>
                                </c:if>
                            </p>
                            <!-- e: 220615 문구 수정 -->
                            <!-- <p class="btn_suggestion_inquiry2"><a href="/my/opinionList.do">2017. 12. 22 이전 나의 문의내역</a></p> -->
                        </section>
                        <!-- (고객의 소리) 고객의 소리 문의 하기 end -->

                        <!-- (고객의 소리) list -->
                        <section class="my_suggestion_list">
                            <div class="suggestion_list_inner">

                                <dl class="content_tabmenu" style="display:none;">
                                    <!-- 1번 시작 -->
                                    <dt class="tab tab_first tab_01 on"><h6><a href="#tab_01" onclick="i.goPage(1,'', 'G'); return false;">전체</a></h6></dt>
                                    <dt class="tab tab_02"><h6><a href="#tab_02" onclick="i.goPage(1,'N', 'G'); return false;">접수완료 </a></h6></dt>
                                    <dt class="tab tab_last tab_03" style="margin-left:0"><h6><a href="#tab_03" onclick="i.goPage(1,'Y', 'G'); return false;">답변완료 </a></h6></dt>
                                </dl><!-- 삭제 220830 -->
                                <dl class="sto_find_tab" style="margin-top:10px; display: none;"> <!-- 숨김 220830 -->

                                    <!-- 									<dt class="dt1"><a href="javascript:i.goPage(1,'G', 'W1');" id="tpW1">1주일</a></dt> -->
                                    <!-- 									<dt class="dt2"><a href="javascript:i.goPage(1,'G', 'M1');" id="tpM1">1개월</a></dt> -->
                                    <!-- 									<dt class="dt3"><a href="javascript:i.goPage(1,'G', 'M3');" id="tpM3">3개월</a></dt> -->

                                    <!-- 									<dt><p class="icon_receive"><a href="#tab_01" onclick="i.goPage(1,'G', 'W1'); return false;"><span>1주일</span></a> |  -->
                                    <!-- 									<a href="#tab_01" onclick="i.goPage(1,'G', 'M1'); return false;"><span>1개월</span></a> |  -->
                                    <!-- 									<a href="#tab_01" onclick="i.goPage(1,'G', 'M3'); return false;"><span>3개월</span></a></p></dt> -->
                                </dl>
                                <dl class="">


                                    <dd class="panel on" style="display: block;">


                                        <!-- 전체 -->
                                        <!-- (고객의 소리) 목록 -->
                                        <table class="suggestion_use_info_tbl" summary="고객의 소리 구분, 분야, 제목, 첨부파일, 작성일, 답변여부에 대한 테이블">
                                            <caption>고객의 소리 구분, 분야, 제목, 첨부파일, 작성일, 답변여부에 대한 테이블</caption>
                                            <colgroup>
                                                <col width="50">

                                                <col width="560">
                                                <col width="110">
                                                <!-- <col width="113"> -->
                                                <col width="110">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th class="en" scope="col">No</th>

                                                <th scope="col">제목</th>
                                                <th scope="col">작성일</th>
                                                <!-- <th scope="col">답변예정일</th> -->
                                                <th scope="col">답변여부</th>
                                            </tr>
                                            </thead>

                                            <tbody id="all">
                                            <c:choose>
                                                <c:when test="${sL != null}">
                                                    <c:forEach items="${sL}" var="s">
                                                        <tr>
                                                            <td>${s.no}</td>
                                                            <td><a href="/suggestion/detail?id=${s.id}">${s.title}</a></td>
                                                            <td>${s.regDate}</td>
                                                            <td>
                                                                <c:if test="${s.replyDone}">
                                                                    완료
                                                                </c:if>
                                                                <c:if test="${!s.replyDone}">
                                                                    대기
                                                                </c:if>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${sL == null}">
                                                    <tr>
                                                        <td colspan="6">
                                                            데이터가 없습니다.
                                                        </td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                        <!-- (고객의 소리) 목록 end -->

                                        <!-- (고객의 소리) 페이징 -->
                                        <div class="suggestion_tbl_pagination" style="display: none;">
                                            <ul class="pager" id="allPage"><li class=" active"><a href="javascript:void(0)">1</a></li></ul>
                                        </div>
                                        <!-- (고객의 소리) 페이징 end -->
                                        <!-- 전체 end -->
                                    </dd>
                                    <!-- 1번 끝 -->

                                </dl>
                            </div>
                        </section>
                        <!-- (고객의 소리) list end -->
                    </div>

                    </div>
                    <!--추천상품 -->
                </div>

            </div>
        </div>
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