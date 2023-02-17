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

<a href="login">로그인</a>
<a href="joinform1">회원가입</a>

<hr />

<h2>PARTNERS 홈페이지에 오신걸 환영합니다.</h2>



<hr />
<P>  The time on the server is ${serverTime}. </P>
<a href="list">listttttttt go</a> <br />
<a href="admin">admin list</a> <br />
<a href="chat">chat</a> <br />
<a href="menu">menulist</a> <br />
</body>



</html>
