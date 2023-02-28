<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap JS(팝업창) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
</head>
</head>
<body>
	<div class="container">
		<h1 class="mt-5">User Page</h1>
		<p class="mb-3">로그인 체크: ${loginCheck}</p>
		<p class="mb-5">로그인 ID: ${memid}</p>
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원 정보 수정</h4>
				<form action="userModify" name="modifyform" class="validation-form"
				method="POST" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memid">아이디</label> <input type="text" name="memid"
								class="form-control" id="memid" placeholder="아이디"
								value="${member.memid}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mempass" id="pwd_chk">비밀번호</label> <input
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
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memname" id="name_chk">이름</label> <input type="text"
								class="form-control" name="memname" id="memname"
								placeholder="이름" value="${member.memname}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="memsex">성별</label> <br /> <select name="memsex"
								class="form-control" id="memsex">
								<option value="">성별선택</option>
								<option value="남성" ${member.memsex == "남성" ? "selected" : ""}>남성</option>
								<option value="여성" ${member.memsex == "여성" ? "selected" : ""}>여성</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="membirth" id="birth_chk">생년월일</label> <input type="text"
								class="form-control" name="membirth" id="membirth"
								placeholder="생년월일" value="${member.membirth}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="mempnum" id="phone_chk">연락처</label> <input type="tel"
								class="form-control" name="mempnum" id="mempnum"
								placeholder="연락처" value="${member.mempnum}">
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mememail">이메일 주소</label> <input type="text"
								name="mememail" class="form-control" id="mememail" placeholder="example@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요</div>
						</div>
						<div class="col-md-6 mb-3" style="margin-top: auto;"
							style="margin-bottom: auto;">
							<button type="button" class="btn btn-primary" style="width: 100%;" id="get_auth_num"
								onclick="handleButtonClick()">인증번호 받기</button>
						</div>
					</div>
					
					<input type="hidden" id="tempkey" name="tempkey" value=""> <!-- tempkey 저장 -->

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mail_chk">이메일 인증</label>
							<input type="text" name="mail_chk" class="form-control" id="mail_chk" placeholder="이메일 인증번호 입력" required>
							<div class="invalid-feedback">이메일 인증을 해주세요</div>
						</div>
						<div class="col-md-6 mb-3" style="margin-top: auto;" style="margin-bottom: auto;">
							<button type="button" class="btn btn-primary" style="width: 100%;" id="mail_auth_button" disabled>메일 인증</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memaddress" id="memaddress">주 활동 지역</label> <br />
							<select name="memaddress" class="form-control"
								value="${member.memaddress}">
								<option value="가산"
									${member.memaddress == "가산" ? "selected" : ""}>가산</option>
								<option value="구로"
									${member.memaddress == "구로" ? "selected" : ""}>구로</option>
								<option value="강남"
									${member.memaddress == "강남" ? "selected" : ""}>강남</option>
								<option value="여의도"
									${member.memaddress == "여의도" ? "selected" : ""}>여의도</option>
								<option value="판교"
									${member.memaddress == "판교" ? "selected" : ""}>판교</option>
								<option value="광명"
									${member.memaddress == "광명" ? "selected" : ""}>광명</option>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="memlikemenu" id="memlikemenu">선호 음식</label> <br />
							<select name="memlikemenu" class="form-control"
								value="${member.memlikemenu}">
								<option value="한식"
									${member.memlikemenu == "한식" ? "selected" : ""}>한식</option>
								<option value="중식"
									${member.memlikemenu == "중식" ? "selected" : ""}>중식</option>
								<option value="양식"
									${member.memlikemenu == "양식" ? "selected" : ""}>양식</option>
								<option value="분식"
									${member.memlikemenu == "분식" ? "selected" : ""}>분식</option>
								<option value="잡식"
									${member.memlikemenu == "잡식" ? "selected" : ""}>잡식</option>
							</select>
						</div>
					</div>
						<button type="submit" id="submit1" class="btn btn-primary">수정하기</button>
				</form>
			</div>
		</div>
	</div>
	<!-- 유효성처리 (아이디 중복체크 등) -->

<script type="text/javascript"> 
  window.onload = function(){
	//id와pw 유효성 검사(4~12자리, 영어대소문자, 숫자만 가능)
	let val = /^[a-zA-Z0-9]{4,15}$/	
	
	//생년월일 유효성 검사
	let birth_val = /([0-9]{2}(0[1-9]{1}|1[0-2]{1})(0[1-9]{1}|[1,2]{1}[0-9]{1}|3[0,1]{1}))/g
	
	//이메일형식 유효성 검사
	let mail_val = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	
	//폰번호 유효성 검사
	let phone_val = /^01(?:0|1|[6-9])\d{3,4}\d{4}$/;
	
	// 이름 유효성 검사 (5자 이하)
	let name_val = /^[a-zA-Z가-힣 ]{2,5}$/;
  
	//형식검사하는 메서드
	function check( val, target ) {
		if( val.test( target ) ) {
			return true;
		}
	}
	  
	  //id 중복 검사
	$( "#memid" ).blur( function() {
		var memid = $( "#memid" ).val();
		if( memid != '' ) {
			if( check( val, memid ) ) {
				$.ajax({
					url: './usingId_chk?memid='+memid,
					type: 'GET',
					success: function( data ) {
						if( data == "0" ) {
							$( "#usingId_chk" ).text( "사용할 수 있는 ID입니다." );
							$( "#usingId_chk" ).css( "color", "blue" );
							$( "#submit1" ).prop( "disabled", false );
						} else if( data == "1"  ) {
							$( "#usingId_chk" ).text( "사용중인 ID입니다." );
							$( "#usingId_chk" ).css( "color", "red" );
							$( "#memid" ).val( "" );
							$( "#submit1" ).prop( "disabled", true );
						}
					},
					error: function() {
						console.log( "joinForm의 ajax 에러" )
						$( "#memid" ).val( "" );
					}
				})
			} else {
				$( "#usingId_chk" ).text( "ID가 형식에 맞지않습니다." );
				$( "#usingId_chk" ).css( "color", "red" );
				$( "#memid" ).val( "" );
				$( "#submit1" ).prop( "disabled", true );
			}	
		} else{
			$( "#usingId_chk" ).text( "아이디" );
			$( "#pwd_chk" ).css( "color", "black" );
			$( "#memid" ).val( "" );
			$( "#submit1" ).prop( "disabled", true );
			
		}
	})
	
		//패스워드 유효성 검사
	$( "#mempass" ).blur( function() {
		var mempass = $( "#mempass" ).val();
		if( mempass != '' ) {
			if( !check( val, mempass ) ) {
				$( "#pwd_chk" ).text( "비밀번호 형식에 맞지 않습니다." );
				$( "#pwd_chk" ).css( "color", "red" );
				$( "#mempass" ).val( "" );
				$( "#submit1" ).prop( "disabled", true );
			}else{
				$( "#pwd_chk" ).text( "비밀번호" );
				$( "#pwd_chk" ).css( "color", "black" );
				$( "#submit1" ).prop( "disabled", true );
			}
			}
			})
			
		//패스워드 똑같이 입력했는지 검사
	$( "#mempass2" ).blur( function() {
	  var mempass = $( "#mempass" ).val();
	  var mempass2 = $( "#mempass2" ).val();
	  if( mempass != '' && mempass2 != '' ) {
	    if( mempass == mempass2 ) {
	      $( "#cpwd_chk" ).text( "비밀번호 확인 완료" );
	      $( "#cpwd_chk" ).css( "color", "blue" );
	      $( "#submit1" ).prop( "disabled", false );
	    } else {
	      $( "#cpwd_chk" ).text( "비밀번호가 틀립니다." );
	      $( "#cpwd_chk" ).css( "color", "red" );
	      $( "#mempass2" ).val( "" );
	      $( "#submit1" ).prop( "disabled", true );
	    }
	  } else {
	    $( "#cpwd_chk" ).text( "비밀번호가 틀립니다." );
	    $( "#mempass2" ).val( "" );
	    $( "#cpwd_chk" ).css( "color", "red" );
	  }
	});
	
		//생년월일 유효성검사
	$( "#membirth" ).blur( function() {
		var membirth = $( '#membirth' ).val();
		if( membirth != '' ) {
		if( membirth.length != 6 || !check( birth_val, membirth ) ) {
			$( "#birth_chk" ).text( "생년월일 형식에 맞지않습니다." );
			$( "#birth_chk" ).css( "color", "red" );
			$( '#membirth' ).val( "" );
			$( "#submit1" ).prop( "disabled", true );
		} else {
			$( "#birth_chk" ).text( "생년월일" );
			$( "#birth_chk" ).css( "color", "black" );
			$( "#submit1" ).prop( "disabled", true );
		}
	}
	})
	
	//이메일 유효성검사
	$( "#mememail" ).blur( function() {
		var mememail = $( "#mememail" ).val();			
		if( !check( mail_val, mememail ) ) {
			$( "#mail_chk" ).text( "이메일 형식에 맞지 않습니다." );
			$( "#mail_chk" ).css( "color", "red" );
			$( '#mememail' ).val( "" );
			$( "#submit1" ).prop( "disabled", true );
		} else {
			$( "#mail_chk" ).text( "이메일" );
			$( "#mail_chk" ).css( "color", "black" );
			$( "#submit1" ).prop( "disabled", true );
		}
	})
	
	//이름 유효성 검사
	$( '#memname' ).blur( function() {
    var memname = $("#memname").val();
 	if( memname != '' ) {
	    if( !check( name_val, memname ) ) {
	      $( "#name_chk" ).text( "이름 형식에 맞지 않습니다." );
	      $( "#name_chk" ).css( "color", "red" );
	      $( '#memname' ).val( "" );
	      $( "#submit1" ).prop( "disabled", true );
		} else {
			$( "#mail_chk" ).text( "이름" );
			$( "#mail_chk" ).css( "color", "black" );
			$( "#submit1" ).prop( "disabled", true );
			}
		}
 	})
	    
	//전화번호 유효성검사
	$( '#mempnum' ).blur( function() {
	  var mempnum = $( '#mempnum' ).val().replace(/-/g, ''); // 하이픈 제거
	  if( mempnum != '' ) {		
	    if( !check( phone_val, mempnum ) ) {
	      $( "#phone_chk" ).text( "연락처 형식에 맞지 않습니다." );
	      $( "#phone_chk" ).css( "color", "red" );
	      $( '#mempnum' ).val( "" );
	      $( "#submit1" ).prop( "disabled", true );
	    } else {
	      var formatted = mempnum.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3'); // 하이픈 추가
	      $( '#mempnum' ).val(formatted);
	      $( "#phone_chk" ).text( "연락처" );
	      $( "#phone_chk" ).css( "color", "black" );
	      $( "#submit1" ).prop( "disabled", true );
	    }
	  }
	});
	}
		$(document).ready(function() {
	    // 입력된 값에 자동으로 하이픈 추가
	    $('#mempnum').mask('000-0000-0000');
	    
	});
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
		if(tempkey == "" || inputkey == ""){
		    $("#join_button").attr("disabled", true);
		    $("#mail_chk").val("");
		    $("#mail_chk").attr("placeholder", "이메일 인증번호를 다시 받으세요.");
		    $("#mail_auth_button").text("인증번호 재전송");
		    $("#mail_auth_button").attr("disabled", true);
		    $( "#submit1" ).prop( "disabled", true );
		} else if (tempkey == inputkey) {
		    $("#tempkey").val(tempkey);
		    $("#join_button").attr("disabled", false);
		    $("#mail_auth_button").text("인증 완료");
		    $("#mail_auth_button").attr("disabled", true);
		    $( "#submit1" ).prop( "disabled", false );
		} else{
			$( "#submit1" ).prop( "disabled", true );
		}
	}
</script>

<script>
  window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');
    Array.prototype.filter.call(forms, (form) => {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        } else if (!document.getElementById('aggrement').checked) {
          alert('개인정보취급방침에 동의해야 합니다.');
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
</script>
		

</body>
</html>