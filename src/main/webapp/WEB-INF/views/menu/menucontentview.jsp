<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Content View</title>
<link rel="stylesheet" href="resources/css/nstyle.css" />
</head>
<body>
<h3>Menu Content View</h3>
<form action="menucontentupdate" method="post">
<input type="hidden" name="menuid" value="${menucontent_view.menuid}" />
<input type="hidden" name="sikno" value="${menucontent_view.sikno}" />
<table>
	<tr>
		<td class="left">번호</td>
		<td>${menucontent_view.menuid}</td>
	</tr>
<tr>
	<td class="left" pattern="yyyy-MM-dd" >식단날짜</td>
	<td><fmt:formatDate value="${menucontent_view.menudate}" pattern="yyyy-MM-dd" /></td>
</tr>
	<tr>
		<td class="left">메뉴리스트</td>
		<td>${menucontent_view.menulist}</td>
	</tr>
	<tr>
		<td class="left">첨부</td>
		<td>
			<a href="download?p=resources/upload/&f=${menucontent_view.menufilesrc}&bid=${menucontent_view.menuid}">
			${menucontent_view.menufilesrc}</a>
		</td>
	</tr>
 	<tr>
		<td colspan="2">
			<input type="submit" value="수정폼으로" />&nbsp;&nbsp;
			<a href="menulist">목록</a> &nbsp;&nbsp;
			<a href="menudelete?menuid=${menucontent_view.menuid}">삭제</a> &nbsp;&nbsp;
		</td>
	</tr> 
</table>
</form>
<hr></hr>
<img src="resources/upload/${menucontent_view.menufilesrc}" alt="" />
</body>
</html>