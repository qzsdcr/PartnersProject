<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles2.css" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-func.js"></script>

</head>
<body>
<!-- START PAGE SOURCE -->
<div id="shell">
  <div id="header">
    <h1 id="logo"><a href="list">식신</a></h1>
    <div><a class="social" href="login"><span>로그인</span></a> 
   </div>
    <div id="navigation">
      <ul>
        <li><a class="active" href="#">맛집찾기</a></li>
        <li><a href="#">테마</a></li>
        <li><a href="#">리뷰</a></li>

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
    <div style="padding-bottom: 11px; padding-top:14px; border-bottom: 1px dashed #666;">
        <div id="map"
		style="margin: auto !important; width: 100%; 
		height: 350px; ">
		</div>
	
	<!-- appkey=발급받은키&libraries=services -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=122bb8945d23b56b4408d423b4e5fd7d&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var positions = [
		<c:forEach items="${list }" var="gasan">
    	{
    		title: '<c:out value="${gasan.sikname }"/>',
    		address: '<c:out value="${gasan.sikaddress }"/>'
    	},
		</c:forEach>
    ];
	
    
    /* var positions = [
    	{
   	      title: '구트아카데미',
   	      address: '서울특별시 구로구 시흥대로 163길 33'
   	    },
   	    {
   	      title: '구로디지털단지역',
   	      address: '서울특별시 구로구 도림천로 477'
   	    }
    ]; */
    
 	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    var bounds = new kakao.maps.LatLngBounds(); //추가한 코드
	
	positions.forEach(function (position) {	
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(position.address, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		  	if (status === kakao.maps.services.Status.OK) {
		
		    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        marker.setMap(map); //추가한 코드
		        
		     	// LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(coords); //추가한 코드, 현재 코드에서 좌표정보는 point[i]가 아닌 coords이다.
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+position.title+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        //map.setCenter(coords);
		        setBounds(); //추가한 코드
		    } 
		});
		
	});
    
	function setBounds() { //추가한 함수
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
	    
	</script>
	
	</div>
      <div class="box">
        <div class="head">
            <h2>추천맛집</h2>
          <p class="text-right" ><a href="writeview">업체등록</a></p>
          
        </div>
        
        <c:forEach items="${list }" var="dto" varStatus="status">
        	<input type=hidden id="sika" value="${dto.sikaddress }" />
        	<fmt:formatNumber value="${status.count}" type="number" var="numberType" />
        	<div id="m1" class="${numberType%6 eq 0 ? 'movie last' : 'movie'}">
        	<div class="movie-image"> 
	          <span class="play"><span class="name">파트너스</span></span> 
	          <a href="contentview?sikno=${dto.sikno }"><img src="resources/upload/${dto.filesrc }" alt="" /></a> 
	        </div>
	          
	          <div class="rating">
	            <p id="sikn">${dto.sikname }</p>
	            <div class="stars">
	              <div class="stars-in"> </div>
	            </div>
	            <span class="comments">12</span> 
	            </div>
	        </div>
	      </c:forEach>
	       <%--    totCnt : ${totRowcnt } <br />
현재페이지/토탈페이지 : ${searchVo.page }/${searchVo.totPage } <br /> --%>

	
        <div class="cl">&nbsp;</div>
        <form action="gasan" method="post" style="text-align: center;">
	<c:if test="${searchVo.page>1 }">
		<a href="gasan?page=1">[처음]</a>
		<a href="gasan?page=${searchVo.page-1 }">[이전]</a>
	</c:if>
	
	<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVo.page }">
				<span style="color: red; font-weight: bold;">${i }&nbsp;</span>
			</c:when>
			<c:otherwise>
			<a href="gasan?page=${i }" style="text-decoration:none">${i }&nbsp;</a>
			</c:otherwise>
		</c:choose> 
	
	</c:forEach>
	<c:if test="${searchVo.page<searchVo.totPage }">
		<a href="gasan?page=${searchVo.page+1 }">[다음]</a>
		<a href="gasan?page=${searchVo.totPage }">[마지막]</a>
	</c:if>
	</form>
      </div>
	
      </div>
    </div>

	
	<div>
  <div id="footer">
    <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
    <p class="rf"><a href="http://all-free-download.com/free-website-templates/">Free CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a></p>
    <div style="clear:both;"></div>
  	</div>
</div>
</div>
<!-- END PAGE SOURCE -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>