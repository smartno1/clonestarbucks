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
            const href = "/admin/suggestion";
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
                            <h3>문의관리</h3>
                            <div class="voc_info_input_guide" style="padding: 20px 20px 40px 20px">
                                <p><a href="/admin/suggestion">총 문의 : </a></p>
                                <b>${totalCount}</b>
                                <p><a href="/admin/suggestion?type=new">확인안한 문의 : </a></p>
                                <b class="no_confirm_count"> ${NewSg} </b>
                                <p><a href="/admin/suggestion?type=no_reply">답변대기 문의 : </a></p>
                                <b class="no_reply_count"> ${NoReplySg} </b>
                                <p>검색된 문의 : </p>
                                <b>${pm.totalCount}  </b>
                                <br>
                                <div class="tt_sh" style="width: 100%;text-align: right">
                                    <form id="search_form" style="padding: 20px" >
                                        <input id="type" type="hidden" name="type" value="search">
                                        <input id="keyword" type="text" name="keyword" value="${s.keyword}" placeholder="검색어를 입력하세요.">
                                        <button type="button" class="search-button">검색</button>
                                    </form>
                                </div>
                            </div>
                            <div class="voc_info_input_btns">
                                <table>
                                    <tr>
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>문의내용</th>
                                        <th>답변여부</th>

                                    </tr>
                                    <tbody>
                                    <c:forEach items="${suggestionList}" var="su">
                                        <tr style="cursor: pointer" onclick="detail(${su.id})">
                                            <td>${su.no}</td>
                                            <td>${su.account}</td>
                                            <td>${su.title}</td>
                                            <td id="confirm"  data-confirm="${su.confirm}" data-replydone="${su.replyDone}"><button class="btt_ck1">답변대기</button></td>
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


        // 검색기능 ---------------------------------------------------//
        function search(){
            document.querySelector(".search-button").addEventListener("click", e => {

                if(!e.target.matches(".search-button")) return
                const search = document.getElementById('search_form');
                console.log("search : ", search);
                search.setAttribute("action","/admin/suggestion");
                search.setAttribute("method","GET");
                search.submit();


            });
        }

        //답변여부 및 확인안한 문의 표시 ------------------------------------//
        function confirmCheck(){

            const suggestionList = document.querySelectorAll('#confirm');
            // 답변 여부 확인하여 답변여부 텍스트 변경.
            for(let su of suggestionList){
                console.log("replyDone : ",su.dataset.replydone);
                if(su.dataset.replydone === "true"){
                    su.firstElementChild.classList.replace("btt_ck1","btt_ck2");
                    su.firstElementChild.textContent="답변완료";
                }else{
                    su.firstElementChild.textContent="답변대기";
                }
                if(su.dataset.confirm === "false"){ // 문의내용 확인여부 검사하여 false면 new 표시
                    su.previousElementSibling.innerHTML += `<span style='color:blue'> [new]</span>`
                    console.log("count");
                }
            }

        }

        //  상세페이지 이동--------------------------------------------------//
        function detail(id){
            location.href = "/admin/suggestion_detail?id="+id+"&pageNum=${s.pageNum}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}&kind=${s.kind}";
        }

        (function (){
            confirmCheck();
            search();
        })();

    </script>


    </body>

</html>