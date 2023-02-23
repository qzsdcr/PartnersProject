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
	<h3>menucontentupdate</h3>
<form action="menumodify" method="post" enctype="multipart/form-data">
<input type="hidden" name="menuid" value="${menucontent_view.menuid}" />
<input type="hidden" name="sikno" value="${menucontent_view.sikno}" />
		<table>
			<tr>
				<td class="left">번호</td>
				<td>${menucontent_view.menuid}</td>
			</tr>

			<tr>
				<td class="left">식단</td>
				<td><input type="text" name="menulist" value="${menucontent_view.menulist}" /></td>
			</tr>
			<tr>
				<td class="left">식단날짜</td>
				<td><input type="date" name="menudate" value=value="${menucontent_view.menudate} /></td>
			</tr>
			<tr>
				<td class="left">식단사진</td>
				<td><input type="file" name="file" value="${menucontent_view.menufilesrc}"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력" /> <a
					href="menulist">목록</a></td>
			</tr>
		</table>
	</form>
</body>
</html>