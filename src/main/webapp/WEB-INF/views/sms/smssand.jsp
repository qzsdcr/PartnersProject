
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Single+Day&display=swap"
	rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Insert title here</title>
<style>
.main-wrapper {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.left-section, .right-section {
	width: 48%;
	box-sizing: border-box;
	padding: 20px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
}

form {
  font-family: Arial, sans-serif;
  font-size: 16px;
  line-height: 1.5;
  margin: 20px;
}

label {
  display: inline-block;
  width: 100px;
  text-align: right;
  margin-right: 10px;
}

input[type="text"] {
  font-family: Arial, sans-serif;
  font-size: 16px;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  width: 300px;
  margin-bottom: 10px;
}

input[type="text"], textarea {
  vertical-align: middle;
}

textarea {
  font-family: Arial, sans-serif;
  font-size: 16px;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  width: 300px;
  height: 300px;
  margin-bottom: 10px;
}

button[type="submit"] {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 10px 20px;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  margin-top: 10px;
  text-align: center;
}

button[type="submit"]:hover {
  background-color: #3e8e41;
  margin-left: 20px;
}

</style>
</head>
<!-- CSS -->
<link rel="stylesheet" href="resources/assets/css/styles.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- chart js -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<!-- JS -->
<script src="resources/assets/js/main.js"></script>
<script>
var crypto = require("crypto");
var axios = require("axios");

var now = new Date().toISOString();
// 16진수 64자의 랜덤 값 생성
var genRanHex = size =>
  [...Array(size)]
    .map(() => Math.floor(Math.random() * 16).toString(16))
    .join("");
var salt = genRanHex(64);
var message = now + salt;
var apiKey = "NCSOKP99RCNRTXNQ";
var apiSecret = "ONVJ1OY2LZ6WWWTOVJ14VUZJZ5YH73RH";
var signature = crypto.createHmac("sha256", apiSecret).update(message).digest("hex");

// 생성한 시그니처를 사용하여 API 호출
var uri = `https://api.coolsms.co.kr/messages/v4/list?limit=1`;
axios
  .get(uri, {
    headers: {
      Authorization: `HMAC-SHA256 apiKey=${apiKey}, date=${now}, salt=${salt}, signature=${signature}`
    }
  })
  .then(res => {
    console.log(res.data);
  })
  .catch(error => {
    console.log(error.response.data);
  });

</script>



<script>
function fillForm(mempnum) {
  document.getElementsByName("mempnum")[0].value = mempnum;
}
</script>


<body>

	<main class="main-wrapper" style="text-align: center !important;">
		<div class="left-section">

			<h1>문자 전송 페이지</h1>
			<form action="smssand" method="post">
				<div class="search">
					<select class="search-select" name="searchType">
						<option value="MEMID" name="MEMID">아이디 검색</option>
						<option value="MEMNAME" name="MEMNAME">이름 검색</option>
					</select> <input type="text" class="search-input" name="searchName" />
					<button type="submit" class="btn search-bnt">검색</button>
				</div>
			</form>




			전체 회원숫자 : ${mlist.size() }
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>

								<td>회원 ID</td>
								<td>회원 이름</td>
								<td>회원 연락처</td>
							</tr>
							<c:forEach items="${mlist }" var="dto">
								<tr>

									<td>${dto.memid }</td>
									<td>${dto.memname }</td>
									<td><a href="#" onclick="fillForm('${dto.mempnum}')">${dto.mempnum}</a></td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="right-section">


			<h1>문자 메시지</h1>
			<form action="/partners/send-one">
				<label for="recipient">수신자:</label> 
				<input type="text" name="mempnum" value="보내는 번호" />
				<br>
				<br> 
				<label for="smstext">메시지:</label>
				<textarea id="smstext" name="smstext">문자 내용.</textarea>
				<br>
				<br>

				<button type="submit">보내기</button>
			</form>


			<!-- 	<table border="1" style="margin-left: 35%">
						<tr>
							<td>보내는 번호</td>
							<td><input type="text" name="mempnum" value="보내는 번호" /></td>
						</tr>
						<tr>
							<td>문자 내용</td>
							<td><textarea name="smstext" rows="5">문자 내용.</textarea></td>
						</tr>

					</table>
						<input type="submit" value="전송" />

				</form> -->


		
		</div>
	</main>


	<br />
	<hr />

</body>
</html>