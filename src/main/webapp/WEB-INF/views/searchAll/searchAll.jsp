<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <%@include file="../include/static-head.jsp"%>
  <title>뉴스 | Starbucks Korea</title>

  <style>
    /*상위부분 및 검색창   */

    .top-section{
      background-image: url("/images/search_all/search_all_bg.jpg");
      height: 178px;
      width: 100%;
      margin-bottom: 50px;
    }
    .top-section-wrapper{
      max-width: 1100px;
      margin: 0 auto;
    }

    .top-section h2{
      font-size: 30px;
      font-weight: bold;
      color: #FFFFFF !important;
      padding-top: 100px;
    }
    .nav {
      position: relative;
    }
    ul.nav-ul{
      float: right;
    }
    .nav-ul li{
      display: inline-block;
      height: 24px;
      line-height: 24px;
      font-size: 12px;
      vertical-align: middle;
    }
    .nav-ul li a {
      color: #FFFFFF;
    }
    .nav-ul li img {
      padding-top: 4px;
      color: #FFFFFF !important;
    }
    .nav-ul li:nth-child(2) img, .nav-ul li:nth-child(4) img{
      padding-top: 7px;
    }
    .main{
      width:100%;
      max-width:1100px;
      margin: 0 auto;
    }

    /*검색 -------------------------------------------------------------*/
    .search{
      margin: 30px 0;
      text-align: center;
    }
    .search h3{
      font-size: 18px;
      color: #222;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .search .search-keyword{
      width: 50%;
      margin: 0 auto;
      position: relative;
    }
    .search .search-keyword div{
      float: right;
    }
    .search .search-keyword form input {
      width: 440px;
      height: 40px;
      line-height: 40px;
      border: 3px solid #006633;
      border-radius: 30px;
      text-indent: 10px;
      color: #666;
      box-sizing: content-box;
      margin-right: 10px;
    }
    .search .search-keyword .search-button{
      background: url(/images/icon/btn_total_search.png);
      float: right;
      height: 45px;
      overflow: hidden;
      text-indent: -20000px;
      width: 45px;
    }
    .search .search-keyword div a{
      margin-right: 0;
    }
    .search .search-keyword div a:hover{
      text-decoration-line:underline;
      cursor: pointer;
    }
    .search .search-keyword div a.selected {
      background: #006633;
      color: #fff;
    }

    /*kind 셀렉트-----------------------------------------------------*/
    .kind{
      padding: 20px 30px;
      position: relative;
      border-radius: 3px;
      margin-bottom: 40px;
    }
    .kind .select-kind{
      width: 100%;
      height: 100%;
      position: relative;
    }
    .select-kind div a{
      float: left;
      background: #f4f4f1;
      color: black;
      height: 35px;
      line-height: 35px;
      border-radius: 3px;
      font-size: 14px;
      font-weight: bold;
      text-align: center;
      width: 19%;
      min-width: fit-content;
      margin-right: 1%;
      margin-bottom: 1%;
    }
    .select-kind div:last-child a{
      margin-right: 0;
    }
    .kind div a:hover{
      text-decoration-line:underline;
      cursor: pointer;
    }
    .kind div a.selected {
      background: #006633;
      color: #fff;
    }
    /* 리스트 공통 부분 ------------------------------*/
    .middle-section > div {
      margin-bottom: 40px;
    }
    .list-top {
      position: relative;
      border-bottom: 1px solid #ddd;
      height: 40px;
    }
    .list-top p {
      float: left;
      color: #222;
      font-size: 18px;
      font-weight: bold;
      margin-top: 12px;
    }
    .list-top a {
      display: block;
      float: right;
      background: #666;
      border-radius: 3px;
      color: #fff;
      font-size: 12px;
      font-weight: bold;
      height: 28px;
      line-height: 28px;
      padding: 0 20px;
    }

    .list-main{
      padding: 20px 0;
      border-bottom: 1px solid #ddd;
    }
    .list-box{

    }
    .list{
      position: relative;
      width: 100%;
      height: fit-content;
      margin-right: 1.8%;
      align-items:center;
      padding-bottom: 20px;
    }
    .list div {
      float: left;
      margin-right: 30px;
    }
    .list .list-img{
      width: 100%;
      max-width: 23.65%;
      vertical-align: baseline;
      overflow: hidden;
      margin-bottom: 15px;
    }
    .list .list-img img{
      width: 100%;
      height: 100%;
      max-width: 260px;
      max-height: 260px;
      object-fit: contain;
    }
    .list .list-context {
      width: 70%;
    }
    .list .list-context .list-title {
      color: #444;
      font-size: 16px;
      font-weight: bold;
      line-height: 1.8;
    }
    .list .list-context .list-title span{
      display: inline-block;
      background: #006633;
      border-radius: 3px;
      color: #fff;
      font-size: 12px;
      height: 20px;
      line-height: 20px;
      margin-left: 9px;
      text-align: center;
      width: 43px;
    }
    .list .list-context a{
      display: block;
      margin-top: 30px;
      background: #006633;
      border-radius: 3px;
      color: #fff;
      font-size: 15px;
      height: 20px;
      line-height: 20px;
      width: 20%;
      margin-left: 9px;
      text-align: center;
    }
    .list .list-context .list-sub{
      color: #666;
      font-size: 14px;
      margin-top: 10px;
      width: 100%;
    }
    .empty{
      text-align: center;
      padding-top: 10px;

    }

  </style>
</head>
<body>
<div class="wrapper">
  <%@include file="../include/header.jsp"%>
  <main class="main-wrapper">
    <div class="top-section">
      <div class="top-section-wrapper">
        <h2>통합검색</h2>
        <nav class="nav">
          <ul class="nav-ul">
            <li><a href="/"><img src="/images/icon/icon_home_w.png" alt="홈으로"></a></li>
            <li><img src="/images/icon/icon_arrow_w.png" alt="하위메뉴"></li>
            <li><a href="javascript:void(0)" class="en">통합검색</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <div class="main">
      <div class="search">
        <h3>원하시는 검색어를 입력하신 후 검색버튼을 클릭하세요.</h3>
        <div class="search-keyword clear-fix">
          <div><a class="search-button" href=javascript:void(0) >검색</a></div>
          <div>
            <form id="form" action="/search-all" method="GET">
              <input id="type" name="type"  value="search-all" type="hidden">
              <input id="keyword" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요.">
            </form>
          </div>
        </div>
      </div>
      <div class="kind">
        <div class="select-kind clear-fix">
          <div><a data-kinds="ALL" href=javascript:void(0)>전체검색</a></div>
          <div><a data-kinds="EVENT" href=javascript:void(0) >이벤트</a></div>
          <div><a data-kinds="NEWS" href=javascript:void(0) >뉴스</a></div>
          <div><a data-kinds="NOTICE" href=javascript:void(0) >공지사항</a></div>
          <div><a data-kinds="BEEN" href=javascript:void(0) >원두</a></div>
          <div><a data-kinds="DRINK" href=javascript:void(0) >음료</a></div>
          <div><a data-kinds="FOOD" href=javascript:void(0) >푸드</a></div>
          <div><a data-kinds="PRODUCT" href=javascript:void(0) >상품</a></div>
          <div><a data-kinds="CARD" href=javascript:void(0) >카드</a></div>
          <div><a data-kinds="STORE" href=javascript:void(0) >매장</a></div>
        </div>
      </div>
      <div class="middle-section">
        <div id="EVENT">
          <div class="list-top clear-fix">
            <p>이벤트</p>
            <a href="/whats_new/event/list">이벤트 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${event}" var="e">
                <c:if test="${!e.ended}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.listImg}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.prettierTitle}<span>진행중</span></p>
                      <p class="list-sub">${e.period}</p>
                      <a href="/whats_new/event/detail?id=${e.eventId}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="NEWS">
          <div class="list-top clear-fix">
            <p>뉴스</p>
            <a href="/whats_new/news/list">뉴스 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${news}" var="e">
              <li class="list clear-fix">
                <div class="list-img">
                  <img src="${e.listImg}"/>
                </div>
                <div class="list-context">
                  <p class="list-title">${e.title}</p>
                  <p class="list-sub">${e.regDate}</p>
                  <a href="/whats_new/news/detail?newsId=${e.newsId}">
                    자세히 보기
                  </a>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="NOTICE">
          <div class="list-top clear-fix">
            <p>공지사항</p>
            <a href="/whats_new/notice/list">공지사항 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${notice}" var="e">
              <li class="list clear-fix">
                <div class="list-img">
                  <img src="/images/starbucks_logo.png" style="max-width: 100px"/>
                </div>
                <div class="list-context">
                  <p class="list-title">${e.title}</p>
                  <p class="list-sub">${e.regDate}</p>
                  <a href="/whats_new/notice/detail?noticeId=${e.noticeId}">
                    자세히 보기
                  </a>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="BEEN">
          <div class="list-top clear-fix">
            <p>원두</p>
            <a href="/coffee/bean/list">원두 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${bean}" var="e">
              <li class="list clear-fix" data-kind="${e.kind}">
                <div class="list-img">
                  <img src="${e.image}"/>
                </div>
                <div class="list-context">
                  <p class="list-title">${e.nameKr}</p>
                  <p class="list-sub">${e.descriptionSummary}</p>
                  <a href="/coffee/bean/coffeeBeanDetail?id=${e.id}">
                    자세히 보기
                  </a>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="DRINK">
          <div class="list-top clear-fix">
            <p>음료</p>
            <a href="/menu/list">음료 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${menu}" var="e">
                <c:if test="${e.kind == 'category' || e.kind == 'theme'}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.image}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.nameKr}</p>
                      <p class="list-sub">${e.descriptionSummary}</p>
                      <a href="/menu/menuListDetail?id=${e.id}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="FOOD">
          <div class="list-top clear-fix">
            <p>푸드</p>
            <a href="/menu/food">푸드 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${menu}" var="e">
                <c:if test="${e.kind == 'food'}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.image}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.nameKr}</p>
                      <p class="list-sub">${e.descriptionSummary}</p>
                      <a href="/menu/foodListDetail?id=${e.id}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="PRODUCT">
          <div class="list-top clear-fix">
            <p>상품</p>
            <a href="/menu/sangpum">상품 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${menu}" var="e">
                <c:if test="${e.kind == 'sangpum'}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.image}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.nameKr}</p>
                      <p class="list-sub">${e.descriptionSummary}</p>
                      <a href="/menu/sangpumListDetail?id=${e.id}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="CARD">
          <div class="list-top clear-fix">
            <p>카드</p>
            <a href="javascript:void(0)">카드 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${card}" var="e">
                <c:if test="${e.kind == 'food'}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.image}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.nameKr}</p>
                      <p class="list-sub">${e.descriptionSummary}</p>
                      <a href="/menu/foodListDetail?id=${e.id}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div id="STORE">
          <div class="list-top clear-fix">
            <p>매장</p>
            <a href="javascript:void(0)">매장 더보기</a>
          </div>
          <div class="list-main">
            <ul class="list-box">
              <c:forEach items="${store}" var="e">
                <c:if test="${e.kind == 'food'}">
                  <li class="list clear-fix">
                    <div class="list-img">
                      <img src="${e.image}"/>
                    </div>
                    <div class="list-context">
                      <p class="list-title">${e.nameKr}</p>
                      <p class="list-sub">${e.descriptionSummary}</p>
                      <a href="/menu/foodListDetail?id=${e.id}">
                        자세히 보기
                      </a>
                    </div>
                  </li>
                </c:if>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </main>

  <%@ include file="../include/footer.jsp"%>
</div>

<script>

  /*
 * kind 선택시 색상변경 ---------------------------------------------
 */

  function selectKind(){
    document.querySelector('.select-kind').addEventListener('click', e => {
      if(!e.target.matches('.select-kind a')) return;
      console.log(e.target);
      const $kinds = [...document.querySelector('.select-kind').children];
      for(const k of $kinds){
        if (k.firstElementChild === e.target){
          e.target.classList.add("selected");
          console.log("selected-{}",e.target);
        }else{
          k.firstElementChild.classList.remove("selected");
          console.log("remove selected-{}",k.firstElementChild);
        }
      }
      showList();
    })
  }

  // 선택된 옵션에 맞는 리스트 보여주기 -------------------------------------------------
  function showList(e){
    const kind = document.querySelector('.select-kind div a.selected').dataset.kinds;
    const all = [...document.querySelector('.middle-section').children]
    all.forEach(function (a){
      if(kind === a.getAttribute("id") || kind === "ALL"){
        a.style.display = "block";
      }else {
        a.style.display = "none";
      }
    })

  }

  // 페이지로딩시 kind가 있으면 해당 kind 선택, 없으면 전체 선택
  function defaultKind(){
      const all = document.querySelector('.select-kind').firstElementChild;
      all.firstElementChild.classList.add('selected');
  }

  // 검색 기능 ----------------------------------------------------------------------
  function search() {
    document.querySelector(".search-button").addEventListener("click", e => {
      if (!e.target.matches(".search-button")) return;

      const $form = document.getElementById("form");
      $form.submit();

    })
  }

  // 검색내용 없을시 없음 표시 ------------------------------------------------------
  function empty(){
    const all = document.querySelectorAll('.list-box');
    all.forEach(function (a){
      if(!a.firstElementChild){
        a.innerHTML = `<li class="empty">검색된 결과가 없습니다.</li>`;
      }
    })
  }

  (function (){
    defaultKind();
    selectKind();
    search();
    empty();
  })();
</script>
</body>
</html>

