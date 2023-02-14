<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="resources/js/jquery-3.6.3.min.js"></script>﻿

<head><1></1>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form action="join" class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="memid" >아이디</label><div id="usingId_chk"></div>
              <input type="text" name="memid" class="form-control" id="memid" placeholder="4~12자리,영어대소문자,숫자조합" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="mempass">비밀번호</label>
              <input type="text" name="mempass" class="form-control" id="mempass" placeholder="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="mempass2">비밀번호 확인</label>
              <input type="text" class="form-control" id="mempass2" placeholder="" required>
              <div class="invalid-feedback">
                비밀번호 확인을 입력해주세요
              </div>
            </div>
          </div>
          <div class="row">
          	<div class="col-md-6 mb-3">
          	  <label for="memname">이름</label>
         	  <input type="text" name="memname" class="form-control" id="memname" placeholder="" required>
         	  <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          	<div class="col-md-6 mb-3">
          	  <label for="memsex">성별</label>  <br />
          	  <select name="memsex" class="form-control" id="memsex" required>
          	  	<option value="">성별선택</option>
          	  	<option value="남성">남성</option>
          	  	<option value="여성">여성</option>
          	  </select>
         	  <div class="invalid-feedback">
                성별을 선택하세요
              </div>
            </div>
          </div>
          
          <div class="row">          
	          <div class="col-md-6 mb-3">
	            <label for="membirth">생년월일</label>
	            <input type="text" class="form-control" name="membirth" id="membirth" placeholder="주민등록번호 앞 6글자" required>
	            <div class="invalid-feedback">
	              이메일을 입력해주세요.
	            </div>
	          </div>
	          <div class="col-md-6 mb-3">
	            <label for="mempnum">연락처</label>
	            <input type="tel" class="form-control" name="mempnum" id="mempnum" placeholder="010-0000-0000" required>
	            <div class="invalid-feedback">
	              연락처를 입력해주세요.
	            </div>
	          </div>	          
          </div>
          
          <div class="mb-3">
            <label for="mememail">이메일</label>
	            <input type="email" name="mememail" class="form-control" id="mememail" placeholder="you@example.com" required>
            <div class="invalid-feedback">
	              이메일을 입력해주세요.
            </div>
          </div>          

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" name="address" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3" class="checkbox-control">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" name="address2" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>
          
          <div class="mb-3">
            <label for="memaddress">활동 지역</label> <br />
          	<input type="checkbox" name="memaddress" value="가산" />가산 
		    <input type="checkbox" name="memaddress" value="구로" />구로 
		    <input type="checkbox" name="memaddress" value="강남" />강남 
		    <input type="checkbox" name="memaddress" value="여의도" />여의도 
		    <input type="checkbox" name="memaddress" value="판교" />판교
          </div>

          <div class="mb-3">
            <label for="memaddress">선호 음식</label> <br />
			<input type="checkbox" name="memlikemenu" value="한식" />한식 
			<input type="checkbox" name="memlikemenu" value="중식" />중식 
			<input type="checkbox" name="memlikemenu" value="양식" />양식 
			<input type="checkbox" name="memlikemenu" value="분식" />분식 
			<input type="checkbox" name="memlikemenu" value="잡식" />잡식 <br /> 
          </div>
          
<!-- 		  가입경로 & 추천인코드 비활성화
          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root">가입 경로</label>
              <select class="custom-select d-block w-100" id="root">
                <option value=""></option>
                <option>검색</option>
                <option>카페</option>
              </select>
              <div class="invalid-feedback">
                가입 경로를 선택해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="code">추천인 코드</label>
              <input type="text" class="form-control" id="code" placeholder="" required>
              <div class="invalid-feedback">
                추천인 코드를 입력해주세요.
              </div>
            </div>
          </div>
 -->          
 		  <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" name="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit1">가입 완료</button>
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
							$( "#usingId_chk" ).css( "margin-left", "155px" );
							$( "#usingId_chk" ).css( "color", "blue" );
							$( "#submit1" ).attr( "disabled", false );
						} else if( data == "1"  ) {
							$( "#usingId_chk" ).text( "사용중인 ID입니다." );
							$( "#usingId_chk" ).css( "margin-left", "155px" );
							$( "#usingId_chk" ).css( "color", "red" );
							$( "#submit1" ).attr( "disabled", true );
						}
					},
					error: function() {
						console.log( "joinForm의 ajax 에러" )
					}
				})
			} else {
				$( "#usingId_chk" ).text( "ID가 형식에 맞지않습니다." );
				$( "#usingId_chk" ).css( "margin-left", "155px" );
				$( "#usingId_chk" ).css( "color", "red" );
				$( "#user_id" ).val( "" );
				$( "#submit1" ).attr( "disabled", true );
			}	
		} else {
			$( "#usingId_chk" ).text( "" );
		}
	})
  }
</script>
  
</body>

</html>