
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
	<form action="sikdemodify" method="post">
		<input type="hidden" name="bid" value="${sikdang.sikno }" />
		<table>


			<tr>
				<td class="left">영업일</td>
				<td>${sikdang.sikopenclose }</td>
			</tr>

			<tr>
				<td class="left">영업중 선택</td>
				<td>
					<input type="radio" name="sikopenclose" value="영업중">
					<label for="영업중">영업중</label> 
					<input type="radio"	name="sikopenclose" value="휴업중"> 
					<label for="휴업중">휴업중</label>
				</td>

			</tr>


			<tr>
				<td class="left">사업자 번호</td>
				<td>${sikdang.sikno }</td>
			</tr>
			<tr>
				<td class="left">지역</td>
				<td>${sikdang.sikloca }</td>
			</tr>
			<tr>
				<td class="left">식당이름</td>
				<td>${sikdang.sikname }</td>
			</tr>
			<tr>
				<td class="left">식당소개</td>
				<td>${sikdang.sikcontent }</td>
			</tr>
			<tr>
				<td class="left">식당주소</td>
				<td>${sikdang.sikaddress }</td>
			</tr>
			<tr>
				<td class="left">식당전화번호</td>
				<td>${sikdang.siktel }</td>
			</tr>
			<tr>
				<td class="left">등록날짜</td>
				<td>${sikdang.sikdate }</td>
			</tr>
			<tr>
				<td class="left">식당조회수</td>
				<td>${sikdang.sikhit }</td>
			</tr>


			<%-- <tr>
		<td class="left">첨부</td>
		<td>
			<a href="download?p=resources/upload/&f=${member_view.filesrc }
			&bid=${member_view.bid }">${member_view.filesrc }</a>
		</td>
	</tr> --%>

			<tr>
				<td colspan="2"><input type="submit" value="수정" />&nbsp;&nbsp;
					<a href="admin">목록</a> &nbsp;&nbsp; <a
					href="sikdedelete?bid=${sikdang.sikno }">삭제</a> &nbsp;&nbsp;</td>

			</tr>
		</table>
	</form>
	<hr></hr>
	<%-- 	<img src="resources/upload/${member_view.filesrc }" alt="" /> --%>
</body>
</html>