<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <%@include file="../../include/static-head.jsp"%>
  <title>커피 | Starbucks Korea</title>
  <style>

    .productWrap{
      letter-spacing: -0.5px;
      background: url("/images/coffee/bean/pFinder_bg.png");
    }
    .productWrap a:hover{
      text-decoration: underline;
    }
    .productWrap img{
      transition: 1s;
      cursor: pointer;
    }
    .productWrap img:hover{
      scale: 1.1;
    }
    .productWrap img:out-of-range{
      scale: 1;
    }
    .productHeader {
      width: 100%;
      max-width: 1100px;
      margin: 0 auto;
      background: url("/images/coffee/bean/bg-finder-top.png") -230px 0;
    }
    .productHeader .container-name{
      /*margin-top: 120px;*/
      padding-bottom: 20px;
      width: 100%;
      height: 98px;
      position: relative;
    }
    .productHeader .container-name h2{
      font-size: 30px;
      font-weight: bold;
      padding-top: 30px;
    }
    .productHeader .container-name p {
      font-size: 16px;
      color: #666;
      padding-top: 20px;
    }
    .productHeader .nav .nav-ul{
      float: right;
      position: absolute;
      right: 0;
      top: 60px;
    }
    .productHeader .nav .nav-ul li{
      display: inline-block;
      height: 24px;
      line-height: 24px;
      font-size: 12px;
      color: #666666;
      vertical-align: middle;
    }
    .productHeader .nav .nav-ul li img {
      padding-top: 4px;
    }
    .productHeader .nav .nav-ul li > img{
      padding-top: 7px;
    }
    /* section middle */
    .middle{
      background: #fff;
    }
    .mid_inner{
      width: 100%;
      max-width: 1100px;
      margin: 0 auto;
      position: relative;
      padding: 50px 0;
    }
    .mid_inner .pic{
      float: left;
      width: 100%;
      max-width: 40%;
      overflow: hidden;
    }
    .mid_inner .pic a{
      width: inherit;
    }
    .mid_inner .pic a img{
      height: inherit;
      width: inherit;
    }
    .mid_inner .detail{
      float: left;
      width: 100%;
      max-width: 55%;
      margin-left: 5%;
    }
    .mid_inner .detail h2{
      width: 100%;
      font-size: 24px;
      font-weight: bold;
      color: #222222;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 2px solid black;
    }
    .mid_inner .detail p{
      width: 100%;
      font-size: 14px;
      font-weight: bold;
      color: #222222;
      margin-bottom: 40px;
      word-wrap: break-word;
    }
    .mid_inner .detail p:last-child{
      font-size: 14px;
      color: #666666;
    }
    .bottomWrap{
      background: url("/images/coffee/bean/bg-finder-top.png") -140px -30px;
    }
    .bot_inner{
      width: 100%;
      max-width: 1100px;
      margin: 0 auto;
      position: relative;
      padding: 50px 0;
    }
    .bot_inner ul{
      width: 100%;
    }
    .bot_inner ul li {
      float: left;
      margin-left: 2%;
      margin-top: 5px;
      width: 100%;
      max-width: 23%;
    }

    .bot_inner ul li div{
      width: 100%;
      max-width: 270px;
      overflow: hidden;
    }
    .bot_inner ul li div img{
      width: inherit;
      height: inherit;
    }
    .bot_inner ul li p {
      font-size: 14px;
      color: #444;
      text-align: center;
      padding: 15px 0;
    }
  </style>

</head>
<body>
<div class="wrap">
  <%@include file="../../include/header.jsp"%>

  <main class="productWrap">
    <section class="productHeader">
      <div class="container-name">
        <h2>나와 어울리는 커피</h2>
        <p>당신과 잘 어울릴 것 같은 스타벅스의 커피 입니다.</p>
        <nav class="nav">
          <ul class="nav-ul">
            <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/bean/list" class="en">COFFEE</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/bean/list">커피</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="javascript:void(0)">나와 어울리는 커피</a></li>
          </ul>
        </nav>
      </div>
    </section>
    <section class="middle">
      <div class="middleWrap">
        <div class="mid_inner clear-fix">
          <div class="pic">
            <a>
              <img src="">
            </a>
          </div>
          <div class="detail">
            <h2></h2>
            <p></p>
            <p></p>
          </div>
        </div>
      </div>
    </section>
    <section class="bottom">
      <div class="bottomWrap">
        <div class="bot_inner">
          <ul id="list" class="clear-fix list">
            <c:forEach items="${coffees}" var="c">
              <li>
                <a>
                  <div data-id="${c.id}">
                    <img src="${c.image}">
                  </div>
                  <p class="nameKr">${c.nameKr}</p>
                  <p class="descriptionDetail" style="display: none">${c.descriptionDetail}</p>
                  <p class="descriptionSummary" style="display: none">${c.descriptionSummary}</p>
                </a>
              </li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </section>
  </main>
  <%@include file="../../include/footer.jsp"%>
</div>

<script>
  function clickEvent() {
    document.getElementById('list').addEventListener('click', e => {
      if (!e.target.matches('#list li img')) return;
      console.log("e.target: ", e.target);
      selectView(e.target);
    })
  }
function selectView(e){
  const $inner = document.querySelector('.mid-inner');
  let id=0, src=0, nameKr=0, descd=0, descs=0;
  id = e.parentElement.dataset.id;
  src = e.getAttribute('src');
  nameKr = e.parentElement.nextElementSibling.textContent;
  descd = e.parentElement.nextElementSibling.nextElementSibling.textContent;
  descs = e.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.textContent;
  console.log(id, src, nameKr, descd, descs);

  const $pic = document.querySelector('.pic');
  $pic.firstElementChild.setAttribute('href','/coffee/bean/coffeeBeanDetail?id='+id);
  $pic.firstElementChild.firstElementChild.setAttribute('src', src);

  const $detail = [...document.querySelector('.detail').children];
  $detail[0].textContent = nameKr;
  $detail[1].textContent = descd;
  $detail[2].textContent = descs;
}

  (function (){
    clickEvent();
    const $defaultList = document.querySelector('.list li a div img');
    if($defaultList){
      selectView($defaultList);
    }else{
      const $middle = document.querySelector('.middleWrap');
      const $p = document.createElement('p');
      $p.textContent = "당신과 어울리는 커피가 아직 준비 되지 않았습니다.";
      $middle.replaceChild($p, $middle.firstElementChild);
    }
  })();
</script>
</body>
</html>