// var count = 0;

// function login(form) {
//
// 	const reqInfo = {
// 		method:'POST'
// 		,body:form
// 	}
// 	document.querySelector('html').style.cursor="wait";
//
// 	fetch('/member/sign-in',reqInfo)
// 		.then(res => res.text())
// 		.then(result => {
//
// 			if (result === "SUCCESS") {
// 				var msg = "로그인 성공";
// 				alert(msg);
// 				history.go(-1);
// 			} else if (result === "NO_PW") {
// 				var msg = "비밀번호가 틀립니다.";
// 				alert(msg);
// 			} else if (result === "NO_ACC") {
// 				var msg = "존재하지 않는 아이디입니다."
// 				alert(msg);
// 			} else {
// 				alert("로그인 로드 실패");
// 			}
// 			document.querySelector('html').style.cursor="default";
//
// 		})
	// $.ajax({
	// 	type: 'POST',
	// 	data: $("form").serialize(),
	// 	datatype: 'json',
	// 	url: 'sign-in',
	// 	beforeSend: function () {
	// 		$("html").css("cursor", "wait");
	// 	},
	// 	success: function (result) {
	// 		if (result = "SUCCESS") {
	// 			var msg = "로그인 성공";
	// 			alert(msg);
	// 			location.href = "./index";
	// 		} else if (result = "NO_PW") {
	// 			var msg = "비밀번호가 틀립니다.";
	//
	// 			alert(msg);
	// 		} else if (result = "NO_ACC") {
	// 			var msg = "존재하지 않는 아이디입니다."
	// 		}
	// 		$("html").css("cursor", "default");
	// 	},
	// 	error: function (xhr, status, error) {
	// 		alert("로그인 로드 실패");
	// 	}
	// });
// }

$(".save").on('click',function(){
	if($(".check").css('background-color')=='rgb(0, 128, 0)'){
		$(".check").css('background-color','grey');
	}
	else{
		$(".check").css('background-color','green');
	}
});
// function handleCredentialResponse(response) {
//     console.log("Encoded JWT ID token: " + response.credential);
//         $.ajax({
//                         type : 'GET',
//                         datatype : 'json',
//                         url : "/oauth/google?code="+response.credential,
//                         success : function(result){
//                             if(result){
//                                 var name = result.name;
//                                 var msg = name + "님 환영합니다.";
//                                 alert(msg);
//                                 location.href="./index";
//                             }
//                             else{
//                                 var msg = "로그인 실패!";
//                                 alert(msg);
//                             }
//                             $("html").css("cursor","default");
//                         },
//                         error: function(xhr, status, error){
// 	                        alert("로그인 실패");
// 	                        $("html").css("cursor","default");
// 	                   }
//                     })
//             }

/*function handleCredentialResponse(response) {
    console.log("Encoded JWT ID token: " + response.credential);
        $.ajax({
            type : 'GET',
            datatype : 'json',
            url : "./loginGoogle?token="+response.credential,
            beforeSend : function(){
				$("html").css("cursor","wait");
			},
            success : function(result){
                if(result.name){
                    var name = result.name;
                    var msg = name + "님 환영합니다.";
                    alert(msg);
                    location.href="./index";
                }
                else{
                    $.ajax({
                        type : 'GET',
                        datatype : 'json',
                        url : "./loginApiFail?token="+response.credential,
                        success : function(result){
                            if(result){
                                var name = result.name;
                                var msg = name + "님 환영합니다.";
                                alert(msg);
                                location.href="./index";
                            }
                            else{
                                var msg = "로그인 실패!";
                                alert(msg);
                            }
                            $("html").css("cursor","pointer");
                        },
                        error: function(xhr, status, error){
	                        alert("로그인 실패");
	                        $("html").css("cursor","default");
	                   }
                    })
                }
            },
            error: function(xhr, status, error){
            		alert("people api 실패");
                    $.ajax({
                        type : 'GET',
                        datatype : 'json',
                        url : "./loginApiFail?token="+response.credential,
                        success : function(result){
                            if(result){
                                var name = result.name;
                                var msg = name + "님 환영합니다.";
                                alert(msg);
                                location.href="./index";
                            }
                            else{
                                var msg = "로그인 실패!";
                                alert(msg);
                            }
                            $("html").css("cursor","pointer");
                        },
                        error: function(xhr, status, error){
	                        alert("로그인 실패");
	                        $("html").css("cursor","default");
	                   }
                    })
            }
    });
}*/
        // window.onload = function () {
        //   google.accounts.id.initialize({
        //     client_id: "916741122216-rfs53tl1hd2k6vh8fa5uvspmt348hcn4.apps.googleusercontent.com",
        //     callback: handleCredentialResponse
        //   });
        //   google.accounts.id.renderButton(
        //     document.getElementById("buttonDiv"),
        //     { theme: "outline", size: "large" }  // customization attributes
        //   );
        //  // google.accounts.id.prompt(); // also display the One Tap dialog
        // }



    
