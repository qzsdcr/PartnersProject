<%-- 
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
	
	
	
<script type="text/javascript">

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('bid');
	  
	 
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}



</script>	
	
	

<body id="body-pd">
	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">파트너스</a>
				</div>
				<div class="nav__list">

					<a href="/partners" class="nav__link active"> 
					<ion-icon	name="home-outline" class="nav__icon"> </ion-icon> 
					<span class="nav_name">홈으로</span>
					</a> 
					
					<a href="#sikdang" class="nav__link"> 
					<ion-icon name="storefront-outline" class="nav__icon"></ion-icon>  
					<span class="nav_name">Store</span>
					</a> 
					
					<a href="#chart" class="nav__link"> 
					<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon> 
					<span class="nav_name">Analytics</span> 
					</a> 
					
					<a href="#memberchart" class="nav__link"> 
					<ion-icon name="people-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">Team</span></a> <a href="#" class="nav__link"> <ion-icon
							name="settings-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">Settings</span>
					</a>
				</div>
				<a href="#" class="nav__link"> <ion-icon name="log-out-outline"
						class="nav__icon"></ion-icon> <span class="nav_name">Logout</span>
				</a>
			</div>
		</nav>
	</div>

	<div style="overflow-x: hidden; width: 80%; height: 95%; margin-left: 150px">
	<h1 id="sikdang">관리자 페이지</h1>
		<form action="admin#sikdang" method="post">
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

			</table>


		</div>
 	 </div>
	</div>

<hr />

	<p id="chart">
	<h3>통계</h3>
	<div class="container">
		<div class="row">

			<div class="col-md-4">
				<canvas id="Chart1" width="400" height="400"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="Chart2" width="400" height="400"></canvas>
			</div>


		</div>
		<div class="row">
			<div class="col-md-4">
				<canvas id="Chart3" width="400" height="400"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="Chart4" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	</p>



	<!-- chart 구현부분 -->
	<script type="text/javascript">
	
 	    const Chart1 = document.getElementById('Chart1').getContext('2d');
		const Chart2 = document.getElementById('Chart2').getContext('2d');
		const Chart3 = document.getElementById('Chart3').getContext('2d');
		const Chart4 = document.getElementById('Chart4').getContext('2d');

		
		const barChartone = new Chart(Chart1, {
			type : 'doughnut',
			data : {
				labels : [
					<c:forEach var="list" items="${clist }">
					
					'<c:out value="${list.lv}"/>',
					
					</c:forEach>
				],
				datasets : [ {
					label : 'My First Dataset',
					data : [ 	<c:forEach var="list" items="${clist }">
					
					<c:out value="${list.sum}"/>,
					
					</c:forEach> ],
					backgroundColor : [ 'rgb(226, 238, 41)',
							'rgb(41, 226, 238)', 'rgb(41, 128, 238)' ],
					hoverOffset : 4
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});
		
		const barChartTwo = new Chart(Chart2, {
			type : 'bar',
			data : {
				labels : [ 	
					<c:forEach var="siklist" items="${sikdangchartlist }">
				
				'<c:out value="${siklist.sikname}"/>',
				
				</c:forEach> ],
				datasets : [ {
					label : '가게 조회수 TOP 3 ',
					data : [ 
						<c:forEach var="siklist" items="${sikdangchartlist }">
					
					<c:out value="${siklist.sikhit}"/>,
					
					</c:forEach> 
					],
					backgroundColor : [ 
						'rgba(41, 238, 151,1.0)',
						'rgba(41, 238, 53, 0.8)', 
						'rgba(127, 238, 41, 0.6)'
						 ],
					borderColor : [
						'rgba(41, 238, 151,1.0)',
						'rgba(41, 238, 53, 0.8)', 
						'rgba(127, 238, 41, 0.6)' ],
					borderWidth : 1,
					hoverBorderWidth : 1

				} ]
			},
			options : {
				indexAxis: 'y'
			}
		});
		const barChartThree = new Chart(Chart3, {
		    type: 'doughnut',
		    data:  {
		    	  labels: [
		    		    'Red',
		    		    'Blue',
		    		    'Yellow'
		    		  ],
		    		  datasets: [{
		    		    label: 'My First Dataset',
		    		    data: [300, 50, 100],
		    		    backgroundColor: [
		    		      'rgb(255, 99, 132)',
		    		      'rgb(54, 162, 235)',
		    		      'rgb(255, 205, 86)'
		    		    ],
		    		    hoverOffset: 4
		    		  }]
		    		},
		    options: {
		      scales: {
		        y: {
		          beginAtZero: true
		        }
		      }
		    }
		  });
		const barChart4 = new Chart(Chart4, {
			type : 'bar',
			data : {
				labels : [
					<c:forEach var="list" items="${clist }">
					
					'<c:out value="${list.lv}"/>',
					
					</c:forEach>
				],
				datasets : [ {
					label : 'My First Dataset',
					data : [ 	<c:forEach var="list" items="${clist }">
					
					<c:out value="${list.sum}"/>,
					
					</c:forEach> ],
					backgroundColor : [ 'rgb(255, 99, 132)',
							'rgb(54, 162, 235)', 'rgb(255, 205, 86)' ],
					hoverOffset : 4
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

	</script>

	<br />
	<hr />

	<div
		style="overflow-x: hidden; width: 80%; height: 95%; margin-left: 150px">
		<p id="memberchart">
	<h1>회원 관리 페이지</h1>
		<form action="admin#memberchart" method="post">
			<div class="search">
				<select class="search-select" name="searchType">
					<option value="MEMID" name="MEMID">아이디 검색</option>
					<option value="MEMNAME" name="MEMNAME">이름 검색</option>
				</select> <input type="text" class="search-input" name="searchName" />
				<button type="submit" class="btn search-bnt">검색</button>
			</div>
		</form>

		
	
		전체 회원숫자 : ${mlist.size() }
		<table width="1200" border="1">
			<tr>
				<td>회원번호</td>
				<td>회원 ID</td>
				<td>회원 PASS</td>
				<td>회원 이름</td>
				<td>회원 나이</td>
				<td>회원 성별</td>
				<td>회원 이메일</td>
				<td>회원 연락처</td>
				<td>회원 지역</td>
				<td>회원 선호메뉴</td>
				<td>회원 가입일</td>
				<td>회원 등급</td>
			</tr>
			<c:forEach items="${mlist }" var="dto">
				<tr>
					<td><a href="memberview?bid=${dto.memno }">${dto.memno }</a></td>
					<td>${dto.memid }</td>
					<td>${dto.mempass }</td>
					<td>${dto.memname }</td>
					<td>${dto.membirth }</td>
					<td>${dto.memsex }</td>
					<td>${dto.mememail }</td>
					<td>${dto.mempnum }</td>
					<td>${dto.memaddress }</td>
					<td>${dto.memlikemenu }</td>
					<td>${dto.memjoindate }</td>
					<td>${dto.memadmin }</td>
				</tr>
			</c:forEach>
		</table>
		</p>
	</div>





	<footer>
		<hr />
		<div id="copy" style="text-align: center">
			All contents Copyright 2011 ShopWeb Inc. all rights reserved<br>
			Contact mail : master@shoptech.com Tel: +82 64 123 4315 Fax +82 64
			123 4321
		</div>
		<div id="social" style="text-align: center">
			<!-- <img src="images/facebook.gif" width="33" height="33" alt="facebook">
			<img src="images/twitter.gif" width="34" height="33" alt="twitter"> -->
		</div>
	</footer>

	<!-- JS -->
	<script src="resources/assets/js/main.js"></script>


</body>
</html> --%>