<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <%@include file="../../include/static-head.jsp"%>
  <title>이벤트 | Starbucks Korea</title>
  <style>

    .middle{
      width:100%;
      max-width:1100px;
      margin: 0 auto;
    }
    .name{
      margin-bottom: 20px;
    }
    .name h2{
      font-size: 30px;
      font-weight: bold;
      padding-top: 30px;
    }
    .name > h2 a{
      margin-left: 20px;
      padding-left: 10px;
      font-size: 14px;
    }

    .name h2 a span{
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
    .top{
      padding: 20px 30px;
      border: 1px solid #ddd;
      position: relative;
      border-radius: 3px;
      margin-bottom: 40px;

    }
    .top .title{
      float: left;
      font-size: 18px;
      font-weight: bold;
      color: #222222;
    }
    .top .period{
      font-size: 12px;
      font-weight: normal;
      color: #666666;
      padding-left: 5px;
      vertical-align: bottom;
    }
    .top ul{
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
      border-left: 1px solid #ddd;
      padding-left: 10px;
    }
    .top .share img{
      width:28px;
    }
    .top .share img:hover{
      cursor:pointer;
    }
    .content {
      padding: 60px 50px 0;
    }
    .content img{
      width: 100%;
    }
    .goList {
      padding-top: 20px;
      position: relative;
      margin-bottom: 60px;
    }
    .goList a{
      display: block;
      width: 84px;
      height: 45px;
      float: right;
      margin-right: 50px;
      background-color: #666666;
      border-radius: 3px;
      text-align: center;
      line-height: 45px;
      color: #fff;
      font-weight: bold;
      font-size: 14px;
    }
    .event-list{
      padding-bottom:50px;
    }
    .event-verify{
      background-color:#f4f4f2;
      width:100%;
      font-weight:bold;
      font-size: 18px;
      padding: 20px;
      box-sizing: border-box;
    }
    .event-wrapper .event-list{
      position: relative;
    }
    .event-wrapper .swiper-container{
      position: relative;
      max-width: 90%;
      margin: 0 auto;
      padding-top: 20px;

    }
    .event-wrapper .swiper-pagination{
      bottom: 30px;
      left: 0;
      right: 0;
      z-index: 0;
    }
    .event-wrapper .swiper-pagination .swiper-pagination-bullet {
      background-color: transparent;
      background-image: url("/images/promotion_slide_pager.png");
      width: 13px;
      height: 12px;
      margin-right: 6px;
      outline: none;
    }
    .event-wrapper .swiper-pagination .swiper-pagination-bullet:last-child {
      margin-right: 0;
    }
    .event-wrapper .swiper-pagination .swiper-pagination-bullet-active {
      background-image: url("/images/promotion_slide_pager_on.png");
    }
    .event-wrapper .swiper-prev{
      position: absolute;
      left: 0;
      top: 40%;
    }
    .event-wrapper .swiper-next{
      position: absolute;
      right: 0;
      top: 40%;
    }
    .event{
      width: 100%;
      max-width: 23.65%;
      height: fit-content;
      margin-right: 1.8%;
      align-items:center;
      padding-bottom: 20px;
    }
    .event:nth-child(4n){
      margin-right: 0;
    }
    .event a{
      display: block;
      width: inherit;
      max-width: 260px;
      vertical-align: baseline;
      overflow: hidden;
      margin-bottom: 15px;
    }
    .event a img{
      width: 100%;
      object-fit: contain;
    }
    .event .event-name {
      font-size: 16px;
      color: #444444;
      text-align: center;
      width: 100%;
      white-space: break-spaces;
    }
    .event .event-period{
      font-size: 12px;
      color: #666666;
      margin-top: 8px;
      text-align: center;
      width: 100%;
    }
    section{
      z-index:-66;
    }
    header{
      z-index:99;
    }
  </style>
</head>
<body>
<div class="wrapper">
  <%@include file="../../include/header.jsp"%>
  <main class="main-wrapper">
    <div class="middle">
      <div class="name">
        <h2>이벤트
          <c:if test="${loginUser.auth == 'ADMIN'}">
          <a href="/whats_new/event/edit?id=${event.eventId}" id="edit">
            <span class="edit">수정</span>
          </a>
          <a href=javascript:void(0) id="delete">
            <span class="del" data-id="${event.eventId}">삭제</span>
          </a>
          </c:if>
        </h2>
        <nav class="nav">
          <ul class="nav-ul">
            <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="javascript:void(0)" class="en">WHAT'S NEW</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="javascript:void(0)"> 이벤트</a></li>
          </ul>
        </nav>
      </div>
      <div class="top">
        <h3 class="title">${event.title}</h3> <span class="period">${event.period}</span>
        <ul>
          <li>
            <div class="share">
              <img class="facebook" src="/images/icon/facebook.png" data-id="${event.eventId}"/>
            </div>
          </li>
        </ul>
      </div>
      <div class = "content">
        <img src="">
      </div>
      <div class="goList clear-fix">
        <a href="/whats_new/event/list?kind=${kind}">
          목록
        </a>
      </div>
      <div class="event-wrapper">
        <div class="event-list">
          <h2 class="event-verify">
            진행 이벤트
          </h2>
          <div class="swiper-container">
            <ul class="swiper-wrapper event-box clear-fix">
              <c:forEach items="${events}" var="e">
                <c:choose>
                  <c:when test="${!e.ended}">
                    <li class="swiper-slide event onGoing" data-kind="${e.kind}">
                      <a href="/whats_new/event/detail?id=${e.eventId}&kind=ALL">
                        <img src="${e.listImg}"/>
                      </a>
                      <p class="event-name">${e.prettierTitle}</p>
                      <p class="event-period">${e.period}</p>
                    </li>
                  </c:when>
                </c:choose>
              </c:forEach>
            </ul>
          </div>
          <div class="swiper-pagination"></div>
          <div><img  class="swiper-prev" src="/images/whats_new/event/slide_arrow_l.png"></div>
          <div><img  class="swiper-next" src="/images/whats_new/event/slide_arrow_r.png"></div>
        </div>
      </div>
    </div>
  </main>
  <%@ include file="../../include/footer.jsp"%>
</div>
<script src="/js/share.js"></script>
<script>
  function swiperEvent() {
    new Swiper('.event-wrapper .swiper-container', {
      // direction: 'horizontal', // 수평 슬라이드
      autoplay: { // 자동 재생 여부
        delay: 3000 // 5초마다 슬라이드 바뀜
      },
      loop: true, // 반복 재생 여부
      slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
      slidesPerGroup: 3, // 3 개를 그룹으로 묶기, 위의 퍼뷰와 갯수를 일치하는게 좋음.
      loopFillGroupWithBlank: true, // 그룹수가 맞지 않을 경우 빈칸으로 메우기, 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      spaceBetween: 150, // 슬라이드 사이 여백
      centeredSlides: false, // 1번 슬라이드가 가운데 보이기
      pagination: { // 페이지 번호 사용 여부
        el: '.event-wrapper .swiper-pagination', // 페이지 번호 요소 선택자
        clickable: true // 사용자의 페이지 번호 요소 제어 가능 여부
      },
      navigation: { // 슬라이드 이전/다음 버튼 사용 여부
        prevEl: '.event-wrapper .swiper-prev', // 이전 버튼 선택자
        nextEl: '.event-wrapper .swiper-next' // 다음 버튼 선택자
      }
    })
  }
  function contentShow(){
    const $div = document.createElement('div');
    $div.innerHTML = `${event.content}`;
    document.querySelector('.content').appendChild($div);
  }
  function deleteEvent(){
    document.getElementById('delete').addEventListener('click', e => {
      if(!e.target.matches('.del')) return;

      if(confirm("정말로 삭제하시겠습니까?")){
        var id = e.target.dataset.id;
        console.log(id);
        const reqInfo = {
          method:"POST"
          ,body:id
        };
        fetch("/whats_new/event/delete",reqInfo)
                .then(res => res.text())
                .then(msg => {
                  console.log(msg);
                  if(msg === "delete success"){
                    alert("삭제에 성공하였습니다.");
                    location.href = "/whats_new/event/list";
                  }else{
                    alert("삭제에 실패하였습니다.");
                  }
                })
      }
    })
  }

  (function (){
    swiperEvent();
    deleteEvent();
    contentShow();

  })();
</script>
</body>
</html>