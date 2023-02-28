
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Single+Day&display=swap"
	rel="stylesheet">

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
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<!-- JS -->
<script src="resources/assets/js/main.js"></script>
<body>


	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<form class="form-inline">
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
				</form>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
					<!-- <li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> Dropdown - Messages
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search">
								<div class="input-group">
									<input type="text" class="form-control bg-light border-0 small"
										placeholder="c for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li> -->
					<li class="nav-item dropdown no-arrow d-sm-none">
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search">
								<div class="input-group">
									<input type="text" class="form-control bg-light border-0 small"
										placeholder="c for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div> <a class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a>
					</li>


					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>
						<p class="mb-4">
							회원 목록이다.<a target="_blank" href="https://google.com">구글이나
								가고싶다</a>.
						<form action="member#memberchart" method="post"
							style="display: flex; flex-flow: row nowrap; justify-content: flex-start; align-items: center;">


							<select class="search-select" name="searchType">
								<option value="MEMID" name="MEMID">아이디 검색</option>
								<option value="MEMNAME" name="MEMNAME">이름 검색</option>
							</select> <input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2" name="searchName" />


							<button type="submit" class="btn btn-primary" type="button">
								<ion-icon name="search-outline"></ion-icon>
							</button>


						</form>
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
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
										</thead>
										<tfoot>
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
										</tfoot>
										<tbody>
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
													<td><fmt:formatDate value="${dto.memjoindate}"
															pattern="yyyy-MM-dd" /></td>
													<td>${dto.memadmin }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<!-- /.container-fluid -->
		</div>
		<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

</body>
</html>