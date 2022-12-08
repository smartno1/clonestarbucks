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
                <li>
                    <a href="/signin">Sign In</a>
                </li>
                <li>
                    <a href="javascript:void(0)">My Starbucks</a>
                </li>
                <li>
                    <a href="javascript:void(0)">Find a Store</a>
                </li>
            </ul>
            <div class="search">
                <input type="text" />
                <span class="material-symbols-outlined">search</span>
            </div>
        </div>

        <ul class="main-menu">
            <li class="item menu-1">
                <div class="item__name">COFFEE</div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4>커피</h4>
                                <ul>
                                    <a href="/coffee/bean"><li>스타벅스 원두</li></a>
                                    <li>나와 어울리는 커피</li>
                                </ul>
                            </li>
                            <li>
                                <h4>에스프레소 음료</h4>
                                <ul>
                                    <li>아메리카노</li>
                                    <li>카푸치노</li>
                                    <li>모카</li>
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
                <div class="item__name">MENU</div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4>음료</h4>
                                <ul>
                                    <li>아메리카노</li>
                                    <li>카푸치노</li>
                                    <li>모카</li>
                                </ul>
                            </li>
                            <li>
                                <h4>푸드</h4>
                                <ul>
                                    <li>케익</li>
                                    <li>샌드위치 & 샐러드</li>
                                </ul>
                            </li>
                            <li>
                                <h4>상품</h4>
                                <ul>
                                    <li>머그</li>
                                    <li>보온병</li>
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
                <div class="item__name">STORE</div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4>매장 찾기</h4>
                            </li>
                            <li>
                                <h4>드라이브 스루</h4>
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
                <div class="item__name">WHAT'S NEW</div>
                <div class="item__contents">
                    <div class="contents__menu">
                        <ul class="inner">
                            <li>
                                <h4>이벤트</h4>

                            </li>
                            <li>
                                <h4>뉴스</h4>

                            </li>
                            <li>
                                <h4>공지사항</h4>

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
    <!--BADGES-->
    <div class="badges" style="position: absolute; top: 132px; right: 12px">
        <div class="badge">
            <img src="/images/badge1.jpg" alt="Badge" />
        </div>
        <div class="badge" style="white-space:normal; display: block;">
            <img src="/images/badge2.jpg" alt="Badge"/>
        </div>
    </div>
</header>


