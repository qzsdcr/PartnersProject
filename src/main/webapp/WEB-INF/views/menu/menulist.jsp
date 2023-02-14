<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h3>메뉴리스트</h3>
	<table width="500" border="1">
		<tr>
			<td>식단날짜</td>
			<td>식단</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><fmt:formatDate value="${dto.menudate}"
						pattern="yyyy/MM/dd" /></td>
				<td>${dto.menulist}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="writeview">글쓰기</a></td>
		</tr>
	</table>
	totCnt : ${totRowcnt }
	<br /> 현재페이지/토탈페이지 : ${searchVo.page }/${searchVo.totPage }
	<br />
	<hr />
	<form action="list" method="post">

		<c:if test="${searchVo.page>1 }">
			<a href="list?page=1">[처음]</a>
			<a href="list?page=${searchVo.page-1 }">[이전]</a>
		</c:if>

		<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }"
			var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page }">
					<span style="color: red; font-weight: bold">${i }&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="list?page=${i }" style="text-decoration: none">${i }&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${searchVo.page < searchVo.totPage }">
			<a href="list?page=${searchVo.page+1 }">[다음]</a>
			<a href="list?page=${searchVo.totPage }">[마지막]</a>
		</c:if>

		<div>
			<c:choose>
				<c:when test="${btitle }">
					<input type="checkbox" name="searchType" value="btitle" checked />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="btitle" />
				</c:otherwise>
			</c:choose>
			제목
			<c:choose>
				<c:when test="${bcontent }">
					<input type="checkbox" name="searchType" value="bcontent" checked /> 내용
                            </c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="bcontent" /> 내용
                            </c:otherwise>
			</c:choose>

			<input type="text" name="sk" value="${resk }" /> <input
				type="submit" value="검색" />

		</div>

	</form>
</body>

</html>