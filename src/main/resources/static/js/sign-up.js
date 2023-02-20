
function check(form){
	var pwd = form.password.value;
	var pwd2 = form.passwordCheck.value;
	var account = form.account.value;
	$("#errorText").remove();
	$("input").css("border","1px solid #d3d3d3");
	if(!account){
		var errorText = "<span class =\"subText\" id=\"errorText\">아이디를 입력하세요.</span>"
		$('.id-wrapper').append(errorText);
		$('.id-wrapper input').css("border","1px solid red");
		$('.id-wrapper input').focus();
		
		return false;
	}
	else if($('#account').data('accept')!='true') {
		$(".id-wrapper .subText").remove();
		var errorText = "<span class =\"subText\" id=\"errorText\">사용가능한 아이디를 입력하세요.</span>"
		$('.id-wrapper').append(errorText);
		$('.id-wrapper input').css("border", "1px solid red");
		$('.id-wrapper input').focus();

		return false;

	}else if(!pwd){
		var errorText = "<span id=\"errorText\">비밀번호를 입력하세요.</span>"
		$('.password-wrapper').append(errorText);
		$('#password').css("border","1px solid red");
		$('#password').focus();
		return false;
	}
	else if(pwd != pwd2){
		var errorText = "<span id=\"errorText\">입력하신 비밀번호가 다릅니다.</span>"
		$('.passwordCheck-wrapper').append(errorText);
		$('#passwordCheck').css("border","1px solid red");
		$('#passwordCheck').focus();

		return false;
	}
	else if(!form.name.value){
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
	}


	else{
		form.action = "./sign-up";
		form.method = "POST";
		form.submit();
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
			target.focus();
			return false;
		}
	}else if(target.attr('name') === 'password'){
		if(!regexPW.test(target.val())) {
			const errorText = "<span  id=\"errorText\">영문, 숫자 혼합하여 10~20자리 이내로 입력하세요.</span>"
			target.parent().append(errorText);
			target.css("border", "1px solid red");
			target.focus();
			return false;
		}
	}else if(target.attr('name') === 'phone'){
		if(!regexP.test(target.val())) {
			const errorText = "<span  id=\"errorText\">010-XXXX(XXX)-XXXX 형식으로 숫자를 입력하세요.</span>"
			target.parent().append(errorText);
			target.css("border", "1px solid red");
			target.focus();
			return false;
		}
	}else if(target.attr('name') === 'email'){
		if(!regexE.test(target.val())) {
			const errorText = "<span  id=\"errorText\" style='display: block'>email 형식에 맞게 입력하세요(ex star@starbucks.com)</span>"
			target.parent().append(errorText);
			target.css("border", "1px solid red");
			target.focus();
			return false;
		}
	}
	target.css("color", "");
	return true;
}
