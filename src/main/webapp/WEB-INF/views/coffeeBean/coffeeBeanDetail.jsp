<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
		<%@include file="../include/static-head.jsp"%>
<%--        <link rel="stylesheet" type="text/css" href="/css/coffeeBeanDetail.css">--%>
	<style>
		.container-wrapper{
			margin-top: 120px;
			display:flex;
			justify-content:center;
		}
		.container{
			width:100%;
			max-width:960px;
			margin-top: 10px;
		}
		.container-name{
			display:flex;
			justify-content:space-between;
			align-items:center;
		}
		.container-name h2{
			font: bold 36px Avenir;
			color: #222222;
			padding-top: 30px;
		}
		.title-home{
			color:grey;
			font-size:12px;
			display:flex;
			align-items:center;
		}
		.title-home .material-symbols-outlined{
			font-size:15px;
		}
		.context-top{
			display:grid;
			grid-template-columns:40% 60%;
			padding-bottom:25px;
			border-bottom:2px solid #d3d3d3;
		}
		.coffee-img{
			display:flex;
			justify-content:center;
			max-height:400px;
			max-width:400px;
			object-fit: scale-down;
		}
		.coffee-img img{
			display:flex;
			justify-content:center;
			max-height:400px;
			max-width:400px;
		}
		.name{
			display:flex;
			border-bottom:2px solid black;
			padding-bottom: 20px;
			margin-bottom: 20px;
		}
		.name-left{
			width:85%;
			display:flex;
			flex-direction:column;
		}
		.name-left h2{
			font-size: 24px;
			font-weight: bold;
		}
		.name-left p{
			font-size: 14px;
			font-weight: normal;
			color: #666;
		}
		.name-right{
			display:flex;
			justify-content:end;
			width:20%;
		}
		.myDrink a{
			display: block;
			width: 138px;
			height: 28px;
			line-height: 28px;
			background: #006633;
			font-size: 12px;
			color: #fff;
			text-align: center;
			border-radius: 3px;
		}
		.description-sum{
			font-size: 14px;
			color: #444;
			line-height: 1.6;
			padding-bottom: 55px;
		}
		.type{
			background: #f4f4f2;
			border-radius: 3px;
			color: #666;
			font-size: 14px;
			height: 52px;
			line-height: 52px;
			margin-bottom: 40px;
			width: 95%;
			padding-left: 5%;
		}
		.type img{
			margin-right: 10px;
			width: 40px;
			height: 40px;
			display: inline;
			vertical-align: middle;
		}
		.type strong{
			color: #222;
			font-size: 16px;
			font-weight: normal;
			height: 16px;
			padding-right: 15px;
			border-right: 1px solid #666;
			margin-right: 15px;
		}
		.weight{
			height: 62px;
			position: relative;
			border-top:1px solid #a9a9a9;
		}
		.weight p{
			color: #666;
			float: right;
			font-size: 16px;
			font-weight: bold;
			padding-left: 10px;
			padding-top: 15px;
		}
		.more{
			display:flex;
			width:100%;
			justify-content:space-between
		}
		.more img{
			width:49%;
			border-radius:5px;
			max-height:450px;
		}
		.icon, .weight{
			display:flex;
			justify-content:end;
		}
		#delete, #edit{
			cursor:pointer;
			padding-left:10px;
		}
		.icon img{
			padding-top:20px;
			width:32px;
		}
		.icon img:hover{
			cursor:pointer;
		}
		.context-description-bottom{
			display:flex;
			width:100%;
			padding-top:25px;
			padding-bottom: 60px;
		}
		.description-bottom-left{
			display:flex;
			flex-direction:column;
			width:65%;
		}
		.description_detail{
			font-size:12px;
			padding: 5px 5px 25px;
		}
		.description-bottom-left-bottom{
			display:flex;
		}
		.design-story img,.tasting-note img{
			width:95%;
		}
		.design-story, .tasting-note{
			width:50%;
			padding:5px;
		}
		.description-bottom-left-bottom h4{
			font-size: 14px;
			color: #444;
			font-weight: bold;
			margin: 15px 0;
		}
		.description-bottom-left-bottom p{
			font-size: 11px;
		}
		.description-bottom-right{
			display:flex;
			flex-direction:column;
			align-items:center;
			width:35%;
			background-color:rgba(244,244,242);
			height:fit-content;
			margin-left:20px;
		}
		.right-block{
			padding: 30px 0 28px 0;
			width:85%;
			border-bottom:1px solid #d3d3d3;
		}
		.right-block h4{
			color: #222;
			font-size: 16px;
			font-weight: bold;
			margin-bottom: 15px;
		}
		.right-block p{
			color: #666;
			font-size: 14px;
			line-height: 22px;
		}
		.context-bottom{
			background-color:rgba(244,244,242);
		}
		.context-bottom-common{
			display:flex;
			border-bottom:1px solid #d3d3d3;
			padding: 30px 20px;
		}
		.promotion{
			width:50%;
			display:flex;
		}
		.promotion div{
			width:90%;
		}
		.promotion div h4{
			font-size: 18px;
			font-weight: bold;
			color: #222;
			margin-bottom: 15px;
		}
		.promotion ul{
			list-style: disc;
			padding-left: 30px;
		}
		.promotion li{
			font-size:13px;
			color: #444;
		}
		.order{
			display:flex;
			width:50%;
			align-items:center;

		}
		.order img{
			height:90%;
			align-self:auto;
			vertical-align: top;
		}
		.order-right h4{
			font-size: 18px;
			font-weight: bold;
			color: #222;
			margin-bottom: 15px;
		}
		.order-right p{
			font-size:13px;
			color: #444;
		}
		.order-right{
			margin-left:20px;
		}
		.axis-indicator{
			width:1px;
			background-color:#d3d3d3;
			height:150px;
			align-self:center;
			margin-right:20px;
		}
		.promotion-add{
			padding-top:20px;
			transform: scale(1.6);
			height:40%;
			color:#808080;
		}
		.promotion-add:hover{
			cursor:pointer;
		}

	</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
          
	<main class="container-wrapper">
		<div class="container">
			<div class="container-name">
				<h2>스타벅스 원두</h2>
				<span class="title-home">
					<span class="material-symbols-outlined">home</span>&nbsp;
					<span> > COFFEE >
						<c:choose>
							<c:when test="${coffee.type eq 'darkRoast'}">
								다크 로스트
							</c:when>
							<c:when test="${coffee.type eq 'blondRoast'}">
								블론드 로스트
							</c:when>
							<c:when test="${coffee.type eq 'mediumRoast'}">
								미디엄 로스트
							</c:when>
							<c:when test="${coffee.type eq 'reserveRoast'}">
								리저브 원두
							</c:when>
						</c:choose>					
					  > ${coffee.nameKr}</span>
				</span>
			</div>
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
						<div class="name-right">
							<span class="material-symbols-outlined" id="edit" data-id="${coffee.id}">edit</span>
							<span class="material-symbols-outlined" id ="delete" data-id="${coffee.id}">delete</span>
						</div>
						<div class="myDrink">
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
					
					<div class="icon">
						<%-- <div class="fb-share-button" 
			                data-href="https://ksh-starbucks-clone.herokuapp.com/coffee_bean_detail.jsp?seq=${coffee.id}" 
			                data-layout="button_count"
			                data-size="small">
                		</div> --%>
                		<img src="/images/icon/facebook.png" data-id="${coffee.id}"/>
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
					<c:if test="${!empty coffee.tastingNote}">
						<div class="right-block tasting_notes">
							<h4>Tasting Notes</h4>
							<p>${coffee.tastingNote}</p>
						</div>
					</c:if>
					<c:if test="${!empty coffee.enjoyWith}">
						<div class="right-block enjoy_with">
							<h4>Enjoy With</h4>
							<p>${coffee.enjoyWith}</p>
						</div>
					</c:if>
					<c:if test="${!empty coffee.processingMethod}">
						<div class="right-block processing_method">
							<h4>Processing Method</h4>
							<p>${coffee.processingMethod}</p>
						</div>
					</c:if>
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
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="resources/js/menu.js"></script>
 	<script src="resources/js/crud.js"></script>
  	<script src="resources/js/share.js"></script>
  	<script src="resources/js/coffeeDetail.js"></script>
</body>
</html>	