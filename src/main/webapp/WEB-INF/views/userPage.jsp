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
		<h1 class="mt-5">User Page</h1>
		<p class="mb-3">로그인 체크: ${loginCheck}</p>
		<p class="mb-5">로그인 ID: ${memid}</p>
		
		<!-- 회원 정보 출력 -->
		<div class="mb-5">
			<h2>회원 정보</h2>
			<table class="table table-bordered">
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
			<!-- 회원 정보 수정 버튼 -->
			<button type="button" class="btn btn-primary"
				onclick="location.href='./userModifyForm'">회원 정보 수정</button>
			<!-- 회원 탈퇴 버튼 -->
			<button type="button" class="btn btn-danger"
				onclick="location.href='./userDeleteForm'">회원 탈퇴</button>
		</div>
</body>
</html>