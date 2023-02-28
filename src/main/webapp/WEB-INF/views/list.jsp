<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css"/> -->

<link rel="stylesheet" href="resources/css/styles2.css" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-func.js"></script>	
	
</head>
<body>
<!-- START PAGE SOURCE -->
<div id="shell">
  <div id="header">
    <h1 id="logo"><a href="list2">식신</a></h1>
    <div><a class="social" href="login"><span>로그인</span></a> 
   </div>
    <div id="navigation">
      <ul>
        <li><a class="active" href="#">맛집찾기</a></li>
        <li><a href="#">테마</a></li>
        <li><a href="review">리뷰</a></li>

      </ul>
    </div>
    <div id="sub-navigation">
      <ul>
        <li><a href="#m1">가산</a></li>
        <li><a href="#m2">구로</a></li>
        <li><a href="#m3">여의도</a></li>
        <li><a href="#m4">강남</a></li>
        <li><a href="#m5">판교</a></li>
        
      </ul>
      <div id="search">
        <form action="#" method="get" accept-charset="utf-8">
          <label for="search-field">SEARCH</label>
          <input type="text" name="search field" value="Enter search here" id="search-field" class="blink search-field"  />
          <input type="submit" value="GO!" class="search-button" />
        </form>
      </div>
    </div>
  </div>
  <div id="main">
    <div id="content">
      <div class="box">
        <div class="head">
          <h2>가산</h2>
          <p class="text-right"><a href="gasan">모두보기</a></p>
        </div>
        <c:forEach items="${list }" var="dto" varStatus="status">
        	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m1" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
        	<div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="contentview?sikno=${dto.sikno }&sikname=${dto.sikname }"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	          </div>
	          
	          <div class="rating">
	            <p>${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> </div>
	        </div>
	      </c:forEach>
        <div class="cl">&nbsp;</div>
      </div>
      
      <div class="box">
        <div class="head">
          <h2>구로</h2>
          <p class="text-right"><a href="gulo">모두보기</a></p>
        </div>
         <c:forEach items="${list }" var="dto" varStatus="status">
         	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m2" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
	          <div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="#"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	          </div>
	          <div class="rating">
	            <p>${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> </div>
	        </div>
	      </c:forEach>
        <div class="cl">&nbsp;</div>
      </div>
      
      <div class="box">
        <div class="head">
          <h2>여의도</h2>
          <p class="text-right"><a href="yeouido">모두보기</a></p>
        </div>
         <c:forEach items="${list }" var="dto" varStatus="status">
         	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m3" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
	          <div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="#"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	          </div>
	          <div class="rating">
	            <p>${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> </div>
	        </div>
	      </c:forEach>
        <div class="cl">&nbsp;</div>
      </div>
      
      <div class="box">
        <div class="head">
          <h2>강남</h2>
          <p class="text-right"><a href="gangnam">모두보기</a></p>
        </div>
         <c:forEach items="${list }" var="dto" varStatus="status">
         	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m4" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
	          <div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="#"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	          </div>
	          <div class="rating">
	            <p>${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> </div>
	        </div>
	      </c:forEach>
        <div class="cl">&nbsp;</div>
      </div>
      
      <div class="box">
        <div class="head">
          <h2>판교</h2>
          <p class="text-right"><a href="pangyo">모두보기</a></p>
        </div>
         <c:forEach items="${list }" var="dto" varStatus="status">
         	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m5" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
	          <div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="#"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	          </div>
	          <div class="rating">
	            <p>${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> </div>
	        </div>
	      </c:forEach>
        <div class="cl">&nbsp;</div>
      </div>
        
       </div>
    </div>
    
    
<!--     <style>
	div { display:none; }
	</style> -->
	<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<a href="#" id="load">더 보기</a>

<!-- <script>
$(function(){
    $("div").slice(0, 1).show(); // 초기갯수
    $("#load").click(function(e){ // 클릭시 more
        e.preventDefault();
        $("div:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
        if($("div:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
        }
    });
});
</script> -->
    
    
    
    
    
    
    
    
    
    
  <div id="footer">
    <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
    <p class="rf"><a href="http://all-free-download.com/free-website-templates/">Free CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a></p>
    <div style="clear:both;"></div>
  </div>
</div>
<!-- END PAGE SOURCE -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>