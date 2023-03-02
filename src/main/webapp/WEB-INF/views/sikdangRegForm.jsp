<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sikdangRegForm</title>
<!-- Bootstrap CDN 추가 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	crossorigin="anonymous">
<!-- Fontawesome CDN 추가 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	crossorigin="anonymous">
<!-- Google Font 추가 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">

<!-- JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	background-color: #f2f2f2;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

h1 {
	font-size: 36px;
	font-weight: bold;
	color: #333333;
	text-align: center;
	margin-bottom: 30px;
}

label {
	font-weight: bold;
	color: #555555;
}

.form-control:focus {
	border-color: #2f80ed;
	box-shadow: none;
}

.btn-primary {
	background-color: #2f80ed;
	border-color: #2f80ed;
}

.btn-primary:hover {
	background-color: #2c70ac;
	border-color: #2c70ac;
}
</style>
</head>
<body>

	<div class="container validation-form">
		<h1>업체 등록</h1>
		<hr>
		<form method="post" action="sikwrite" enctype="multipart/form-data">
			
			
			
			<div class="form-group">
				<label for="sikno">사업자 번호</label> <input type="text"
					class="form-control" id="sikno" name="sikno" required>
			</div>
			<div class="form-group">
				<label for="sikname">업체명</label> <input type="text"
					class="form-control" id="sikname" name="sikname" required>
			</div>
			<div class="form-group">
				<label for="sikloca">지역</label> <input type="text"
					class="form-control" id="sikloca" name="sikloca" required>
			</div>
			<div class="form-group">
				<label for="siktel">전화번호</label> <input type="tel"
					class="form-control" id="siktel" name="siktel" required>
			</div>
			<div class="form-group">
				<label for="sikaddress">주소</label> <input type="text"
					class="form-control" id="sikaddress" name="sikaddress" required>
			</div>
			<div class="form-group">
				<label for="sikaddress2">상세주소</label> <input type="text"
					class="form-control" id="sikaddress2" name="sikaddress2" required>
			</div>
			<div class="form-group">
				 <input type="hidden" class="form-control" id="sikopenclose" name="영업중" required checked="checked">
	
			</div>
			<div class="form-group">
				<label for="sikcontent">내용</label>
				<textarea class="form-control" id="sikcontent" name="sikcontent"
					rows="3" required></textarea>
			</div>
			
			<div class="form-group">
				<label for="sikfile">식당 사진</label> <input type="file"
					class="form-control-file" id="sikfile" name="file" required>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>


	<!-- Bootstrap JS 추가 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>



</html>