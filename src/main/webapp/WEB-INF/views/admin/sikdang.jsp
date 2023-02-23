
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

<body>
<script type="text/javascript">

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('bid');
	  
	 
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}



</script>	
	

	<div style="overflow-x: hidden; width: 80%; height: 95%; margin-left: 150px">
	<h1 id="sikdang">관리자 페이지</h1>
		<form action="sikdang" method="post">
			<div class="search">
				<select class="search-select" name="searchType2">
					<option value="SIKNO" name="SIKNO">사업자 번호 검색</option>
					<option value="SIKNAME" name="SIKNAME">식당 이름 검색</option>
				</select> <input type="text" class="search-input" name="searchName2" />
				<button type="submit" class="btn search-bnt">검색</button>
			</div>
		</form>
		
		
		<div >
			<table border="1">
				<tr>
				
					<td><input id="allCheck" type="checkbox" name="bid" onclick='selectAll(this)'/></td>
					<td>사업자 번호</td>
					<td>지역</td>
					<td>식당이름</td>
					<td>식당소개</td>
					<td>식당주소</td>
					<td>식당전화번호</td>
					<td>등록날짜</td>
					<td>식당조회수</td>
					<td>영업일</td>
				</tr>
				<form action="sikdemultidelete">
				<c:forEach items="${list }" var="i">
					<tr>
						<td style="text-align: center;"><input name="bid" type="checkbox" value="${i.sikno }"/></td>
						<td><a href="sikdeview?bid=${i.sikno }">${i.sikno }</a></td>
						<td>${i.sikloca }</td>
						<td><a href="sikdeview?bid=${i.sikno }">${i.sikname }</a></td>
						<td>${i.sikcontent }</td>
						<td>${i.sikaddress }</td>
						<td>${i.siktel }</td>
						<td>${i.sikdate }</td>
						<td>${i.sikhit }</td>
						<td>${i.sikopenclose }</td>
					</tr>
				</c:forEach>
					
					<input type="submit" value="삭제" />
					
				</form>
					<a href="sikdangwrite"><button>식당등록</button></a>
			</table>
			

		</div>
 	 </div>
	</div>
	
	<div style="overflow-x: hidden; width: 80%; height: 95%; margin-left: 150px">
	<h1 id="sikdang">리뷰 관리 </h1>
		<form action="review" method="post">
			<div class="search">
				<select class="search-select" name="searchType2">
					<option value="MEMID" name="MEMID">작성자 아이디</option>
					<option value="reviewcontent" name="reviewcontent">리뷰 내용</option>
				</select> <input type="text" class="search-input" name="searchName2" />
				<button type="submit" class="btn search-bnt">검색</button>
			</div>
		</form>
		
		
		<div >
			<table border="1">
				<tr>
				
					<td><input id="allCheck" type="checkbox" name="bid" onclick='selectAll(this)'/></td>
					<td>리뷰번호</td>
					<td>리뷰제목</td>
					<td>리뷰내용</td>
					<td>작성자 아이디</td>
					<td>좋아요</td>
					<td>스푼</td>
					
				</tr>
				<form action="sikdemultidelete">
				<c:forEach items="${relist }" var="i">
					<tr>
						<td style="text-align: center;"><input name="bid" type="checkbox" value="${i.reviewno }"/></td>
						<td>${i.reviewtitle }</td>
						<td>${i.reviewcontent }</td>
						<td>${i.memid }</td>
						<td>${i.reviewlike }</td>
						<td>${i.spoon }</td>
						
					</tr>
				</c:forEach>
					
					<input type="submit" value="삭제" />
					
				</form>
				
			</table>
			

		</div>
 	 </div>
	</div>
</body>
</html>