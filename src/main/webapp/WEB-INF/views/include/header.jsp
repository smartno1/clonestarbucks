<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
        <title>1주차 과제</title>
         <link href="/images/logo.png" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="/css/header.css">
        <link rel="stylesheet" type="text/css" href="/css/footer.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="/js/include.js" defer></script>
    </head>
    <body>
        <header>
            <div class="center">
                <div class="header-content">
                    <div class="header-left">
                        <a href="index"><img class="logo" src="/images/logo.png"></a>
                    </div>
                    <div class="header-right">
                        <div class="header-right-upper">
                        	<c:set var="name" value="${loginInfo.name}"/>
                        	<c:choose>
                        		<c:when test="${empty name}">
                        			<a href="loginForm" class="right-upper-text">Sign in</a>	
                        		</c:when>
                        		<c:otherwise>
                        			<a href="logout" class="right-upper-text">Sign out</a>	
								</c:otherwise>
							</c:choose>
                            <a href="#" class="right-upper-text">My Starbuks</a>
                            <a href="#" class="right-upper-text">Customer Service & Ideas</a>
                            <a href="#" class="right-upper-text">Find a Store</a>
                            <span class="search-wrapper">
                                <input class="search" placeholder="통합검색"/>
                                <span class="material-symbols-outlined search-icon">search</span>
                            </span>
                            </div>
                        <div class="header-right-bottom">
                            <span class="menu" id="menu-1">COFFEE</span>
                            <span class="menu" id="menu-2">MENU</span>
                            <span class="menu" id="menu-3">STORE</span>
                            <span class="menu" id="menu-4">RESPONSIBILITY</span>
                            <span class="menu" id="menu-5">STARBUCKS&nbsp;REWARDS</span>
                            <span class="menu" id="menu-6">WHAT'S&nbsp;NEW</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-1-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#">커피</a></h2>
                                    <li><a href="index">스타벅스 원두</a></li>
                                    <li><a href="#">스타벅스 비아</a></li>
                                    <li><a href="#">스타벅스앳홈 by 캡슐</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">나와 어울리는 커피</a></h2>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">스타벅스 리저브™</a></h2>
                                    <li><a href="#">RESERVE MAGAZINE</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">에스프레소 음료</a></h2>
                                    <li><a href="#">에스프레소 마키아또</a></li>
                                    <li><a href="#">아메리카노</a></li>
                                    <li><a href="#">마키아또</a></li>
                                    <li><a href="#">카푸치노</a></li>
                                    <li><a href="#">라떼</a></li>
                                    <li><a href="#">모카</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">최상의 커피를 즐기는 법</a></h2>
                                    <li><a href="#">커피 프레스</a></li>
                                    <li><a href="#">푸어 오버</a></li>
                                    <li><a href="#">아이스 푸어 오버</a></li>
                                    <li><a href="#">커피 메이커</a></li>
                                    <li><a href="#">리저브를 매장에서 다양하게 즐기는 법</a></li>
                                    <br>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">커피 이야기</a></h2>
                                    <li><a href="#">농장에서 우리의 손으로</a></li>
                                    <li><a href="#">최상의 아라비카 원두</a></li>
                                    <li><a href="#">스타벅스 로스트 스펙트럼</a></li>
                                    <li><a href="#">스타벅스 디카페인</a></li>
                                    <li><a href="#">클로버® 커피 추출 시스템</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                        <ul>
                                            <li><a href="#">나와 어울리는 커피 찾기</a></li>
                                            <li>스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</li>
                                        </ul>
                                    </li>
                                    <br>
                                    <li>
                                        <ul>
                                            <li><a href="#">최상의 커피를 즐기는 법</a></li>
                                            <li>여러가지 방법을 통해 다양한 풍미의 커피를 즐겨보세요.</li>
                                        </ul>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-2-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#">음료</a></h2>
                                    <li><a href="#">콜드 브루</a></li>
                                    <li><a href="#">에스프레소</a></li>
                                    <li><a href="#">프라푸치노</a></li>
                                    <li><a href="#">블렌디드</a></li>
                                    <li><a href="#">스타벅스 리프레셔</a></li>
                                    <li><a href="#">스타벅스 피지오티(티바나)</a></li>
                                    <li><a href="#">기타 제조 음료</a></li>
                                    <li><a href="#">스타벅스 주스(병음료)</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">푸드</a></h2>
                                    <li><a href="#">브레드</a></li>
                                    <li><a href="#">케이크</a></li>
                                    <li><a href="#">샌드위치 & 샐러드</a></li>
                                    <li><a href="#">따뜻한 푸드</a></li>
                                    <li><a href="#">과일 & 요거트</a></li>
                                    <li><a href="#">스낵 & 미니 디저트</a></li>
                                    <li><a href="#">아이스크림</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">상품</a></h2>
                                    <li><a href="#">머그</a></li>
                                    <li><a href="#">글라스</a></li>
                                    <li><a href="#">플라스틱 텀블러</a></li>
                                    <li><a href="#">스테인리스 텀블러</a></li>
                                    <li><a href="#">보온병</a></li>
                                    <li><a href="#">액세서리</a></li>
                                    <li><a href="#">선물세트</a></li>
                                    <li><a href="#">커피 용품</a></li>
                                    <li><a href="#">패키지 티(티바나)</a> </li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">카드</a></h2>
                                    <li><a href="#">실물카드</a></li>
                                    <li><a href="#">e-Gift 카드</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">메뉴 이야기</a></h2>
                                    <li><a href="#">나이트로 콜드브루</a></li>
                                    <li><a href="#">콜드 브루</a></li>
                                    <li><a href="#">스타벅스 티바나</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                <ul>
                                    <li><a href="#">나이트로 콜드 브루</a><img src="/images/icon_gnb_new.png"></img></li>
                                    <li>나이트로 커피 정통의 물결치듯 흘러내리는 캐스케이딩과 부드러운 크림을 경험하세요.</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-3-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#">매장 찾기</a></h2>
                                    <li><a href="#">퀵 검색</a></li>
                                    <li><a href="#">지역 검색</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">드라이브 스루 매장</a></h2>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">스타벅스 리저브™ 매장</a></h2>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">커뮤니티 스토어 매장</a></h2>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">매장 이야기</a></h2>
                                    <li><a href="#">티바나 바 매장</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                <ul>
                                    <li><a href="#">매장찾기</a></li>
                                    <li>보다 빠르게 매장을 찾아보세요.</li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-4-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#"> 사회공헌 캠페인 소개</a></h2>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">지역 사회 참여 활동 </a></h2>
                                    <li><a href="#">희망배달 캠페인 </a></li>
                                    <li><a href="#">재능기부 카페 소식</a></li>
                                    <li><a href="#">커뮤니티 스토어 </a></li>
                                    <li><a href="#">청년 지원 프로그램 </a></li>
                                    <li><a href="#">우리 농산물 사랑 캠페인 </a></li>
                                    <li><a href="#"> 우리 문화 지키기</a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <ul>
                                    <h2><a href="#"> 환경보호 활동</a></h2>
                                    <li><a href="#"> 친환경 활동</a></li>
                                    <li><a href="#">일회용 컵 없는 매장 </a></li>
                                    <li><a href="#"> 커피 원두 재활용</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">윤리 구매 </a></h2>
                                    <li><a href="#"> 윤리적 원두 구매</a></li>
                                    <li><a href="#"> 공정무역 인증</a></li>
                                    <li><a href="#"> 커피 농가 지원 활동</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">글로벌 사회 공헌 </a></h2>
                                    <li><a href="#"> 윤리경영 보고서</a></li>
                                    <li><a href="#">스타벅스 재단지 </a></li>
                                    <li><a href="#"> 구촌 봉사의 달</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                <ul>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-5-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#">스타벅스 리워드</a></h2>
                                    <li><a href="#">스타벅스 리워드 소개</a></li>
                                    <li><a href="#">등급 및 혜택</a></li>
                                    <li><a href="#">스타벅스 별</a></li>
                                    <li><a href="#">자주 하는 질문</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">스타벅스 카드</a></h2>
                                    <li><a href="#">스타벅스 카드 소개</a></li>
                                    <li><a href="#">스타벅스 카드 갤러리</a></li>
                                    <li><a href="#">등록 및 조회</a></li>
                                    <li><a href="#">청년 지원 프로그램</a></li>
                                    <li><a href="#">충전 및 이용안내</a></li>
                                    <li><a href="#">분실신고/환불신청</a></li>
                                    <li><a href="#">자주 하는 질문</a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <ul>
                                    <h2><a href="#">스타벅스 e-Gift Card</a></h2>
                                    <li><a href="#">스타벅스 e-Gift Card 소개</a></li>
                                    <li><a href="#">이용안내</a></li>
                                    <li><a href="#">선물하기</a></li>
                                    <li><a href="#">자주 하는 질문</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                <ul>
                                    <li><a href="#">스타벅스 카드 등록하기</a></li>
                                    <li>카드 등록 후 리워드 서비스를 누리고 사용내역도 조회해보세요.</li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="menu-drop-wrapper" id="menu-6-drop">
                <div class="menu-drop">
                    <div class="drop-top">
                        <ul class="sub-menu">
                            <li>
                                <ul>
                                    <h2><a href="#">이벤트</a></h2>
                                    <li><a href="#">전체</a></li>
                                    <li><a href="#">스타벅스 카드</a></li>
                                    <li><a href="#">스타벅스 리워드</a></li>
                                    <li><a href="#">온라인e-프리퀀시 증정품</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">뉴스</a></h2>
                                    <li><a href="#">전체상품 출시</a></li>
                                    <li><a href="#">스타벅스와 문화</a></li>
                                    <li><a href="#">스타벅스 사회공헌</a></li>
                                    <li><a href="#">스타벅스 카드출시</a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <ul>
                                    <h2><a href="#">매장별 이벤트</a></h2>
                                    <li><a href="#">일반 매장</a></li>
                                    <li><a href="#">신규 매장</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">e-프리퀀시</a></h2>
                                    <li><a href="#">이용안내</a></li>
                                    <li><a href="#">이용현황</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">공지사항</a></h2>
                                    <br><br><br><br><br>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <h2><a href="#">월페이퍼</a></h2>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="drop-bottom">
                        <ul>
                            <li>
                                <ul>
                                    <li><a href="#">매장별 이벤트</a></li>
                                    <li>스타벅스의 매장 이벤트 정보를 확인 하실 수 있습니다.</li>
                                </ul>
                                <br>
                                <ul>
                                    <li><a href="#">월페이퍼</a></li>
                                    <li> 매월 업데이트되는 월페이퍼(PC/Mobile)로 스타벅스를 더욱 가깝게 즐겨보세요!</li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </body>

</html>
