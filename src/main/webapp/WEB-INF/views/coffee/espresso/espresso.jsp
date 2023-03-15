<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <%@include file="../../include/static-head.jsp"%>
  <title>에스프레소 음료 | Starbucks Korea</title>
  <link rel="stylesheet" type="text/css" href="/css/coffee/espresso/espresso.css">
</head>
<body>
<div class="wrapper">
  <%@include file="../../include/header.jsp"%>
  <main class="wrap">
    <section class="Header">
      <div class="container-name">
        <h2>에스프레소 음료</h2>
        <nav class="nav">
          <ul class="nav-ul">
            <li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/espresso/list" class="en">COFFEE</a></li>
            <li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
            <li><a href="/coffee/espresso/list">에스프레소 음료</a></li>
          </ul>
        </nav>
      </div>
    </section>
    <section class="middle">
      <div class="pic">
        <img src="/images/coffee/espresso/espresso_classlcs_img01.jpg" alt="">
      </div>
      <div class="info">
        <p class="p1">“오늘날, 스타벅스에 있어 꼼꼼하고 세심한 노력은 다양한 음료 메뉴만큼이나 중요합니다. ”</p>
        <p class="p2">1983년 하워드 슐츠는 이탈리아 밀라노의 한 커피숍에서 카페라떼를 주문했습니다. 그는 바리스타의 정성 어린 손길로 제조된 에스프레소를 보면서,
          자신이 주문한 음료를 만들기 위해서는 바리스타의 커피를 향한 열정과 진심이 가장 중요하다는 것을 느꼈습니다.
          또한, 커피를 마시며 느끼는 감동과 여운은 커피 한 잔을 완성하기 위한 공동체의 세심한 노력이 담겨 있다는 것도 깨닫게 되었습니다.</p>
        <p class="p3">오늘날 스타벅스에게 커피를 향한 세심한 노력은 다양한 음료 메뉴만큼 중요합니다.
          강렬한 에스프레소 풍미와 도피오 한 잔, 완벽하게 만들어진 크림 블렌드의 라떼 한 잔처럼 모든 커피 한 잔에는 우리의 열정이 담겨있습니다.</p>
      </div>
    </section>
    <section class="bottom">
      <div class="container">
        <ul class="list clear-fix">
          <li class="americano">
            <a href="/coffee/espresso/detail?type=americano">
            <img src="/images/coffee/espresso/espresso_list_americano.jpg" alt="">
            </a>
            <p>진한 에스프레소에 뜨거운 물을 부어 만든 아메리카노는
              <br>에스프레소의 진한 풍미와 원두의 다크한 맛을 느낄 수
              <br>있습니다.
            </p>
          </li>
          <li class="cappuccino">
            <a  href="/coffee/espresso/detail?type=cappuccino">
              <img src="/images/coffee/espresso/espresso_list_cappuccino.jpg" alt="">
            </a>
            <p>두텁게 쌓은 우유거품 아래에 다크하고 진한 에스프레소가
              <br>숨어진 카푸치노는 바리스타의 숙련된 솜씨를
              <br>느낄 수 있는 음료입니다.
            </p>
          </li>
          <li class="mocha">
            <a href="/coffee/espresso/detail?type=mocha">
            <img src="/images/coffee/espresso/espresso_list_mocha.jpg" alt="">
            </a>
            <p>
              모카는 달콤 쌉싸름한 초콜릿이 진한 에스프레소와
              <br>스팀 밀크에 혼합되어 달콤함이 부각되는 음료입니다.
            </p>
          </li>
        </ul>
      </div>
    </section>
  </main>
  <%@include file="../../include/footer.jsp"%>
</div>
</body>
</html>
