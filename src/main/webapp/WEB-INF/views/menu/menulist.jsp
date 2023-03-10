<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>

<body>
	<h3>메뉴리스트</h3>
	<table width="500" border="1">
		<tr>
			<td>식단날짜</td>
			<td>식단</td>
			<td>식당</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><fmt:formatDate value="${dto.menudate}"
						pattern="yyyy/MM/dd" /></td>
				<td><a
					href="menucontentview?menuid=${dto.menuid}&sikno=${dto.sikno}">${dto.menulist}</a></td>
				<!-- 식단 -->
				
				<td>${dto.sikname}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="menuwriteview">식단 업로드</a></td>
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
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>
