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
				<h2>스타벅스 상품</h2>
				<span class="title-home">
					<span class="material-symbols-outlined">home</span>
					<span> >상품>
						<c:choose>
							<c:when test="${menu.type eq 'mugcup'}">
								머그컵
							</c:when>
							<c:when test="${menu.type eq 'thermos'}">
								텀블러
							</c:when>
						</c:choose> >
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
							<span class="material-symbols-outlined" id="editProduct" data-id="${menu.id}">edit</span>
							<span class="material-symbols-outlined" id ="deleteProduct" data-id="${menu.id}">delete</span>
						</div>
						</c:if>
						<div id="addMyFavorite"  data-id="${menu.id}">
							<a href="javascript:void(0)">나만의 상품으로 등록</a>
						</div>
					</div>
					<div class="description-sum">
						<p>${menu.descriptionSummary}</p>
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
  	<script src="/js/share.js"></script>
  	<script src="/js/menu/menuDetail.js"></script>
</body>
</html>	