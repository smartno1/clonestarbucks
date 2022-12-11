<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <%@include file="../include/static-head.jsp"%>
  <title>커피 | Starbucks Coffee Korea</title>
  <style>
    .resultWrap{
      letter-spacing: -0.5px;
      background: url("/images/pFinder_bg.png");
    }
    .resultHeader {
      width: 100%;
      max-width: 1100px;
      margin: 0 auto;
      background: url("/images/bg-finder-top.png");
    }
    .resultHeader .container-name{
      /*margin-top: 120px;*/
      padding-bottom: 20px;
      width: 100%;
      height: 98px;
      position: relative;
      background:url("/images/bg-finder-top.png");
    }
    .resultHeader .container-name h2{
      font-size: 30px;
      font-weight: bold;
      padding-top: 30px;
    }
    .resultHeader .container-name p {
      font-size: 16px;
      color: #666;
      padding-top: 20px;
    }
    .resultHeader .nav .nav-ul{
      float: right;
      position: absolute;
      right: 0;
      top: 60px;
    }
    .resultHeader .nav .nav-ul li{
      display: inline-block;
      height: 24px;
      line-height: 24px;
      font-size: 12px;
      color: #666666;
      vertical-align: middle;
    }
    .resultHeader .nav .nav-ul li img {
      padding-top: 4px;
    }
    .resultHeader .nav .nav-ul li > img{
      padding-top: 7px;
    }
  </style>
</head>
<body>
<div class="wrap">
  <%@include file="../include/header.jsp"%>
  <main class="resultWrap">
    <section class="resultHeader">
      <div class="container-name">
        <h2>나와 어울리는 커피</h2>
        <p>당신과 잘 어울릴 것 같은 스타벅스의 커피 입니다.</p>
        <nav class="nav">
          <ul class="nav-ul">
            <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/bean" class="en">COFFEE</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/bean">커피</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="javascript:void(0)">나와 어울리는 커피</a></li>
          </ul>
        </nav>
      </div>
    </section>
    <section class="middle">


    </section>
  </main>
  <%@include file="../include/footer.jsp"%>
</div>
</body>
</html>