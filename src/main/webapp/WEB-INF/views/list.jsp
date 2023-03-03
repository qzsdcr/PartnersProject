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
-->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script 
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	 -->

<link rel="stylesheet" href="resources/css/styles2.css" type="text/css"
	media="all" />


<script type="text/javascript" src="resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-func.js"></script>
<script type="text/javascript">
	function showPageMore(name) {

		var displayedDivCount = $("#" + name).find(".movie").filter(
				function(x) {
					return $(this).css('display') != 'none';
				}).length / 6;

		$("[name='" + name + "_" + (displayedDivCount + 1) + "']").css(
				'display', 'block');

		var undisplayedDivCount = $("#" + name).find(".movie").filter(
				function(x) {
					return $(this).css('display') == 'none';
				}).length;

		if (undisplayedDivCount == 0) {
			$("[name='" + name + "_moreBtn']").css('display', 'none');
		}

	}

	$(document).ready(function() {
		$.ajax({
			url : "./VisitCount",
			type : "GET",
			dataType : "json",
			success : function(data) {
				// 성공적으로 데이터를 받았을 때 수행할 코드
				var todayCount = data.todayVisitorCount; //오늘 방문자
				var totalCount = data.totalVisitorCount; //총 방문자
				$("#today-count").text(todayCount);
				$("#total-count").text(totalCount);
			},
			error : function(xhr, status, error) {
				// 오류 발생시 수행할 코드
				console.log("Error : " + error);
			}
		});
	});
</script>




</head>
<body>
	<!-- START PAGE SOURCE -->
	<div id="shell">
		<div id="header">
			<h1 id="logo">
				<a href="list">식신</a>
			</h1>
			<!-- 방문자 수 -->

			<div class="social">
				오늘 방문자 수: <span id="today-count"></span><br /> 총 방문자 수: <span
					id="total-count"></span><br /> ID 권한 : ${sessionScope.loginCheck}
				<br />

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
					<li><a href="#m1">가산</a></li>
					<li><a href="#m2">구로</a></li>
					<li><a href="#m3">여의도</a></li>
					<li><a href="#m4">강남</a></li>
					<li><a href="#m5">판교</a></li>

				</ul>
				<div id="search">
					<form action="searchpage" method="post">
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
				<div class="box">
					<div class="head">
						<h2>가산</h2>

						<p class="text-right">
							<a href="gasan?com=가산">모두보기</a>
						</p>
					</div>
					<c:set var="gs" value="1" />
					<c:set var="gl" value="1" />
					<c:set var="ye" value="1" />
					<c:set var="gn" value="1" />
					<c:set var="pk" value="1" />
					<div id="m1">
						<c:forEach items="${gslist }" var="dto" varStatus="status">
							<fmt:parseNumber var="gsGroupNum" value="${(gs+5)/6}"
								integerOnly="true" />
							<div class="cardBox">
								<div class="${gs%6 eq 0 ? 'movie last' : 'movie'} card"
									style="${gs >= 13 ? 'display:none;' : ''}"
									name='m1_${gsGroupNum }'>
									<div class="movie-image imageCard">
										<span class="play"><span class="name">파트너스</span></span> <img
											src="resources/upload/${dto.filesrc }" alt="" />
									</div>

									<div class="rating ratingCard"
										onclick="location.href ='contentview?sikno=${dto.sikno }'">

										<p>${dto.sikname }</p>
										<span class="average-spoon-value"> <fmt:formatNumber
												type="number" value="${dto.avg_spoon }" pattern="0.0" />
										</span> <span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
											style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
											type="range" value="1" step="1" min="0" max="10">
										</span>

										<p>${dto.sikcontent }</p>
									</div>

								</div>
							</div>
							<c:set var="gs" value="${gs+1 }" />

						</c:forEach>
						<c:if test="${gs >=13 }">
							<div class="morebtn">
								<input type="button" name="m1_moreBtn"
									onclick="showPageMore('m1');" value="더보기">
							</div>
						</c:if>
					</div>
					<div class="cl">&nbsp;</div>

				</div>

				<div class="box">
					<div class="head">
						<h2>구로</h2>
						<p class="text-right">
							<a href="gulo?com=구로">모두보기</a>
						</p>
					</div>
					<div id="m2">
						<c:forEach items="${gllist }" var="dto" varStatus="status">
							<fmt:parseNumber var="glGroupNum" value="${(gl+5)/6}"
								integerOnly="true" />
							<div class="cardBox">
								<div class="${gl%6 eq 0 ? 'movie last' : 'movie'} card"
									style="${gl >= 13 ? 'display:none;' : ''}"
									name='m2_${glGroupNum }'>
									<div class="movie-image imageCard">
										<span class="play"><span class="name">파트너스</span></span> <img
											src="resources/upload/${dto.filesrc }" alt="" />
									</div>

									<div class="rating ratingCard"
										onclick="location.href ='contentview?sikno=${dto.sikno }'">

										<p>${dto.sikname }</p>
										<span class="average-spoon-value"> <fmt:formatNumber
												type="number" value="${dto.avg_spoon }" pattern="0.0" />
										</span> <span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
											style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
											type="range" value="1" step="1" min="0" max="10">
										</span>

										<p>${dto.sikcontent }</p>

									</div>

								</div>
							</div>
							<c:set var="gl" value="${gl+1 }" />

						</c:forEach>
						<c:if test="${gl >=13 }">
							<div class="morebtn">
								<input type="button" name="m2_moreBtn"
									onclick="showPageMore('m2');" value="더보기">
							</div>
						</c:if>
					</div>
					<div class="cl">&nbsp;</div>

				</div>

				<div class="box">
					<div class="head">
						<h2>여의도</h2>
						<p class="text-right">
							<a href="yeouido?com=여의도">모두보기</a>
						</p>
					</div>
					<div id="m3">
						<c:forEach items="${yelist }" var="dto" varStatus="status">
							<fmt:parseNumber var="gsGroupNum" value="${(gl+5)/6}"
								integerOnly="true" />
							<div class="cardBox">
								<div class="${ye%6 eq 0 ? 'movie last' : 'movie'} card"
									style="${ye >= 13 ? 'display:none;' : ''}"
									name='m3_${yeGroupNum }'>
									<div class="movie-image imageCard">
										<span class="play"><span class="name">파트너스</span></span> <img
											src="resources/upload/${dto.filesrc }" alt="" />
									</div>

									<div class="rating ratingCard"
										onclick="location.href ='contentview?sikno=${dto.sikno }'">

										<p>${dto.sikname }</p>
										<span class="average-spoon-value"> <fmt:formatNumber
												type="number" value="${dto.avg_spoon }" pattern="0.0" />
										</span> <span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
											style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
											type="range" value="1" step="1" min="0" max="10">
										</span>
										<p>${dto.sikcontent }</p>

									</div>

								</div>
							</div>
							<c:set var="ye" value="${ye+1 }" />

						</c:forEach>
						<c:if test="${ye >=13 }">
							<!-- 이런식으로 하면 돼 할 수 있겠음? -->
							<div class="morebtn">
								<input type="button" name="m3_moreBtn"
									onclick="showPageMore('m3');" value="더보기">
							</div>
						</c:if>
					</div>
					<div class="cl">&nbsp;</div>
				</div>

				<div class="box">
					<div class="head">
						<h2>강남</h2>
						<p class="text-right">
							<a href="gangnam?com=강남">모두보기</a>
						</p>
					</div>
					<div id="m4">
						<c:forEach items="${gnlist }" var="dto" varStatus="status">
							<fmt:parseNumber var="gnGroupNum" value="${(gl+5)/6}"
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
										<span class="average-spoon-value"> <fmt:formatNumber
												type="number" value="${dto.avg_spoon }" pattern="0.0" />
										</span> <span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
											style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
											type="range" value="1" step="1" min="0" max="10">
										</span>
										<p>${dto.sikcontent }</p>

									</div>

								</div>
							</div>
							<c:set var="gn" value="${gn+1 }" />

						</c:forEach>
						<c:if test="${gn >=13 }">
							<div class="morebtn">
								<input type="button" name="m4_moreBtn"
									onclick="showPageMore('m4');" value="더보기">
							</div>
						</c:if>
					</div>
					<div class="cl">&nbsp;</div>
				</div>

				<div class="box">
					<div class="head">
						<h2>판교</h2>
						<p class="text-right">
							<a href="pangyo?com=판교">모두보기</a>
						</p>
					</div>
					<div id="m5"></div>
					<c:forEach items="${pklist }" var="dto" varStatus="status">
						<fmt:parseNumber var="pkGroupNum" value="${(pk+5)/6}"
							integerOnly="true" />
						<div class="cardBox">
							<div class="${pk%6 eq 0 ? 'movie last' : 'movie'} card"
								style="${pk >= 13 ? 'display:none;' : ''}"
								name='m5_${pkGroupNum }'>
								<div class="movie-image imageCard">
									<span class="play"><span class="name">파트너스</span></span> <img
										src="resources/upload/${dto.filesrc }" alt="" />
								</div>

								<div class="rating ratingCard"
									onclick="location.href ='contentview?sikno=${dto.sikno }'">

									<p>${dto.sikname }</p>
									<span class="average-spoon-value"> <fmt:formatNumber
											type="number" value="${dto.avg_spoon }" pattern="0.0" />
									</span> <span class="star_mark"> ☆☆☆☆☆ <span id="star_mark2"
										style="width: ${dto.avg_spoon*20}%;">★★★★★</span> <input
										type="range" value="1" step="1" min="0" max="10">
									</span>
									<p>${dto.sikcontent }</p>

								</div>

							</div>
						</div>
						<c:set var="pk" value="${pk+1 }" />

					</c:forEach>
					<c:if test="${pk >=13 }">
						<div class="morebtn">
							<input type="button" name="m5_moreBtn"
								onclick="showPageMore('m5');" value="더보기">
						</div>
					</c:if>
					<div class="cl">&nbsp;</div>

				</div>
			</div>
		</div>





		<div id="footer">
			<p class="lf">
				Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved
			</p>
			<p class="rf">
				<a href="http://all-free-download.com/free-website-templates/">Free
					CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a>
			</p>
			<div style="clear: both;"></div>
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