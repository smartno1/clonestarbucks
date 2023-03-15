    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--HEADER-->
<header>
    <div class="inner">

        <a href="/" class="logo">
            <img src="/images/starbucks_logo.png" alt="STARBUCKS" />
        </a>

        <div class="sub-menu">
            <ul class="menu-ul">
                <c:if test="${loginUser.auth == 'ADMIN'}">
                    <li>
                        <a href="/admin/member">Admin Menu</a>
                    </li>
                </c:if>
                <li>
                <c:if test="${loginUser == null}">
                    <li>
                        <a href="javascript:void(0)" id="sign-in">Sign In</a>
                    </li>
                </c:if>
                <c:if test="${loginUser != null}">
                    <li>
                        <a href="javascript:void(0)" id="sign-out">Sign Out</a>
                    </li>
                </c:if>
                <li>
                    <a href="javascript:void(0)" id="customerService">Customer Service & Ideas</a>
                </li>
                <li>
                    <c:if test="${loginUser == null}">
                        <a href="javascript:void(0)" id="signIn">My Starbucks</a>
                    </c:if>
                    <c:if test="${loginUser != null}">
                        <a href="javascript:void(0)" id="my">My Starbucks</a>
                    </c:if>
                </li>
                <li>
                    <a href="/kakaoMap/findStore">Find a Store</a>
                </li>
            </ul>
            <div class="search-all">
                <form action="/search-all" method="GET">
                    <input type="hidden" name="type" value="search-all">
                    <input type="text" name="keyword"/>
                    <span class="material-symbols-outlined search-icon">search</span>
                </form>
            </div>
        </div>

        <ul class="main-menu">
            <li class="item menu-1">
                <div class="item__name"><a href="javascript:void(0)">COFFEE</a></div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4><a href="/coffee/bean/list">커피</a></h4>
                                <ul>
                                    <li><a href="/coffee/bean/list?kind=bean">스타벅스 원두</a></li>
                                    <li><a href="/coffee/bean/list?kind=via">스타벅스 비아</a></li>
                                    <li><a href="/coffee/bean/list?kind=capsule">스타벅스앳홈 by 캡슐 </a></li>
                                    <li><a href="/coffee/bean/productFinder">나와 어울리는 커피</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4><a href="/coffee/espresso/list">에스프레소 음료</a></h4>
                                <ul>
                                    <li><a href="/coffee/espresso/americano">아메리카노</a></li>
                                    <li><a href="/coffee/espresso/cappuccino">카푸치노</a></li>
                                    <li><a href="/coffee/espresso/mocha">모카</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <div class="contents__texture">
                        <div class="inner">
                            <h4>나와 어울리는 커피 찾기</h4>
                            <p>스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</p>
                            <h4>최상의 커피를 즐기는 법</h4>
                            <p>여러가지 방법을 통해 다양한 풍미의 커피를 즐겨보세요.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item menu-2">
                <div class="item__name"><a href="javascript:void(0)">MENU</a></div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4><a href="/menu/list">음료</a></h4>
                                <ul>
                                    <li><a href="/menu/list?type=espressoKind&keyword=espresso">에스프레소</a></li>
                                    <li><a href="/menu/list?type=espressoKind&keyword=coldbrew">콜드브루</a></li>
                                    <li><a href="/menu/list?type=espressoKind&keyword=brewedcoffee">브루드커피</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4><a href="/menu/food">푸드</a></h4>
                                <ul>
                                    <li><a href="/menu/food?type=cake">케익</a></li>
                                    <li><a href="/menu/food?type=sandwich">샌드위치 & 샐러드</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4><a href="/menu/sangpum">상품</a></h4>
                                <ul>
                                    <li><a href="/menu/sangpum?type=mugcup">머그컵</a></li>
                                    <li><a href="/menu/sangpum?type=thermos">보온병</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="contents__texture">
                        <div class="inner">
                            <h4>스타벅스 티바나</h4>
                            <p>다양한 찻잎과 향신료 등 개성있는 재료로 새로운 맛과 향의 티를 선보입니다.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item menu-3">
                <div class="item__name"><a href="/kakaoMap/findStore">STORE</a></div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4><a href="/kakaoMap/findStore">매장 찾기</a></h4>
                            </li>
                            <li>
                                <h4><a href="/kakaoMap/findDrive">드라이브 스루</a></h4>
                            </li>
                        </ul>
                    </div>
                    <div class="contents__texture">
                        <div class="inner">
                            <h4>매장 찾기</h4>
                            <p>보다 빠르게 매장을 찾아보세요.</p>
                            <h4>청담스타</h4>
                            <p>스타벅스 1,000호점인 청담스타점을 만나보세요.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item menu-4">
                <div class="item__name"><a href="javascript:void(0)">WHAT'S NEW</a></div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4><a href="/whats_new/event/list?kind=ALL">이벤트</a></h4>
                                <ul>
                                    <li><a href="/whats_new/event/list?kind=ALL">전체</a></li>
                                    <li><a href="/whats_new/event/list?kind=CARD">스타벅스 카드</a></li>
                                    <li><a href="/whats_new/event/list?kind=REWARD">스타벅스 리워드</a></li>
                                    <li><a href="/whats_new/event/list?kind=ONLINE">온라인</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4><a href="/whats_new/news/list?kind=ALL">뉴스</a></h4>
                                <ul>
                                    <li><a href="/whats_new/news/list?kind=ALL">전체</a></li>
                                    <li><a href="/whats_new/news/list?kind=PRODUCT">상품출시</a></li>
                                    <li><a href="/whats_new/news/list?kind=CULTURE">스타벅스와 문화</a></li>
                                    <li><a href="/whats_new/news/list?kind=CONTRIBUTE">스타벅스 사회공헌</a></li>
                                    <li><a href="/whats_new/news/list?kind=CARD">스타벅스 카드출시</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4><a href="/whats_new/notice/list">공지사항</a></h4>

                            </li>
                        </ul>
                    </div>
                    <div class="contents__texture">
                        <div class="inner">
                            <h4>매장별 이벤트</h4>
                            <p>스타벅스의 매장 이벤트 정보를 확인 하실 수 있습니다.</p>
                            <h4>소셜 스타벅스</h4>
                            <p>다양한 스타벅스 SNS 채널을 통해 스타벅스를 만나보세요!</p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</header>


