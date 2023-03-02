<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 탈퇴 페이지</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- Custom CSS -->
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	max-width: 700px;
}

.form-label {
	font-weight: bold;
}

.form-control-plaintext {
	border: none;
	background-color: transparent;
}

.btn-delete {
	background-color: #dc3545;
	border-color: #dc3545;
	color: #fff;
	font-size: 1rem;
	padding: 0.5rem 1rem;
}

.btn-delete:hover {
	background-color: #c82333;
	border-color: #bd2130;
}

.btn-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn-container .btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	color: #fff;
	font-size: 1rem;
	padding: 0.5rem 1rem;
	flex: 1;
	margin-right: 10px;
}

.btn-container .btn-delete {
	flex: 1;
	margin-left: 10px;
}

/* 추가 */
.btn-primary {
	font-size: 1rem;
	padding: 0.5rem 1rem;
}

.btn-my-page {
	font-size: 1rem;
	padding: 0.5rem 1rem;
}
</style>
</head>

<body>
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header bg-danger text-white">
						<h2 class="mb-0">회원 탈퇴</h2>
					</div>
					<div class="card-body">
						<form id="delete-form">
							<div class="form-group row">
								<label for="memid" class="col-sm-4 col-form-label form-label">아이디</label>
								<div class="col-sm-8">
									<p id="memid" class="form-control-plaintext">${member.memid}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="memname" class="col-sm-4 col-form-label form-label">이름</label>
								<div class="col-sm-8">
									<p id="memname" class="form-control-plaintext">${member.memname}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="memsex" class="col-sm-4 col-form-label form-label">성별</label>
								<div class="col-sm-8">
									<p id="memsex" class="form-control-plaintext">${member.memsex}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="membirth" class="col-sm-4 col-form-label form-label">생년월일</label>
								<div class="col-sm-8">
									<p id="membirth" class="form-control-plaintext">${member.membirth}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="mempnum" class="col-sm-4 col-form-label form-label">휴대폰
									번호</label>
								<div class="col-sm-8">
									<div id="mempnum" class="form-control-plaintext">${member.mempnum}</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="mememail" class="col-sm-4 col-form-label form-label">이메일</label>
								<div class="col-sm-8">
									<p id="mememail" class="form-control-plaintext">${member.mememail}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="memaddress"
									class="col-sm-4 col-form-label form-label">주소</label>
								<div class="col-sm-8">
									<p id="memaddress" class="form-control-plaintext">${member.memaddress}</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="memlikemenu"
									class="col-sm-4 col-form-label form-label">좋아하는 메뉴</label>
								<div class="col-sm-8">
									<p id="memlikemenu" class="form-control-plaintext">${member.memlikemenu}</p>
								</div>
							</div>
							<div
								class="form-group row d-flex justify-content-between align-items-center">
								<div class="col-sm-6 text-center">
									<a href="userPage"
										class="btn btn-lg btn-primary btn-block btn-my-page">마이페이지</a>
								</div>
								<div class="col-sm-6 text-center">
									<button type="button"
										class="btn btn-lg btn-danger btn-block btn-delete"
										data-toggle="modal" data-target="#confirm-delete-modal">회원탈퇴</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Confirm Delete Modal -->
		<div class="modal fade" id="confirm-delete-modal" tabindex="-1"
			role="dialog" aria-labelledby="confirm-delete-modal-label"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header bg-danger text-white">
						<h5 class="modal-title" id="confirm-delete-modal-label">회원 탈퇴</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>정말 탈퇴하시겠습니까? 비밀번호를 입력해주세요.</p>
						<form action="userDelete" method="post" id="delete-form">
							<div class="form-group">
								<label for="password" class="sr-only">비밀번호</label> 
								<input type="password" id="mempass" name="mempass"
									class="form-control" placeholder="비밀번호를 입력해주세요" required>
							</div>
							<div class="form-group text-right">
								<button type="button" class="btn btn-secondary mr-2"
									data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-danger">회원 탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				$("#delete-form").submit(function(event) {
					event.preventDefault(); // 기본 동작 취소
					var mempass = $("#mempass").val(); // 비밀번호 입력값 가져오기
					$.ajax({
						url : "./userDelete",
						type : "POST",
						data : {
							mempass : mempass
						},
						success : function(response) {
							if (response === "success") {
								alert("회원 탈퇴가 완료되었습니다.");
								window.location.href = "/"; // 로그인 페이지로 이동
							} else {
								alert("비밀번호가 일치하지 않습니다.");
							}
						},
						error : function() {
							alert("서버와의 통신에 실패했습니다.");
						}
					});
				});
			});
		</script>


		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
</body>
</html>