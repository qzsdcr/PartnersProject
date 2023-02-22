<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>일반 회원 가입 폼</title>
<!-- 아래 link및 라이브러리 절대 건들지 말것 -->
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!-- Bootstrap JS -->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous">
</script>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/ui-darkness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- jQuery UI library -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<!-- jQuery for Modal-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<style>
body {
	min-height: 100vh;
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
#submit1 {
  display: block;
  width: 100%;
  margin-top: auto;
}

</style>
</head>

<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">비밀번호 찾기</h4>
				<form action="passChangeform" class="validation-form" novalidate>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mememail">이메일 주소</label> <input type="text"
								name="mememail" class="form-control" id="mememail"
								placeholder="example@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요</div>
						</div>
						<div class="col-md-6 mb-3" style="margin-top: auto;"
							style="margin-bottom: auto;">
							<button type="button" class="btn btn-primary"
								style="width: 100%;" id="get_auth_num"
								onclick="handleButtonClick()">인증번호 받기</button>
						</div>
					</div>
					
					<input type="hidden" id="tempkey" name="tempkey" value=""> <!-- tempkey 저장 -->

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mail_chk">이메일 인증</label> <input type="text"
								name="mail_chk" class="form-control" id="mail_chk"
								placeholder="이메일 인증번호 입력" required>
							<div class="invalid-feedback">이메일 인증을 해주세요</div>
						</div>
						<div class="col-md-6 mb-3" style="margin-top: auto;"
							style="margin-bottom: auto;">
							<button type="button" class="btn btn-primary"
								style="width: 100%;" id="mail_auth_button">메일 인증</button>
						</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg" type="submit"
						id="submit1">비밀번호 찾기</button>
				</form>

			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 YD</p>
		</footer>
	</div>

<script>
   window.addEventListener('load', () => {
     const forms = document.getElementsByClassName('validation-form');
     Array.prototype.filter.call(forms, (form) => {
       form.addEventListener('submit', function (event) {
         if (form.checkValidity() === false) {
           event.preventDefault();
           event.stopPropagation();
         }
         form.classList.add('was-validated');
       }, false);
     });
   }, false);
</script>

<!-- 유효성처리 (아이디 중복체크 등) -->
<script type="text/javascript"> 
	window.onload = function(){
		//이메일형식 적합여부 검사
		let mail_val = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		//형식검사하는 메서드
		function check( val, target ) {
			if( val.test( target ) ) {
				return true;
			}
		}	
		//이메일 유효성검사
		$( "#mememail" ).blur( function() {
			var mememail = $( "#mememail" ).val();
			if( !check( mail_val, mememail ) ) {
				$( "#mail_chk" ).text( "이메일 형식에 맞지 않습니다." );
				$( "#mail_chk" ).css( "color", "red" );
				$( '#mememail' ).val( "" );
			} else {
				$( "#mail_chk" ).text( "이메일" );
				$( "#mail_chk" ).css( "color", "black" );
			}
		});
	};
</script>


<!-- 메일 인증 구현 -->
<script>
function handleButtonClick() {
	  var email = $('#mememail').val();	
	  var button = document.getElementById('get_auth_num');
	  button.disabled = true;
	  $.ajax({
	    url: './tempkey',
	    type: 'GET',
	    data: {email: email},
	    success: function(data) {
	      console.log(data);
	      var tempkey = data;
	      button.disabled = false;
	      $("#get_auth_num").text("재전송");
	      $("#mail_auth_button").attr("disabled", false);
	      $('#tempkey').val(tempkey); // hidden input 태그에 tempkey 값을 할당
	    },
	    error: function() {
	      console.log("메일인증의 ajax 에러");
	    }
	  });
	}

	$(function() {
	  $("#mail_auth_button").click(function() {
	    verifyTempkey($('#tempkey').val()); // hidden input 태그의 value 속성에서 tempkey 값을 가져와서 verifyTempkey 함수에 전달
	  });
	});

	function verifyTempkey(tempkey) {
		  var inputkey = $('#mail_chk').val();
		  if (tempkey == inputkey) {
		    $("#tempkey").val(tempkey);
		    $("#join_button").attr("disabled", false);
		    $("#mail_auth_button").text("인증 완료");
		    $("#mail_auth_button").attr("disabled", true);
		  } else {
		    $("#join_button").attr("disabled", true);
		    $("#mail_chk").val("");
		    $("#mail_chk").attr("placeholder", "이메일 인증번호를 다시 받으세요.");
		    $("#mail_auth_button").css("color", "red");
		    $("#mail_auth_button").attr("disabled", true);
		  }
		}
</script>

</body>

</html>