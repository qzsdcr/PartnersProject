
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
	<h3>memberview</h3>
	<form action="membermodify" method="post">
		<input type="hidden" name="bid" value="${member_view.memno }" />
		<table>


			<tr>
				<td class="left">회원 등급 번호</td>
				<td>${member_view.memadmin }</td>
				<%-- <td><input type="number" name="memadmin" value="${member_view.memadmin }" /></td> --%>
			</tr>
			<tr>
				<td class="left">회원 등급 선택</td>
				<td><input type="radio" id="user" name="memadmin" value="회원">
					<label for="0">회원</label> <input type="radio" id="user"
					name="memadmin" value="식당"> <label for="1">식당</label> <input
					type="radio" id="user" name="memadmin" value="관리자"> <label
					for="2">관리자</label></td>

			</tr>
			<tr>
				<td class="left">번호</td>
				<td>${member_view.memno }</td>
			</tr>
			<tr>
				<td class="left">아이디</td>
				<td>${member_view.memid }</td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td>${member_view.memname }</td>
			</tr>
			<tr>
				<td class="left">나이</td>
				<td>${member_view.membirth }</td>
			</tr>
			<tr>
				<td class="left">성별</td>
				<td>${member_view.memsex }</td>
			</tr>
			<tr>
				<td class="left">이메일</td>
				<td>${member_view.mememail }</td>
			</tr>
			<%-- <tr>
		<td class="left">첨부</td>
		<td>
			<a href="download?p=resources/upload/&f=${member_view.filesrc }
			&bid=${member_view.bid }">${member_view.filesrc }</a>
		</td>
	</tr> --%>
	
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" />&nbsp;&nbsp;
					<a href="admin">목록</a> &nbsp;&nbsp; 
					<a href="memberdelete?bid=${member_view.memno }">삭제</a> &nbsp;&nbsp;
				</td>

			</tr>
		</table>
	</form>
	<hr></hr>
	<%-- 	<img src="resources/upload/${member_view.filesrc }" alt="" /> --%>
</body>
</html>