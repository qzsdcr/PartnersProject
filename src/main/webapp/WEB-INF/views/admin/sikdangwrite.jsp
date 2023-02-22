
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
</head>
<body>
	<h3>식당 상세페이지</h3>
	<form action="sikwrite" method="post">
		
		<table>

			<tr>
				<td class="left">사업자 번호</td>
				<td><input type="text" name="sikno" value="사업자 번호" /></td>
			</tr>
			<tr>
				<td class="left">지역</td>
				<td><input type="text" name="sikloca" value="활동지역 ex)구로,강남 등" /></td>
			</tr>
			<tr>
				<td class="left">식당이름</td>
				<td><input type="text" name="sikname" value="식당이름 ex)늘푸름식당 " /></td>
			</tr>
			<tr>
				<td class="left">식당소개</td>
				<td> <textarea name="sikcontent" rows="5">식당 소개 내용.</textarea> </td>
			</tr>
			<tr>
				<td class="left">식당주소</td>
				<td><input type="text" name="sikaddress" value="식당주소" /></td>
			</tr>
			<tr>
				<td class="left">상세주소</td>
				<td><input type="text" name="sikaddress2" value="상세주소" /></td>
			</tr>
			<tr>
				<td class="left">식당전화번호</td>
				<td><input type="text" name="siktel" value="전화번호" /></td>
			</tr>
			<tr>
				<td class="left">식당이미지</td>
				<td> <input type="file" name="file" /></td>
			</tr>

					<tr>
					<td colspan="2"><input type="submit" value="등록" />&nbsp;&nbsp;
					<a href="admin">목록</a> &nbsp;&nbsp;

			</tr>
		</table>
	</form>
	<hr></hr>
	
	
	
</body>
</html>