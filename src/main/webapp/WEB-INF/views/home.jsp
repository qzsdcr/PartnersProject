<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<%
String path=request.getContextPath();
System.out.print("path : "+path);
%>

<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
    $.ajax({
        url: "./VisitCount",
        type: "GET",
        dataType: "json",
        success: function(data) {
            // 성공적으로 데이터를 받았을 때 수행할 코드
            var todayCount = data.todayVisitorCount; //오늘 방문자
            var totalCount = data.totalVisitorCount; //총 방문자
            $("#today-count").text(todayCount);
            $("#total-count").text(totalCount);
        },
        error: function(xhr, status, error) {
            // 오류 발생시 수행할 코드
            console.log("Error : " + error);
        }
    });
});
</script>


<c:if test="${empty loginCheck}">
  <a href="login">로그인</a>
  <a href="joinform1">회원가입</a>
</c:if>


<hr />

<h2>PARTNERS 홈페이지에 오신걸 환영합니다.</h2>

<!-- 방문자 수 -->
오늘 방문자 수: <span id="today-count"></span><br />
총 방문자 수: <span id="total-count"></span><br />

로그인 ID : ${sessionScope.memid} <br />
ID 권한 : ${sessionScope.loginCheck} <br />


<!-- 로그인 후, 권한 별 메뉴 이동 -->
<c:if test="${loginCheck eq '회원' || loginCheck eq '식당'}">
  <p>${memid }님, 환영합니다!</p> <br />
  <a href="list">listttttttt go</a> <br />
  <a href="chat">chat</a> <br />
  <form action="/chat">
  	<input type="hidden" value="${sessionScope.memid} " />
  	
  </form>
  <a href="userPage">userPage</a>
  <a href="logout">로그아웃</a>
</c:if>

<!-- 관리자 권한이 있는 경우에 보여줄 내용 -->
<c:if test="${loginCheck eq '관리자'}">
  <p>${memid }님, 환영합니다!</p> <br />
  <a href="list">listttttttt go</a> <br />
  <a href="chat">chat</a> <br />
  <a href="admin">admin list</a> <br />
  <a href="userPage">userPage</a> <br />
  <a href="logout">로그아웃</a>
</c:if>

<!-- 로그인 실패 시에 보여줄 내용 -->
<c:if test="${empty loginCheck}">
  <p>로그인이 필요한 서비스입니다. <a href="login">로그인</a>을 해주세요.</p>
</c:if>

<hr />
</body>



</html>
