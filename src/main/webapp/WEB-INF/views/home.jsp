<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String path=request.getContextPath();
System.out.print("path : "+path);

%>
<html>
<head>
	<title>Home</title>
</head>
<body>

<c:if test="${empty loginCheck}">
  <a href="login">로그인</a>
  <a href="joinform1">회원가입</a>
</c:if>


<hr />

<h2>PARTNERS 홈페이지에 오신걸 환영합니다.</h2>

로그인 ID : ${loginId } <br />
ID 권한 : ${loginCheck}

<!-- 로그인 후, 권한 별 메뉴 이동 -->
<c:if test="${loginCheck eq '회원' || loginCheck eq '식당'}">
  <p>${loginId }님, 환영합니다!</p> <br />
  <a href="list?loginId=${loginId}&loginCheck=${loginCheck}">listttttttt go</a> <br />
  <a href="chat?loginId=${loginId}&loginCheck=${loginCheck}">chat</a> <br />
  <a href="userPage?loginId=${loginId}&loginCheck=${loginCheck}">userPage</a>
  <a href="logout">로그아웃</a>
</c:if>

<!-- 관리자 권한이 있는 경우에 보여줄 내용 -->
<c:if test="${loginCheck eq '관리자'}">
  <p>${loginId }님, 환영합니다!</p> <br />
  <a href="list?loginId=${loginId}&loginCheck=${loginCheck}">listttttttt go</a> <br />
  <a href="chat?loginId=${loginId}&loginCheck=${loginCheck}">chat</a> <br />
  <a href="admin?loginId=${loginId}&loginCheck=${loginCheck}">admin list</a> <br />
  <a href="userPage?loginId=${loginId}&loginCheck=${loginCheck}">userPage</a> <br />
  <a href="logout">로그아웃</a>
</c:if>

<!-- 로그인 실패 시에 보여줄 내용 -->
<c:if test="${empty loginCheck}">
  <p>로그인이 필요한 서비스입니다. <a href="login">로그인</a>을 해주세요.</p>
</c:if>

<hr />
<P> The time on the server is ${serverTime}. </P>

</body>



</html>
