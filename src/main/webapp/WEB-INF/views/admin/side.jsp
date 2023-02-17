
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
					
					<a href="/partners/sikdang" class="nav__link"> 
					<ion-icon name="storefront-outline" class="nav__icon"></ion-icon>  
					<span class="nav_name">Store</span>
					</a> 
					
					<a href="/partners/memberchart" class="nav__link"> 
					<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon> 
					<span class="nav_name">Analytics</span> 
					</a> 
					
					<a href="/partners/member" class="nav__link"> 
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
</body>
</html>