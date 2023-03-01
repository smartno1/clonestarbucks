<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-01
  Time: 오후 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   
    <%@include file="./include/static-head.jsp"%>

    <link rel="stylesheet" href="/css/main.css" />
    <script defer src="/js/youtube.js"></script>
    <script defer src="/js/main.js"></script>
</head>
<body>
<div class="wrapper">
    <%@include file="include/header.jsp"%>

<!--BADGES-->
<div class="badges">
    <div class="badge">
        <img src="/images/badge1.jpg" alt="Badge" />
    </div>
    <div class="badge">
        <img src="/images/badge2.jpg" alt="Badge"/>
    </div>
</div>

<!--VISUAL-->
<section class="visual">
    <div class="inner">

        <div class="title fade-in">
            <img src="/images/visual_title.png" alt="STARBUCKS DELIGHTFUL START TO THE YEARS" />
            <a href="javascript:void(0)" class="btn btn--brown">자세히 보기</a>
        </div>
        <div class="fade-in">
            <img src="/images/visual_cup1.png" alt="new OATMEAL LATTE" class="cup1 image" />
            <img src="/images/visual_cup1_text.png" alt="오트밀 라떼" class="cup1 text" />
        </div>
        <div class="fade-in">
            <img src="/images/visual_cup2.png" alt="new STARBUCKS CARAMEL CRUMBLE MOCHA" class="cup2 image" />
            <img src="/images/visual_cup2_text.png" alt="스타벅스 카라멜 크럼블 모카" class="cup2 text" />
        </div>
        <div class="fade-in">
            <img src="/images/visual_spoon.png" alt="Spoon" class="spoon" />
        </div>

    </div>
</section>


<!--NOTICE-->
<section class="notice">

    <!--NOTICE LINE-->
    <div class="notice-line">
        <div class="bg-left"></div>
        <div class="bg-right"></div>
        <div class="inner">

            <div class="inner__left">
                <h2>공지사항</h2>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <a href="javascript:void(0)">크리스마스 & 연말연시 스타벅스 매장 영업시간 변경 안내</a>
                        </div>
                        <div class="swiper-slide">
                            <a href="javascript:void(0)">[당첨자 발표] 2021 스타벅스 플래너 영수증 이벤트</a>
                        </div>
                        <div class="swiper-slide">
                            <a href="javascript:void(0)">스타벅스커피 코리아 애플리케이션 버전 업데이트 안내</a>
                        </div>
                        <div class="swiper-slide">
                            <a href="javascript:void(0)">[당첨자 발표] 뉴이어 전자영수증 이벤트</a>
                        </div>
                    </div>
                </div>
                <a href="/whats_new/notice/list?kind=ALL" class="notice-line__more">
                    <span class="material-symbols-outlined">add_circle</span>
                </a>
            </div>

            <div class="inner__right">
                <h2>스타벅스 프로모션</h2>
                <div class="toggle-promotion open">
                    <div class="material-symbols-outlined">upload</div>
                </div>
            </div>

        </div>
    </div>

    <!--PROMOTION-->
    <div class="promotion">

        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="/images/promotion_slide1.jpg" alt="2021 뉴이어, 스타벅스와 함께 즐겁고 활기차게 시작하세요!" />
                    <a href="javascript:void(0)" class="btn">자세히 보기</a>
                </div>
                <div class="swiper-slide">
                    <img src="/images/promotion_slide2.jpg" alt="기간 내 스타벅스 카드 e-Gift를 3만원 이상 선물 시, 아메리카노 e-쿠폰을 드립니다." />
                    <a href="javascript:void(0)" class="btn">자세히 보기</a>
                </div>
                <div class="swiper-slide">
                    <img src="/images/promotion_slide3.jpg" alt="뉴이어 푸드와 제조 음료를 세트로 구매 시, 뉴이어 음료 BOGO(1+1) 쿠폰을 드립니다." />
                    <a href="javascript:void(0)" class="btn">자세히 보기</a>
                </div>
                <div class="swiper-slide">
                    <img src="/images/promotion_slide4.jpg" alt="신년 MD 상품 포함 3만원 이상 구매 고객께 아메리카노(톨사이즈) 쿠폰을 드립니다." />
                    <a href="javascript:void(0)" class="btn">자세히 보기</a>
                </div>
                <div class="swiper-slide">
                    <img src="/images/promotion_slide5.jpg" alt="2017 DIGITAL LUCKY DRAW 100% 당첨의 행운을 드립니다!" />
                    <a href="javascript:void(0)" class="btn">자세히 보기</a>
                </div>
            </div>
        </div>

        <div class="swiper-pagination"></div>

        <div class="swiper-prev">
            <span class="material-symbols-outlined">arrow_back</span>
        </div>
        <div class="swiper-next">
            <span class="material-symbols-outlined">arrow_forward</span>
        </div>

    </div>
</section>


<!--REWARDS-->
<section class="rewards">
    <div class="bg-left"></div>
    <div class="bg-right"></div>
    <div class="inner">

        <div class="btn-group">
            <div class="btn btn--reverse sign-up">회원가입</div>
            <div class="btn sign-in">로그인</div>
            <div class="btn gift">e-Gift 선물하기</div>
        </div>

    </div>
</section>


<!--YOUTUBE VIDEO-->
<section class="youtube">
    <div class="youtube__area">
        <div id="player"></div>
    </div>
    <div class="youtube__cover"></div>
    <div class="inner">

        <img src="/images/floating1.png" alt="Icon" class="floating floating1" />
        <img src="/images/floating2.png" alt="Icon" class="floating floating2" />

    </div>
</section>


<!--SEASON PRODUCT-->
<section class="season-product scroll-spy">
    <div class="inner">

        <img src="/images/floating3.png" alt="Icon" class="floating floating3" />
        <img src="/images/season_product_image.png" alt="아이스 커피 블렌드" class="product back-to-position to-right delay-0" />

        <div class="text-group">
            <img src="/images/season_product_text1.png" alt="상쾌하게 여름을 반겨줄 시즌 원두 아이스 커피 블렌드" class="title back-to-position to-left delay-1" />
            <img src="/images/season_product_text2.png" alt="아프리카와 라틴 아메리카 커피의 브렌드로 시트러스함과 은은한 캐러멜 향을 동시에 느낄 수 있으며, 차갑게 즐길 때 풍미가 더욱 깊어지는 원두입니다." class="description back-to-position to-left delay-2" />
            <div class="more back-to-position to-left delay-3">
                <a href="javascript:void(0)" class="btn">자세히 보기</a>
            </div>
        </div>

    </div>
</section>


<!--RESERVE COFFEE-->
<section class="reserve-coffee scroll-spy">
    <div class="inner">

        <img src="/images/reserve_logo.png" alt="" class="reserve-logo back-to-position to-right delay-0" />
        <div class="text-group">
            <img src="/images/reserve_text.png" alt="" class="description back-to-position to-right delay-1" />
            <div class="more back-to-position to-right delay-2">
                <a href="javascript:void(0)" class="btn btn--gold">자세히 보기</a>
            </div>
        </div>
        <img src="/images/reserve_image.png" alt="" class="product back-to-position to-left delay-3" />

    </div>
</section>


<!--PICK YOUR FAVORITE-->
<section class="pick-your-favorite scroll-spy">
    <div class="inner">

        <div class="text-group">
            <img src="/images/favorite_text1.png" alt="PICK YOUR FAVORITE" class="title back-to-position to-right delay-0" />
            <img src="/images/favorite_text2.png" alt="다양한 메뉴를 스타벅스에서 즐겨보세요." class="description back-to-position to-right delay-1" />
            <div class="more back-to-position to-right delay-2">
                <a href="javascript:void(0)" class="btn btn--white">자세히 보기</a>
            </div>
        </div>

    </div>
</section>


<!--RESERVE STORE-->
<section class="reserve-store">
    <div class="inner">

        <div class="medal">
            <div class="front">
                <img src="/images/reserve_store_medal_front.png" alt="R">
            </div>
            <div class="back">
                <img src="/images/reserve_store_medal_back.png" alt="스타벅스 리저브 매장">
                <a href="javascript:void(0)" class="btn">
                    매장안내
                </a>
            </div>
        </div>

    </div>
</section>


<!--FIND THE STORE-->
<section class="find-store scroll-spy">
    <div class="inner">

        <img src="/images/find_store_texture1.png" alt="" class="texture1" />
        <img src="/images/find_store_texture2.png" alt="" class="texture2" />
        <img src="/images/find_store_picture1.jpg" alt="" class="picture picture1 back-to-position to-right delay-0" />
        <img src="/images/find_store_picture2.jpg" alt="" class="picture picture2 back-to-position to-right delay-1" />
        <div class="text-group">
            <img src="/images/find_store_text1.png" alt="스타벅스를 가까이에서 경험해보세요." class="title back-to-position to-left delay-0" />
            <img src="/images/find_store_text2.png" alt="고객님과 가장 가까이 있는 매장을 찾아보세요!" class="description back-to-position to-left delay-1" />
            <div class="more back-to-position to-left delay-2">
                <a href="javascript:void(0)" class="btn">매장찾기</a>
            </div>
        </div>

    </div>
</section>
<%@include file="include/footer.jsp"%>
</div>
<script>

</script>
</body>
</html>
