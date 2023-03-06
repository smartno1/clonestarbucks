<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <%@include file="../../include/static-head.jsp"%>
  <title>공지사항 | Starbucks Korea</title>

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
    .search-tap{
      padding: 20px 30px;
      background-color: #f4f4f2;
      position: relative;
      border-radius: 3px;
      margin-bottom: 40px;
    }
    .search-tap .search-kind{
      width: 100%;
      height: 100%;
      position: relative;
    }
    .search-kind div{
      float: right;
    }
    .search-kind form input {
      width: 321px;
      height: 36px;
      line-height: 36px;
      border: 1px solid #ddd;
      border-radius: 3px;
      text-indent: 10px;
      color: #666;
      box-sizing: content-box;
    }
    .search-kind .search-button{
      display: inline-block;
      width: 54px;
      height: 38px;
      line-height: 38px;
      background: #777;
      border-radius: 3px;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      text-align: center;
      margin-left: 10px;
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

  /* 게시글 표 */
 .middle-section table {
   width: 100%;
 }
  .middle-section table th{
    font-size: 14px;
    font-weight: bold;
    color: #222222;
    text-align: center;
    padding: 17px 0;
    border-top: 1px solid #333333;
    border-bottom: 1px solid #333333;
  }
 .middle-section table th:first-child{
   width: 5.45454%;
 }
 .middle-section table th:nth-child(2){
   width: 74.5454%;
 }
 .middle-section table th:nth-child(3){
   width: 10.90909%;
 }
 .middle-section table td{
   font-size: 16px;
   color: #666666;
   text-align: center;
   padding: 17px 0;
   border-bottom: 1px solid #dddddd;
   line-height: 1.8;
 }
 .middle-section table td.left{
   text-align: left;
   padding: 17px 0 17px 20px;
 }

 /* 페이징 */
 .bottom-section {
   margin-top: 50px;
   padding-bottom: 80px;

 }
 .bottom-section nav {
   height: 27px;
   margin-top: 50px;
   width: 100%;
 }
 .bottom-section nav ul {
   flex: 9;
   display: flex;
   justify-content: center;
 }

 .pagination-custom li {
   display: inline-block;
   vertical-align: middle;
   height: 28px;
   line-height: 28px;

   color: #555555;
   font-size: 12px;
   padding: 0 10px;
 }

 .pagination-custom li.active a{
   font-weight: bold;
   color: #006633 !important;
   text-decoration: underline;
 }
 .pagination-custom li:hover a {
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
        <h2>공지사항
          <c:if test="${loginUser.auth == 'ADMIN'}">
          <a href="/whats_new/notice/add">
            <span class="material-symbols-outlined">add</span>
            <span class="notice-add">공지사항 추가</span>
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
      <div class="search-tap">
        <div class="search-kind clear-fix">
          <div><a class="search-button" href=javascript:void(0) >검색</a></div>
          <div>
            <form id="form" action="/whats_new/notice/list">
              <input id="type" name="type" value="title" type="hidden">
              <input id="keyword" name="keyword" value="${s.keyword}" placeholder="검색어를 입력해 주세요.">
            </form>
          </div>
        </div>
      </div>
      <div class="middle-section">
        <table class="table table-dark table-striped table-hover articles">
          <thead>
            <tr>
              <th>NO</th>
              <th>제목</th>
              <th>날짜</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="n" items="${nList}">
              <tr>
                <td>${n.no}</td>
                <td class="left">
                  <a href=/whats_new/notice/detail?noticeId=${n.noticeId}&pageNum=${s.pageNum}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}&kind=${s.kind}">${n.title}</a>
                </td>
                <td>${n.regDate}</td>
                <td>${n.viewCnt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- 게시글 목록 하단 영역 -->
      <div class="bottom-section">

        <!-- 페이지 버튼 영역 -->
        <nav aria-label="Page navigation example">
          <ul class="pagination pagination-lg pagination-custom">

            <c:if test="${pm.prev}">
              <li class="page-item">
                <a class="page-link" href="/whats_new/notice/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">
                  <img src="/images/whats_new/notice/prev.png">
                </a>
              </li>
            </c:if>

            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
              <li data-page-num="${n}" class="page-item">
                <a class="page-link" href="/whats_new/notice/list?pageNum=${n}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">${n}</a>
              </li>
            </c:forEach>

            <c:if test="${pm.next}">
              <li class="page-item">
                <a class="page-link" href="/whats_new/notice/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">
                  <img src="/images/whats_new/notice/next.png">
                </a>
              </li>
            </c:if>
          </ul>
        </nav>
      </div>
    </div>
  </main>

  <%@ include file="../../include/footer.jsp"%>
</div>

<script>
  //현재 위치한 페이지에 active 스타일 부여하기
  function appendPageActive() {

    // 현재 내가 보고 있는 페이지 넘버
    const curPageNum = '${pm.page.pageNum}';
    // console.log("현재페이지: ", curPageNum);

    // 페이지 li태그들을 전부 확인해서
    // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
    // li를 찾아서 class active 부여
    const $ul = document.querySelector('.pagination');

    for (let $li of [...$ul.children]) {
      if (curPageNum === $li.dataset.pageNum) {
        $li.classList.add('active');
        break;
      }
    }
  }

  function search(){
    document.querySelector(".search-button").addEventListener("click", e => {
      if(!e.target.matches(".search-button")) return;

      const $form = document.getElementById("form");
      $form.submit();

    })
  }

  (function (){
    search();
    appendPageActive();
  })();
</script>
</body>
</html>
