
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
<body>

	<div
		style="overflow-x: hidden; width: 80%; height: 95%; margin-left: 150px; font-family: 'Noto Sans KR', sans-serif;">
		<p id="memberchart">
		<h1>회원 관리 페이지</h1>
		<form action="admin#memberchart" method="post">
			<div class="search">
				<select class="search-select" name="searchType">
					<option value="MEMID" name="MEMID">아이디 검색</option>
					<option value="MEMNAME" name="MEMNAME">이름 검색</option>
				</select> <input type="text" class="search-input" name="searchName" />
				<button type="submit" class="btn search-bnt">검색</button>
			</div>
		</form>



		전체 회원숫자 : ${mlist.size() }
		<table width="1200" border="1">
			<tr>
				<td>회원번호</td>
				<td>회원 ID</td>
				<td>회원 PASS</td>
				<td>회원 이름</td>
				<td>회원 나이</td>
				<td>회원 성별</td>
				<td>회원 이메일</td>
				<td>회원 연락처</td>
				<td>회원 지역</td>
				<td>회원 선호메뉴</td>
				<td>회원 가입일</td>
				<td>회원 등급</td>
			</tr>
			<c:forEach items="${mlist }" var="dto">
				<tr>
					<td><a href="memberview?bid=${dto.memno }">${dto.memno }</a></td>
					<td>${dto.memid }</td>
					<td>${dto.mempass }</td>
					<td>${dto.memname }</td>
					<td>${dto.membirth }</td>
					<td>${dto.memsex }</td>
					<td>${dto.mememail }</td>
					<td>${dto.mempnum }</td>
					<td>${dto.memaddress }</td>
					<td>${dto.memlikemenu }</td>
					<td>
					<fmt:formatDate value="${dto.memjoindate}"
							pattern="yyyy-MM-dd" />
							</td>
					<td>${dto.memadmin }</td>
				</tr>
			</c:forEach>
		</table>
		</p>
	</div>


</body>
</html>