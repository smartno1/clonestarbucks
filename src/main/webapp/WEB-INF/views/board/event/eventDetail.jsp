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
      vertical-align: text-bottom;
    }
    .name h2 a span.name-add{
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
      border: 1px solid #ddd;
      position: relative;
      border-radius: 3px;
      margin-bottom: 40px;
    }
    .search-tap {
      width: 100%;
      height: 100%;
      position: relative;
    }
    .search-tap > div{

                  }
    .search-tap .share img{
      padding-top:20px;
      width:32px;
    }
    .search-tap .share img:hover{
      cursor:pointer;
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
    .event-box{
      margin-top: 20px;
      position: relative;
    }
    .event{
      float: left;
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
    }
    .event.onGoing a img{
      width: inherit;
      object-fit: contain;
      transition: all 0.5s linear;
    }
    .event.onGoing a img:hover{
      transform:scale(1.2)
    }
    .event.end a{
      display: block;
      position: relative;
      background-color: #646464;
    }
    .event.end a i {
      display: block;
      position: absolute;
      width: 100%;
      height: 100%;
      background: #000;
      opacity: 0.7;
    }
    .event.end a i img{
      width: 100%;
      max-width: fit-content;
      position: relative;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
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
          <a href="/board/event/addEvent">
            <span class="name-add">수정 삭제</span>
          </a>
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
      <div class="search-tap">
        <span class="title">${event.title}</span> <span>${event.period}</span>
        <span>
          <ul>
            <li>
              <div class="share">
                <img class="facebook" src="/images/icon/facebook.png" data-id="${coffee.id}"/>
              </div>
            </li>
          </ul>
        </span>
      </div>
      <div class="event-wrapper">
        <div class="event-list">
          <h2 class="event-verify">
            진행 이벤트
          </h2>
          <ul class="event-box clear-fix">
            <c:forEach items="${events}" var="e">
              <c:choose>
                <c:when test="${!e.ended}">
                  <li class="event onGoing" data-kind="${e.kind}">
                    <a href="/board/event/detail?id=${e.eventId}">
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
      </div>
    </div>
  </main>
  <%@ include file="../../include/footer.jsp"%>
</div>
<script src="/js/share.js"></script>
</body>
</html>