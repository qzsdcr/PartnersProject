<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
	<h2>회원 탈퇴</h2>
	<form action="userDelete" method="post">
		<p><strong>아이디:</strong> ${member.memid}</p>
		<p><strong>비밀번호:</strong> <input type="password" name="mempass" required></p>
		<p><strong>이름:</strong> ${member.memname}</p>
		<p><strong>성별:</strong> ${member.memsex}</p>
		<p><strong>생년월일:</strong> ${member.membirth}</p>
		<p><strong>휴대폰 번호:</strong> ${member.mempnum}</p>
		<p><strong>이메일:</strong> ${member.mememail}</p>
		<p><strong>주소:</strong> ${member.memaddress}</p>
		<p><strong>좋아하는 메뉴:</strong> ${member.memlikemenu}</p>
		<button type="submit">회원 탈퇴</button>
	</form>
</body>
</html>