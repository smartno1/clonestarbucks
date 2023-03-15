<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../../include/static-head.jsp"%>
	<title>커피 | Starbucks Korea</title>
	<link rel="stylesheet" type="text/css" href="/css/coffeeBeanDetail.css">

</head>
<body>
<div class="wrap">
	<%@include file="../../include/header.jsp"%>
	<main class="container-wrapper">
		<div class="container">
			<section class="detailHeader">
				<div class="container-name">
					<h2>스타벅스 원두</h2>
					<p></p>
					<nav class="nav">
						<ul class="nav-ul">
							<li><a href="/"><img src="/images/icon/icon_home.png" alt="홈으로"></a></li>
							<li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
							<li><a href="/coffee/bean/list" class="en">COFFEE</a></li>
							<li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
							<li><a href="/coffee/bean/list">커피</a></li>
							<li><img src="/images/icon/icon_arrow.png" alt="하위메뉴"></li>
							<li><a href="/coffee/bean/productFinder">${coffee.nameKr}</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div class="context-top">
				<div class="coffee-img">
					<img src="${coffee.image}"/>
				</div>
				<div class="coffee-description">
					<div class="name">
						<div class="name-left">
							<h2>${coffee.nameKr}</h2>
							<p>${coffee.nameEn}</p>
						</div>
						<c:if test="${loginUser.auth == 'ADMIN'}">
						<div class="name-right">
							<span class="material-symbols-outlined" id="edit" data-id="${coffee.id}">edit</span>
							<span class="material-symbols-outlined" id ="delete" data-id="${coffee.id}">delete</span>
						</div>
						</c:if>
						<div id="addMyFavorite" data-id="${coffee.id}">
							<a>나만의 상품으로 등록</a>
						</div>

					</div>
					<div class="description-sum">
						<p>${coffee.descriptionSummary}</p>
					</div>
					<div class="type-wrapper">
							<c:choose>
								<c:when test="${coffee.type eq 'darkRoast'}">
									<div class="type">
										<img src="/images/icon/${coffee.type}.png" alt="${coffee.nameKr}">
										<strong>다크 로스트</strong>
										<span>강렬하고 강인한 맛 Strong & Powerful</span>
									</div>
								</c:when>
								<c:when test="${coffee.type eq 'blondRoast'}">
									<div class="type">
										<img src="/images/icon/${coffee.type}.png" alt="${coffee.nameKr}">
										<strong>블론드 로스트</strong>
										<span>은은하고 부드러운 맛 Subtle & Mellow</span>
									</div>
								</c:when>
								<c:when test="${coffee.type eq 'mediumRoast'}">
									<div class="type">
										<img src="/images/icon/${coffee.type}.png" alt="${coffee.nameKr}">
										<strong>미디엄 로스트</strong>
										<span>균형잡힌 부드러움 Balance & Mellow</span>
									</div>
								</c:when>
							</c:choose>
					</div>
					<div class="weight">
						<p>${coffee.weight}g</p>
					</div>
					<div class="more">
						<img src="/images/icon/more_left.jpg"/>
						<img src="/images/icon/more_right.jpg"/>
					</div>
					
					<div class="share">
						<%-- <div class="fb-share-button" 
			                data-href="https://ksh-starbucks-clone.herokuapp.com/coffee_bean_detail.jsp?seq=${coffee.id}" 
			                data-layout="button_count"
			                data-size="small">
                		</div> --%>
                		<img class="facebook" src="/images/icon/facebook.png" data-id="${coffee.id}"/>
					</div>
				</div>
			</div>
			<div class="context-description-bottom">
				<div class="description-bottom-left">
					<div class="description-bottom-left-top description_detail">
						${coffee.descriptionDetail}
					</div>
					<div class="description-bottom-left-bottom">
						<div class="design-story">
							<img src="/images/productInvestigate_img01.jpg"/>
							<h4>디자인 스토리</h4>
							<p>${coffee.designStory}</p>
						</div>
						<div class="tasting-note">
							<img src="/images/productInvestigate_img02.jpg"/>
							<h4>커피 테이스팅 노트</h4>
							<p>${coffee.coffeeTastingNote}</p>
						</div>
					</div>
				</div>
				<div class="description-bottom-right">
					<div class="right-block tasting_notes">
						<h4>Tasting Notes</h4>
						<p>${coffee.tastingNotes}</p>
					</div>
					<div class="right-block enjoy_with">
						<h4>Enjoy With</h4>
						<p>${coffee.enjoyWith}</p>
					</div>
					<div class="right-block processing_method">
						<h4>Processing Method</h4>
						<p>${coffee.processingMethod}</p>
					</div>
				</div>
			</div>
			<div class="context-bottom">
				<div class="context-bottom-common">
					<div class="promotion">
						<div>
							<h4>프로모션 새소식</h4>	
							<ul>
								<li>해당 상품과 관련된 진행 중인 프로모션이 없습니다.</li>
							</ul>
						</div>
						<span class="material-symbols-outlined promotion-add">add_circle</span>
					</div>
					<div class="axis-indicator"></div>
					<div class="order">
						<img src="/images/sirenOrder_img_171109.png"/>
						<div class="order-right">
							<h4>사이렌 오더란?</h4>	
							<p>매장에서 줄을 서지 않고 주문하는 쉽고 간편한 O2O (Online to Offline) 서비스로서 앱을 통해 스타벅스 음료, 푸드 및 원두의 결제 및 주문을 완료하면 매장에서 즉시 메뉴를 받을 수 있는 스타벅스만의 신개념 서비스 입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../../include/footer.jsp"></jsp:include>
</div>
 	<script src="/js/crud.js"></script>
  	<script src="/js/share.js"></script>
  	<script src="/js/coffeeDetail.js"></script>
</body>
</html>	