<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>User Page</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap JS(팝업창) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<h1 class="text-center">User Page</h1>
					</div>
					<div class="card-body">
						<div class="row mb-3">
							<div class="col-md-3">
								<h5>로그인 체크:</h5>
							</div>
							<div class="col-md-9">
								<p class="card-text">${loginCheck}</p>
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-md-3">
								<h5>로그인 ID:</h5>
							</div>
							<div class="col-md-9">
								<p class="card-text">${memid}</p>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<tbody>
									<tr>
										<th>아이디</th>
										<td>${member.memid}</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${member.memname}</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${member.memsex}</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>${member.membirth}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${member.mememail}</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>${member.mempnum}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>${member.memaddress}</td>
									</tr>
									<tr>
										<th>좋아하는 메뉴</th>
										<td>${member.memlikemenu}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-secondary"
								onclick="location.href='./'">홈으로 가기</button>
							<button type="button" class="btn btn-primary"
								onclick="location.href='./userModifyForm'">회원 정보 수정</button>
							<button type="button" class="btn btn-danger"
								onclick="location.href='./userDeleteForm'">회원 탈퇴</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>