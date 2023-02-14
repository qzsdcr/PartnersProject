<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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