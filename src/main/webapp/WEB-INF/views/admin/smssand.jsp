
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Insert title here</title>
</head>
<!-- CSS -->
<link rel="stylesheet" href="resources/assets/css/styles.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- chart js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<!-- JS -->
	<script src="resources/assets/js/main.js"></script>
<link rel="stylesheet" href="resources/css/nstyle.css" />


<script type="text/javascript">
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




<body>




sms 발송을합니다.



</body>
</html>