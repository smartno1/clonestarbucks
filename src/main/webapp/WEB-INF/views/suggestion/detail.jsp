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
          <li class="msRnb_btn"><a href="javascript:void(0)">고객 경험 설문조사</a></li>
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
        </section>
        <!-- (고객의 소리) 고객의 소리 문의 하기 end -->

        <!-- (고객의 소리) 상세보기 -->
        <section class="my_suggestion_detail">
          <div class="title">
            <div class="title_box">
              <p>제목 : ${s.title}</p>
            </div>
            <div class="day_box">
              <p>작성일 : ${s.regDate}</p>
            </div>
          </div>
          <div class="context">
            <div class="text_box">
              <p class="cs_textall">문의내용</p>
              <p class="cs_texttt">${s.context}</p>
            </div>
          </div>
          <div class="reply">
            <c:if test="${s.replyDone}"><p class="re_textdata">
              작성자 : ${s.replyer} 작성일 : ${s.replyDate}
              답변 : ${s.reply}
            </p></c:if>

            <p class="no_textdata">
            <c:if test="${!s.replyDone}">
              답변 : 답변 없음
            </c:if>
            </p>
          </div>
          <div class="button_box">
            <ul>
              <li><button>저장</button></li>
              <li><button>삭제</button></li>
              <li><button>취소</button></li>
            </ul>
          </div>
        </section>

      </div>

    </div>

  </div>

</div>
</div>


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