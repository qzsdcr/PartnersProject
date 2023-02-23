<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userPage</title>
</head>
<body>

로그인 체크 : ${loginCheck} <br />
로그인 ID : ${loginId }

<input type="hidden" name="loginCheck" id="loginCheck" value="${loginCheck}">
<input type="hidden" name="loginId" id="loginId" value="${loginId}">


</body>
</html>