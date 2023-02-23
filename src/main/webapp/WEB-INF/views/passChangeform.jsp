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
				<h4 class="mb-3">회원가입</h4>
				<form action="passChangeService" class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memid" id="usingId_chk">아이디</label> <input
								type="text" name="memid" class="form-control" id="memid"
								placeholder="4~12자리,영어대소문자,숫자조합" maxlength="12" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mempass" id="pwd_chk">변경할 비밀번호</label> <input
								type="password" name="mempass" class="form-control" id="mempass"
								placeholder="4~12, 영어대소문자, 숫자가능" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="mempass2" id="cpwd_chk">비밀번호 확인</label> <input
								type="password" class="form-control" id="mempass2"
								placeholder="" required>
							<div class="invalid-feedback">비밀번호 확인을 입력해주세요</div>
						</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg" type="submit"
						id="submit1">비밀번호 변경</button>
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
	//id와pw 적합여부 검사(4~12자리, 영어대소문자, 숫자만 가능)
	let val = /^[a-zA-Z0-9]{4,15}$/	
  
	//형식검사하는 메서드
	function check( val, target ) {
		if( val.test( target ) ) {
			return true;
		}
	}
	//패스워드 유효성 검사
	$( "#mempass" ).blur( function() {
		var mempass = $( "#mempass" ).val();
		if( mempass != '' ) {
			if( !check( val, mempass ) ) {
				$( "#pwd_chk" ).text( "비밀번호 형식에 맞지 않습니다." );
				$( "#pwd_chk" ).css( "color", "red" );
				$( "#mempass" ).val( "" );
			}else{
				$( "#pwd_chk" ).text( "비밀번호" );
				$( "#pwd_chk" ).css( "color", "black" );
			}
			}
			});
			
		//패스워드 똑같이 입력했는지 검사
	$( "#mempass2" ).blur( function() {
		var mempass = $( "#mempass" ).val();
		var mempass2 = $( "#mempass2" ).val();
		
		if( mempass != '' && mempass2 != '' ) {
			if( mempass == mempass2 ) {
				$( "#cpwd_chk" ).text( "비밀번호 확인 완료" );
				$( "#cpwd_chk" ).css( "color", "blue" );
			} else {
				$( "#cpwd_chk" ).text( "비밀번호가 틀립니다." );
				$( "#cpwd_chk" ).css( "color", "red" );
				$( "#mempass2" ).val( "" );
				}
		}
	});
  }
</script>

</body>

</html>