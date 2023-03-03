<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles2.css" type="text/css"
	media="all" />
<script type="text/javascript" src="resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-func.js"></script>

</head>
<body>

	<!-- START PAGE SOURCE -->
	<div id="shell">
		<div id="header">
			<h1 id="logo">
				<a href="list">식신</a>
			</h1>
			<div class="social">
				<!-- <a class="social" href="login"><span>로그인</span></a> -->
				<c:if test="${empty loginCheck}">
					<a href="login"><span>로그인</span></a>
					<a href="joinform1"><span>회원가입</span></a>
				</c:if>
				<c:if test="${loginCheck eq '회원' || loginCheck eq '식당'}">
					<p>
						<span>${memid }님, 환영합니다!</span>
					</p>
					<a href="chat"><span>chat</span></a>
					<a href="userPage"><span>userPage</span></a>
					<a href="logout"><span>로그아웃</span></a>
				</c:if>
				<c:if test="${loginCheck eq '관리자'}">
					<p>
						<span>${memid }님, 환영합니다!</span>
					</p>

					<a href="admin"><span>admin list</span></a>
					<a href="chat"><span>chat</span></a>
					<a href="logout"><span>로그아웃</span></a>
					<a href="userPage"><span>userPage</span></a>
				</c:if>
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
					<li><a href="gasan?com=가산">가산</a></li>
					<li><a href="gulo?com=구로">구로</a></li>
					<li><a href="yeouido?com=여의도">여의도</a></li>
					<li><a href="gangnam?com=강남">강남</a></li>
					<li><a href="pangyo?com=판교">판교</a></li>
				</ul>

				<div id="search">
					<form action="list" method="post">
						<label for="search-field">SEARCH</label>
						<c:choose>
							<c:when test="${sikloca }">
								<input type="hidden" name="searchType" value="sikloca" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="searchType" value="sikloca" />
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${sikname }">
								<input type="hidden" name="searchType" value="sikname" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="searchType" value="sikname" />
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${searchVo.pageStart }"
							end="${searchVo.pageEnd }" var="i"></c:forEach>
						<input type="text" name="sk" value="${resk }" id="search-field"
							class="blink search-field" placeholder="지역 및 식당이름"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='지역 및 식당이름'" /> <input type="submit"
							value="GO!" class="search-button" />
					</form>
				</div>
			</div>
		</div>

		<div id="main">

			<div id="content">
				<div
					style="padding-bottom: 11px; padding-top: 14px; border-bottom: 1px dashed #666;">
					<div id="map"
						style="margin: auto !important; width: 100%; height: 350px;">
					</div>

					<!-- appkey=발급받은키&libraries=services -->
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=122bb8945d23b56b4408d423b4e5fd7d&libraries=services"></script>
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
		<c:forEach items="${gslist }" var="gasan">
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
						<p class="text-right">
							업체(${totRowcnt })
						</p>


					</div>
					<c:set var="gs" value="1" />
					<c:set var="gl" value="1" />
					<c:set var="ye" value="1" />
					<c:set var="gn" value="1" />
					<c:set var="pk" value="1" />
					<div id="m1">
						<c:forEach items="${gnlist }" var="dto" varStatus="status">
							<fmt:parseNumber var="gnGroupNum" value="${(gn+5)/6}"
								integerOnly="true" />
							<div class="cardBox">
								<div class="${gn%6 eq 0 ? 'movie last' : 'movie'} card"
									style="${gn >= 13 ? 'display:none;' : ''}"
									name='m4_${gnGroupNum }'>
									<div class="movie-image imageCard">
										<span class="play"><span class="name">파트너스</span></span> <img
											src="resources/upload/${dto.filesrc }" alt="" />
									</div>

									<div class="rating ratingCard"
										onclick="location.href ='contentview?sikno=${dto.sikno }'">
										
											<p>${dto.sikname }</p> 
											<span class="average-spoon-value">
												<fmt:formatNumber type="number" value="${dto.avg_spoon }"
													pattern="0.0" />
											</span> 
											<span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
												style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
												type="range" value="1" step="1" min="0" max="10">
											</span>

											<p>${dto.sikcontent }</p> 
									</div>

								</div>
							</div>
							<c:set var="gn" value="${gn+1 }" />

						</c:forEach>
					<c:if test="${gn >=13 }" />
					<div class="cl">&nbsp;</div>

					<form action="gangnam" method="post" style="text-align: center;">
						<c:if test="${searchVo.page>1 }">
							<a href="gangnam?page=1&com=강남">[처음]</a>
							<a href="gangnam?page=${searchVo.page-1 }&com=강남">[이전]</a>
						</c:if>
						<c:forEach begin="${searchVo.pageStart }"
							end="${searchVo.pageEnd }" var="i">
							<c:choose>
								<c:when test="${i eq searchVo.page }">
									<span style="color: red; font-weight: bold;">${i }&nbsp;</span>
								</c:when>
								<c:otherwise>
									<a
										href="gangnam?page=${i }&sikloca=${sikloca }&sikcon=${sikname }&sk=${resk }&com=강남"
										style="text-decoration: none">${i }&nbsp;</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:if test="${searchVo.page<searchVo.totPage }">
							<a href="gangnam?page=${searchVo.page+1 }&com=강남">[다음]</a>
							<a href="gangnam?page=${searchVo.totPage }&com=강남">[마지막]</a>
						</c:if>
					</form>

				</div>

			</div>
		</div>


		<div>
			<div id="footer">
				<p class="lf">
					Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights
					Reserved
				</p>
				<p class="rf">
					<a href="http://all-free-download.com/free-website-templates/">Free
						CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a>
				</p>
				<div style="clear: both;"></div>
			</div>
		</div>
	</div>
	</div>
	<!-- END PAGE SOURCE -->
	<div align=center>
		This template downloaded form <a
			href='http://all-free-download.com/free-website-templates/'>free
			website templates</a>
	</div>
</body>
</html>