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
<!-- jQuery Mask 플러그인 로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

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
				<form action="join" name="joinform" class="validation-form" novalidate>
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
							<label for="memname" id="name_chk">이름</label> 
							<input type="text" class="form-control" name="memname" id="memname" placeholder="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="memsex">성별</label> <br /> <select name="memsex"
								class="form-control" id="memsex" required>
								<option value="">성별선택</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
							</select>
							<div class="invalid-feedback">성별을 선택하세요</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="membirth" id="birth_chk">생년월일</label> <input
								type="text" class="form-control" name="membirth" id="membirth"
								placeholder="YYMMDD" required>
							<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="mempnum" id="phone_chk">연락처</label> 
							<input type="tel" class="form-control" name="mempnum" id="mempnum" placeholder="010-0000-0000" required>
							<div class="invalid-feedback">연락처를 입력해주세요.</div>
						</div>
					</div>

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
							<label for="mail_chk">이메일 인증</label>
							<input type="text" name="mail_chk" class="form-control" id="mail_chk" placeholder="이메일 인증번호 입력" required>
							<div class="invalid-feedback">이메일 인증을 해주세요</div>
						</div>
						<div class="col-md-6 mb-3" style="margin-top: auto;"
							style="margin-bottom: auto;">
							<button type="button" class="btn btn-primary"
								style="width: 100%;" id="mail_auth_button">메일 인증</button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="memaddress" id="memaddress">주 활동 지역</label> <br /> <select
								name="memaddress" class="form-control">
								<option value="가산" selected>가산</option>
								<option value="구로">구로</option>
								<option value="강남">강남</option>
								<option value="여의도">여의도</option>
								<option value="판교">판교</option>
								<option value="광명">광명</option>
								<!-- 중복된 값 제거 -->
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="memlikemenu" id="memlikemenu">선호 음식</label> <br /> <select
								name="memlikemenu" class="form-control">
								<option value="한식" selected>한식</option>
								<option value="중식">중식</option>
								<option value="양식">양식</option>
								<option value="분식">분식</option>
								<option value="잡식">잡식</option>
							</select>
						</div>
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

					<div class="container">
						<div class="form-group row">
							<div class="col-8 offset-4">
								<%-- 동의 사항 내용은 modal창으로 클릭하면 뜨게 만들기 --%>
								<p>
									<label class="form-check-label">
										<input type="checkbox" id="aggrement" name="aggrement" required="required" disabled />
										<a id="aggrement" href="javascript:agree();" data-bs-toggle="modal" data-bs-target="#modal">개인정보취급방침</a>에 동의하십니까?
									</label>
								</p>
							</div>
							<!-- 개인정보방침 modal창 내용 -->
							<div class="modal fade" id="modal" tabindex="-1">
								<div class="modal-dialog-scrollable modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header d-flex justify-content-center">
											<h5 class="modal-title">
												<b>&lt;Partners&gt;</b>개인정보취급방침
											</h5>
										</div>
										<div class="modal-body">
											<div id="dialog" title="개인정보취급방침" class="modal-dialog">
												<p>
													<b>&lt;Partners&gt;</b>은(는) ｢개인정보 보호법｣ 제30조에 따라 정보주체의 개인정보를
													보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보
													처리방침을 수립·공개합니다.
												</p>
												<ul>
													<li><b>제1조(개인정보의 처리목적)</b> &lt;Partners&gt;은(는) 다음의
														목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지
														않으며, 이용 목적이 변경되는 경우에는 ｢개인정보 보호법｣ 제18조에 따라 별도의 동의를 받는 등 필요한
														조치를 이행할 예정입니다.
														<ol>
															<li>홈페이지 회원 가입 및 관리</li> 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인
															식별․인증, 회원자격 유지․관리, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리 시
															법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 목적으로 개인정보를 처리합니다.
															<li>재화 또는 서비스 제공</li> 물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공,
															맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심을 목적으로 개인정보를 처리합니다.
															<li>고충처리</li> 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과
															통보의 목적으로 개인정보를 처리합니다.
															<li>WANT의 개인정보 처리 업무</li> &lt;개인정보 처리업무에 따른 처리목적&gt;으로
															개인정보를 처리합니다.
														</ol></li>
													<li><b>제2조(개인정보의 처리 및 보유기간)</b> ① &lt;Partners&gt;은(는)
														법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보
														보유․이용기간 내에서 개인정보를 처리․보유합니다.<br />② 각각의 개인정보 처리 및 보유 기간은
														다음과 같습니다.
														<ol>
															<li>홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지<br />다만,
																다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지
																<dl>
																	<dd>1) 관계 법령 위반에 따른 수사․조사 등이 진행 중인 경우에는 해당 수사․조사
																		종료 시까지</dd>
																	<dd>2) 홈페이지 이용에 따른 채권․채무관계 잔존 시에는 해당 채권․채무관계 정산
																		시까지</dd>
																	<dd>3) &lt;예외 사유&gt; 시에는 &lt;보유기간&gt; 까지</dd>
																</dl>
															</li>

															<li>재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지<br />
																다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지
																<dl>
																	<dd>
																		1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등
																		거래에 관한 기록<br /> - 표시․광고에 관한 기록 : 6개월 <br /> - 계약 또는
																		청약철회, 대금결제, 재화 등의 공급기록 : 5년 <br /> - 소비자 불만 또는 분쟁처리에
																		관한 기록 : 3년
																	</dd>
																	<dd>
																		2) 「통신비밀보호법」에 따른 통신사실확인자료 보관<br /> - 가입자 전기통신일시,
																		개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년 <br /> -
																		컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월<br />
																	</dd>
																	<dd>3) &lt;개인정보 보유기간 근거법령 및 조문&gt; : &lt;3개월&gt;</dd>
																</dl>
															</li>
															<li>&lt;개인정보 처리업무&gt; : &lt;3개월&gt;</li>
														</ol></li>
													<li><b>기타 모든 사항은 개인정보 처리 방침을 따릅니다.</b></li>
												</ul>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg" type="submit"
						id="submit1">가입 완료</button>
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
  
  
//개인정보방침 modal창 띄우기
function agree() {
	$( '#dialog' ).dialog( 'open' );
}
	  
//개인정보방침보이는 modal창 설정
$( '#dialog' ).dialog({
	width: 450,
	height: 500,
	autoOpen: false,
	modal: true,
	resizable: false,
	buttons: {
		'확인': function() {
			$( this ).dialog( 'close' );
		}
	}
})

//모달창이 닫힐 때 체크박스를 활성화시킴
$('#modal').on('hidden.bs.modal', function (e) {
  $('#aggrement').prop('disabled', false);
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
		  
		  if (tempkey == inputkey) {
		    $("#tempkey").val(tempkey);
		    $("#join_button").attr("disabled", false);
		    $("#mail_auth_button").text("인증 완료");
		    $("#mail_auth_button").attr("disabled", true);
		    $( "#submit1" ).prop( "disabled", false );
		  } else {
		    $("#join_button").attr("disabled", true);
		    $("#mail_chk").val("");
		    $("#mail_chk").attr("placeholder", "이메일 인증번호를 다시 받으세요.");
		    $("#mail_auth_button").attr("disabled", true);
		    $( "#submit1" ).prop( "disabled", true );
		  }
		}
</script>

</body>

</html>