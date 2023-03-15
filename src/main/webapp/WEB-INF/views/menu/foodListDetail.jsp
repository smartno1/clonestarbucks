<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
		<%@include file="../include/static-head.jsp"%>
        <link rel="stylesheet" type="text/css" href="/css/menu/menuDetail.css">

</head>
<body>
	<%@include file="../include/header.jsp"%>
          
	<main class="container-wrapper">
		<div class="container">
			<div class="container-name">
				<h2>스타벅스 음식</h2>
				<span class="title-home">
					<span class="material-symbols-outlined">home</span>&nbsp;
					<span> > 음식 >
						<c:choose>
							<c:when test="${menu.type eq 'cake'}">
								케이크
							</c:when>
							<c:when test="${menu.type eq 'sandwich'}">
								샌드위치
							</c:when>
						</c:choose>	>
					   ${menu.nameKr}</span>
				</span>
			</div>
			<div class="context-top">
				<div class="coffee-img">
					<img src="${menu.image}"/>
					<div class="coffee-img2">
						<img src="${menu.image}"/>
					</div>
				</div>

				<div class="coffee-description">
					<div class="name">
						<div class="name-left">
							<h2>${menu.nameKr}</h2>
							<p>${menu.nameEn}</p>
						</div>
						<c:if test="${loginUser.auth == 'ADMIN'}">
						<div class="name-right">
							<span class="material-symbols-outlined" id="edit1" data-id="${menu.id}">edit</span>
							<span class="material-symbols-outlined" id ="fooddelete" data-id="${menu.id}">delete</span>
						</div>
						</c:if>
						<div class="myDrink">
							<a>나만의 상품으로 등록</a>
						</div>

					</div>
					<div class="description-sum">
						<p>${menu.descriptionSummary}</p>
					</div>

					<div class="weight">
						<h3>제품 영양 정보</h3>
						<p class="jjtext1"> ${menu.weight}(g)</p>
					</div>
					<div class="calorie">
						<div class="box-01">
							<c:if test="${not empty menu.calorie1}">
							<h3>1회 제공량 (kcal)</h3>
							<p>${menu.calorie1}</p>
							</c:if>
							<c:if test="${not empty menu.calorie3}">
							<h3>포화지방 (g)</h3>
							<p>${menu.calorie3}</p>
							</c:if>
							<c:if test="${not empty menu.calorie2}">
							<h3>단백질 (g)</h3>
							<p>${menu.calorie5}</p>
							</c:if>
						</div>
						<div class="box-02">
							<c:if test="${not empty menu.calorie2}">
							<h3>나트륨 (mg)</h3>
							<p>${menu.calorie2}</p>
							</c:if>
							<c:if test="${not empty menu.calorie4}">
							<h3>당류 (g)</h3>
							<p>${menu.calorie4}</p>
							</c:if>
							<c:if test="${not empty menu.calorie6}">
							<h3>카페인 (mg)</h3>
							<p>${menu.calorie6}</p>
							</c:if>
						</div>
					</div>


					<div class="icon">
						<%-- <div class="fb-share-button" 
			                data-href="https://ksh-starbucks-clone.herokuapp.com/coffee_bean_detail.jsp?seq=${coffee.id}" 
			                data-layout="button_count"
			                data-size="small">
                		</div> --%>

					</div>
				</div>
			</div>
			<div class="context-description-bottom">
				<div class="description-bottom-left">
					<div class="description-bottom-left-top description_detail">
						${menu.descriptionDetail}
					</div>

				</div>

			</div>

		</div>
	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
 	<script src="/js/menu/crud2.js"></script>
  	<script src="/js/menu/share.js"></script>
  	<script src="/js/menu/coffeeDetail.js"></script>
</body>
</html>	