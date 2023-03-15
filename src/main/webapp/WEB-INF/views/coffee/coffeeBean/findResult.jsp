<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <%@include file="../../include/static-head.jsp"%>
  <title>커피 | Starbucks Korea</title>
  <link rel="stylesheet" type="text/css" href="/css/coffee/bean/findResult.css">

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