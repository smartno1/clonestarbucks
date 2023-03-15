<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../include/static-head.jsp"%>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<%--	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--	<link href="/images/logo.png" rel="shortcut icon" type="image/x-icon">--%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://accounts.google.com/gsi/client" async defer></script>

	<script src="/js/sign-in.js" defer></script>

	<link rel="stylesheet" type="text/css" href="/css/member/sign-in.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
<main class="container-wrapper1">
	<div class="container">
		<h2>로그인</h2>
		<div class="login-wrapper">
			<div class="login-top"> 
				<h3 class="welcome">Welcome!</h3><h3>스타벅스 코리아에 오신 것을 환영합니다</h3>
			</div>
			<form id="form" action="/member/sign-in" method="post" accept-charset="UTF-8" onsubmit="return false">
				<div class="login-mid">
					<input type="text" name="account" placeholder="아이디를 입력해 주세요."/>
					<input type="password" name="password" placeholder="비밀번호를 입력해 주세요."/>
					<div class="save">
						<span class="material-symbols-outlined check">check</span>
						<h3>아이디 저장</h3>
					</div>
					<button class="submit" type="submit" onclick=login()>로그인</button>
					<div id="kakao-login">
						<a id="custom-login-btn" href="/kakao-login">
							<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						</a>
					</div>
					<div id="buttonDiv">
						<fieldset>
							<a id="googleLoginBtn" href="/google-login" style="cursor: pointer">
								<img id="googleLoginImg" src="/images/icon/btn_google_signin.png" width="300">
							</a>
						</fieldset>
					</div>
					<p>* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.</p>
					<p>* 스타벅스 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다</p>
				</div>
			</form>
			<div class="login-bottom">
				<button onclick="location.href='/member/sign-up';">회원가입</button>
				<button onclick="location.href='/member/find_ID';">아이디 찾기</button>
				<button onclick="location.href='/member/find_PW';">비밀번호 찾기</button>
			</div>
		</div>
	</div>
</main>


<jsp:include page="../include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

	// document.querySelector('.submit').addEventListener('click', login);
	console.info("reuri : ","${redirectURI}");
	function login() {
		const form = document.getElementById('form');
		const formData = new FormData(form);
		const reqInfo = {
			method: 'POST'
			, body: formData
		}

		fetch('/member/sign-in', reqInfo)
				.then(res => res.text())
				.then(result => {
					if (result === "SUCCESS") {
						var msg = "로그인 성공";
						alert(msg);
						location.href = "/";
					} else if (result === "NO_PW") {
						var msg = "비밀번호가 틀립니다.";
						alert(msg);
					} else if (result === "NO_ACC") {
						var msg = "존재하지 않는 아이디입니다."
						alert(msg);
					} else {
						alert("로그인 로드 실패");
					}
				})
	}

	<%--const msg = '${msg}';--%>
	<%--if (msg === 'reg-success') {--%>
	<%--	alert('축하합니다. 회원가입에 성공했습니다.');--%>

	<%--}else if(msg==='mod-success'){--%>
	<%--alert('회원정보가 수정되었습니다. 다시 로그인하세요');--%>
	<%--	}else if(msg==='mod-failed'){--%>
	<%--	  alert('회원정보 수정이 실패하였습니다.');--%>
	<%--	}--%>
	<%--const loginMsg = '${loginMsg}';--%>
	<%--if (loginMsg === 'NO_ACC') {--%>
	<%--	alert('존재하지 않는 회원입니다.');--%>
	<%--} else if (loginMsg === 'NO_PW') {--%>
	<%--	alert('비밀번호가 틀렸습니다.');--%>
	<%--}else if(loginMsg === "No_EMAIL"){--%>
	<%--	alert('연결된 계정이 없습니다. 회원가입 해주세요');--%>
	<%--}--%>

	const warning = '${warningMsg}';
	if (warning === 'forbidden') {
		alert('로그인 후 사용할 수 있습니다.');
	}

	const loginMsg = '${loginMsg}'
	if(${!empty loginMsg}){
		alert("${loginMsg}");
	}

</script>
</body>
</html>