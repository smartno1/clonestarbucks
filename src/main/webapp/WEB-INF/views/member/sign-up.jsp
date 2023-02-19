<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>
			<head>
				<%@include file="../include/static-head.jsp"%>

				<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<%--					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
					<link href="/images/logo.png" rel="shortcut icon" type="image/x-icon">
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script src="https://accounts.google.com/gsi/client" async defer></script>

				<script src="/js/sign-up.js" defer></script>

				<link rel="stylesheet" type="text/css" href="/css/sign-up.css">
			</head>

			<body>
			<jsp:include page="../include/header.jsp"></jsp:include>

				<main class="container-wrapper1">
					<div class="container">
						<h2>회원가입</h2>
						<form action="/member/sign-up" method="post" accept-charset="UTF-8" onsubmit="return false;">
							<div class="reigister-wrapper">

								<div class="register-top">
									<div class="w-100 info">
										<img src="/images/icon_find_sally.png" />
										<p>화원정보를 입력해주세요</p>
									</div>
									<div class="id-wrapper w-100">
										<input type="text" name="account" id="id" placeholder="아이디" />
									</div>
									<div class="password-wrapper w-100">
										<input type="password" name="password" id="password" placeholder="비밀번호" />
									</div>
									<div class="passwordCheck-wrapper w-100">
										<input type="password" name="passwordCheck" id="passwordCheck"
											placeholder="비밀번호 확인" />
									</div>
								</div>
								<div class="register-bottom">
									<div class="name-wrapper bottom-div">
										<div class="w-88">
											<h3>이름 (필수)</h3>
											<div class="inline">
												<input type="text" name="name" placeholder="이름" />
												<div class="btn-group" role="group"
													aria-label="Basic radio toggle button group">
													<input type="radio" class="btn-check" name="gender" id="btnradio1" value="M"
														autocomplete="off" checked>
													<label class="btn1 btn" for="btnradio1">남</label>

													<input type="radio" class="btn-check" name="gender" id="btnradio2" value="F"
														autocomplete="off">
													<label class="btn2 btn" for="btnradio2">여</label>
												</div>
											</div>
										</div>
									</div>
									<div class="ymd-wrapper bottom-div">
										<div class="w-88 ymd">
											<h3>생년월일 (필수)</h3>
											<div class="inline" id="ymd">
												<select class="form-select" name="birthYear">
													<option selected value="0">생년</option>
													<c:forEach var="i" begin="1900" end="2022">
														<option value="${i}"> ${i}</option>
													</c:forEach>
												</select>
												<select class="form-select" name="birthMonth">
													<option selected value="0">월</option>
													<c:forEach var="i" begin="1" end="12">
														<option value="${i}"> ${i}</option>
													</c:forEach>
												</select>
												<select class="form-select" name="birthDay">
													<option selected value="0">일</option>
													<c:forEach var="i" begin="1" end="31">
														<option value="${i}"> ${i}</option>
													</c:forEach>
												</select>
												<select class="form-select sl" name="sl">
													<option selected value="s">양</option>
													<option value="l">음</option>
												</select>
											</div>
										</div>
										<div class="w-88 ymd-subtext">
											<p>회원가입 완료 후 스타벅스 카드를 등록하시면 생일 무료음료 쿠폰이 발행됩니다.</p>
										</div>
									</div>
									<div class="phone-wrapper bottom-div">
										<div class="w-88">
											<h3>휴대폰 번호 (필수)</h3>
											<input type="tel" id="phone" name="phone" pattern="010-[0-9]{4}-[0-9]{4}"
												title="010-XXXX-XXX">
										</div>
									</div>

									<div class="email-wrapper bottom-div">
										<div class="w-88">
											<h3>이메일 (필수)</h3>
											<input type="email" id="email" name="email" pattern="/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/"
												title="test@email.com">
										</div>
									</div>

									<div class="bottom-div nickname-img">

									</div>
									<div class="bottom-div">
										<div class="nickname-wrapper w-88">
											<div class="inline">
												<h3>닉네임 (선택)</h3>
												<span class="material-symbols-outlined error-icon">error</span>
											</div>
											<input type="text" id="nickname" name="nickname"
												placeholder="한글 6자리 이내로 입력하세요." />
										</div>
									</div>
								</div>
								<div class="w-95">
									<p>* 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.</p>
								</div>
								<button class="submit" onclick="check(this.form)">회원가입</button>
							</div>
						</form>
					</div>
				</main>


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
				</script>

			</body>

			</html>