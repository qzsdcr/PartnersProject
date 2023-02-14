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