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

				<link rel="stylesheet" type="text/css" href="/css/member/sign-up.css">
			</head>

			<body>
			<jsp:include page="../include/header.jsp"></jsp:include>

				<main class="container-wrapper1">
					<div class="container">
						<div class="reigister-wrapper">
							<form onsubmit="return false">
								<div class="register-top">
									<div class="w-100 info">
										<img src="/images/icon_find_sally.png" />
										<p>회원정보 입니다.</p>
									</div>
									<div class="id-wrapper w-100">
										<h3>아이디</h3> <input type="text" name="account" id="account" placeholder="아이디" readonly/>
									</div>
<%--									<div class="password-wrapper w-100">--%>
<%--										비밀번호 <br> <input type="password" name="password" id="password" placeholder="비밀번호" maxlength="20"/>--%>
<%--									</div>--%>
<%--									<div class="passwordCheck-wrapper w-100">--%>
<%--										비밀번호 확인 <br> <input type="password" name="passwordCheck" id="passwordCheck"--%>
<%--											   placeholder="비밀번호 확인" maxlength="20"/>--%>
<%--									</div>--%>
								</div>
								<div class="register-bottom">
									<div class="level-wrapper bottom-div">
										<div class="w-88">
											<h3>회원 레벨</h3>
											<select name="level">
												<c:forEach begin="1" end="5" var="i">
													<option value="${i}">${i}레벨</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="auth-wrapper bottom-div">
										<div class="w-88">
											<h3>회원 권한</h3>
											<select name="auth">
												<option value="COMMON">일반회원</option>
												<option value="ADMIN">관리자</option>
											</select>
										</div>
									</div>
									<div class="name-wrapper bottom-div">
										<div class="w-88">
											<h3>이름 (필수)</h3>
											<div class="inline">
												<input type="text" name="name" placeholder="이름"/>
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
													<option selected value="양력">양</option>
													<option value="음력">음</option>
												</select>
											</div>
										</div>
										<div class="w-88 ymd-subtext">
											<p></p>
										</div>
									</div>
									<div class="phone-wrapper bottom-div">
										<div class="w-88">
											<h3>휴대폰 번호 (필수)</h3>
											<input type="tel" id="phone" name="phone"
												title="010-XXXX-XXX">
										</div>
									</div>

									<div class="email-wrapper bottom-div">
										<div class="w-88">
											<h3>이메일 (필수)</h3>
											<input type="email" id="email" name="email"
												title="test@email.com"><br>
										</div>
									</div>
									<div class="bottom-div">
										<div class="nickname-wrapper w-88">
											<div class="inline">
												<h3>닉네임 (선택)</h3>
												<span class="material-symbols-outlined error-icon">error</span>
											</div>
											<input type="text" id="nickname" name="nickname"
												   placeholder="한글 6자리 이내로 입력하세요."/>
										</div>
										<div class="w-88">
											<h3>탈퇴 처리 사유</h3>
											<textarea type="text" name="delReason" cols="65" rows="10" style="resize: none"></textarea>
										</div>
									</div>
								</div>
								<div class="w-95">
									<p>* 선택항목은 입력하지 않거나 동의하지 않아도 정보 수정이 가능합니다.
										<br><br>* 회원 탈퇴 처리시 [관리자 탈퇴처리] 문구와 사유를 기재해주십시오
									</p>

								</div>
								<button class="submit" onclick="check(this.form)">회원 정보 수정</button>
								<br><br>
								<c:if test="'${member.account}'!='${loginUser.account}'">
									<button class="submit" onclick="memberDelete('${member.account}')">회원 탈퇴 처리</button>
									<br><br>
								</c:if>
								<button class="submit" onclick="history.go(-1)">목록으로</button>
							</form>
						</div>
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

					document.querySelector("input[name='account']").value = '${member.account}';
					document.querySelector("select[name='level'] option[value='${member.level}']").selected = true;
					document.querySelector("select[name='auth'] option[value='${member.auth}']").selected = true;
					document.querySelector("input[name='name']").value = '${member.name}';
					document.querySelector("input[value='${member.gender}'].btn-check").checked = true;
					document.querySelector("select[name='birthYear'] option[value='${member.birthYear}']").selected = true;
					document.querySelector("select[name='birthMonth'] option[value='${member.birthMonth}']").selected = true;
					document.querySelector("select[name='birthDay'] option[value='${member.birthDay}']").selected = true;
					document.querySelector("select[name='sl'] option[value='${member.sl}']").selected = true;
					document.querySelector("input[name='phone']").value = '${member.phone}';
					document.querySelector("input[name='email']").value = '${member.email}';
					if(${!empty member.nickname}){
						document.querySelector("input[name='nickname']").value = '${member.nickname}';
					}

					function check(form){
						// var pwd = form.password.value;
						// var pwd2 = form.passwordCheck.value;
						$("#errorText").remove();
						$("input").css("border","1px solid #d3d3d3");
						// if(!account){
						// 	var errorText = "<span class =\"subText\" id=\"errorText\">아이디를 입력하세요.</span>"
						// 	$('.id-wrapper').append(errorText);
						// 	$('.id-wrapper input').css("border","1px solid red");
						// 	$('.id-wrapper input').focus();
						//
						// 	return false;
						// }
						// else if($('#account').data('accept')!='true') {
						// 	$(".id-wrapper .subText").remove();
						// 	var errorText = "<span class =\"subText\" id=\"errorText\">사용가능한 아이디를 입력하세요.</span>"
						// 	$('.id-wrapper').append(errorText);
						// 	$('.id-wrapper input').css("border", "1px solid red");
						// 	$('.id-wrapper input').focus();
						//
						// 	return false;

						// }else if(!pwd){
						// 	var errorText = "<span id=\"errorText\">비밀번호를 입력하세요.</span>"
						// 	$('.password-wrapper').append(errorText);
						// 	$('#password').css("border","1px solid red");
						// 	$('#password').focus();
						// 	return false;
						// }
						// else if(pwd != pwd2){
						// 	var errorText = "<span id=\"errorText\">입력하신 비밀번호가 다릅니다.</span>"
						// 	$('.passwordCheck-wrapper').append(errorText);
						// 	$('#passwordCheck').css("border","1px solid red");
						// 	$('#passwordCheck').focus();
						//
						// 	return false;
						// }else
						if(!form.name.value){
							var errorText = "<span class =\"subText\" id=\"errorText\">이름을 입력하세요.</span>"
							$('.name-wrapper .w-88').append(errorText);
							$('input[name = name]').css("border","1px solid red");
							$('input[name = name]').focus();

						}
						else if(form.birthYear.value == 0){
							var errorText = "<span class =\"subText\" id=\"errorText\">생년월일을 모두 입력하세요.</span>"
							$('.ymd').append(errorText);

							$('#ymd')[0].scrollIntoView({block  : 'center'});
						}
						else if(form.birthMonth.value == 0){
							var errorText = "<span class =\"subText\" id=\"errorText\">생년월일을 모두 입력하세요.</span>"
							$('.ymd').append(errorText);

							$('#ymd')[0].scrollIntoView({block  : 'center'});
						}
						else if(form.birthDay.value == 0){
							var errorText = "<span class =\"subText\" id=\"errorText\">생년월일을 모두 입력하세요.</span>"
							$('.ymd').append(errorText);

							$('#ymd')[0].scrollIntoView({block  : 'center'});
						}
						else if(!form.phone.value){
							var errorText = "<span class =\"subText\" id=\"errorText\">전화번호를 입력하세요.</span>"
							$('.phone-wrapper .w-88').append(errorText);
							$('input[name = phone]').focus();
						}
						else if(!form.email.value){
							var errorText = "<span class =\"subText\" id=\"errorText\">이메일을 입력하세요.</span>"
							$('.email-wrapper .w-88').append(errorText);
							$('input[name = email]').focus();
						}else{
							// 탈퇴사유는 멤버에 없으므로 disabled 를 해준다.
							document.querySelector('textarea[name="delReason"]').disabled=true;
							form.action = "/admin/member_modify";
							form.method = "POST";
							if(confirm("회원정보를 수정하시겠습니까?")) {
								form.submit();
							}
						}
					}

					$('#account').focusout(isDuplicate);
					$('#phone').focusout(isDuplicate);
					$('#email').focusout(isDuplicate);
					function isDuplicate(){

						let str = "";
						const target = $(this);
						const type = target.attr('name');
						console.info("get Attr target : ", target.attr('name'));

						if(!patternCheck(target)) return;

						if(type == 'account') {
							str = '아이디';
						}else if(type == 'phone'){
							str = '전화번호';
						}else if(type == 'email'){
							str = '이메일';
						}

						var param = '?type='+type+'&value='+target.val();

						if(param != '?type='+type+'&value='){
							$.ajax({
								type : 'GET',
								datatype : 'json',
								url : '/member/check'+param,
								beforeSend : function(){
									console.info("next : ", target.next());
									target.next().remove();
									target.data('accept','false');
									target.attr("disabled", true);
									target.css("border","1px solid #d3d3d3");
									target.css("border-top","3px solid #d3d3d3");
									const readyText = "<span class =\"subText\" id=\"readyText\">" + str + "(을)를 조회중입니다.</span>";
									target.parent().append(readyText);
								},
								success : function(flag){
									if(!(flag===null)){
										target.removeAttr("disabled");
										target.next().remove();
										target.css("border","1px solid #d3d3d3");

										if(flag=== 'true'){
											const errorText = "<span class =\"subText\" id=\"errorText\">사용하실 수 없는 " + str + "입니다.</span>";
											target.parent().append(errorText);
											target.data('accept','false');
											target.css("border","1px solid red");
											target.css("color","red");
										}
										else{
											const successText = "<span class =\"subText\" id=\"successText\">사용하실 수 있는 " + str + "입니다.</span>";
											target.parent().append(successText);
											target.data('accept','true');
											target.css("border","1px solid d3d3d3");
											target.css("border-top","3px solid #d3d3d3");
										}

									}
									else{
										const msg = str + " 확인 실패!";
										console.log("플래그 : " +flag);
										alert(msg);
									}
								},
								error: function(xhr, status, error){
									alert("회원가입 로드 실패");
								},
							});
						}
					}
					const regexID = /^[a-zA-Z가-힣0-9]{2,20}$/;
					const regexPW = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{10,20}$/;
					const regexP = /^010-([0-9]{3,4})-([0-9]{4})$/;
					const regexE = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i

					$('#password').focusout(patternCheck);

					function patternCheck() {
						const target = $(event.target);
						target.next().remove();
						target.css("border","1px solid #d3d3d3");
						if(target.attr('name') === 'account'){
							if(!regexID.test(target.val())) {
								const errorText = "<span  id=\"errorText\">영문,한글,숫자를 사용하여 2~20자리 이내로 입력하세요.</span>"
								target.parent().append(errorText);
								target.css("border", "1px solid red");
								// target.focus();
								return false;
							}
						// }else if(target.attr('name') === 'password'){
						// 	if(!regexPW.test(target.val())) {
						// 		const errorText = "<span  id=\"errorText\">영문, 숫자 혼합하여 10~20자리 이내로 입력하세요.</span>"
						// 		target.parent().append(errorText);
						// 		target.css("border", "1px solid red");
						// 		// target.focus();
						// 		return false;
						// 	}
						}else if(target.attr('name') === 'phone'){
							if(!regexP.test(target.val())) {
								const errorText = "<span  id=\"errorText\">010-XXXX(XXX)-XXXX 형식으로 숫자를 입력하세요.</span>"
								target.parent().append(errorText);
								target.css("border", "1px solid red");
								// target.focus();
								return false;
							}
						}else if(target.attr('name') === 'email'){
							if(!regexE.test(target.val())) {
								const errorText = "<span  id=\"errorText\" style='display: block'>email 형식에 맞게 입력하세요(ex star@starbucks.com)</span>"
								target.parent().append(errorText);
								target.css("border", "1px solid red");
								// target.focus();
								return false;
							}
						}
						target.css("color", "");
						return true;
					}

					function memberDelete(account){
						if(confirm("해당 회원을 탈퇴 처리 하시겠습니까?")){
							const delReason = document.querySelector('textarea[name="delReason"]').value;
							fetch("/admin/member_delete",{
								method:"POST",
								headers: {
									'content-type': 'application/json'
								},
								body:JSON.stringify({account:account, delReason:delReason})
							})
									.then(res => res.text())
									.then(msg => {
										if(msg === 'SUCCESS'){
											alert("해당 회원을 탈퇴처리 하였습니다.");
											history.go(-1);
										}else if(msg === 'same-account'){
											alert("본인은 탈퇴처리하지 못합니다.")
										}else{
											alert("탈퇴 처리에 실패하였습니다.")
										}
									})
						}

					}

				</script>

			</body>

			</html>