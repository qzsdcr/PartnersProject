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
	<h3>menu writeview</h3>
	<form action="menuwrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="left">식단</td>
				<td><input type="text" name="menulist"/></td>
			</tr>
			<tr>
				<td class="left">식단날짜</td>
				<td><input type="date" name="menudate"/></td>
			</tr>
			<tr>
				<td class="left">사진</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="입력" /> 	
				<a href="menulist">목록</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>