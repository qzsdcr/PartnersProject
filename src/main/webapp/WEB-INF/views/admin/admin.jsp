
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
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
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

<style>
.chart-area {
  width: 100%;
  height: 100%;
}
.chart-pie {
  position: relative; /* canvas가 상대적으로 위치 지정될 수 있도록 설정 */
  width: 300px; /* canvas의 기본 너비 */
  height: 300px; /* canvas의 기본 높이 */
}

.chart-pie canvas {
  position: absolute; /* canvas가 상대적으로 위치 지정될 수 있도록 설정 */
  width: 100%; /* 부모 요소에 맞게 너비 지정 */
  height: 100%; /* 부모 요소에 맞게 높이 지정 */
  top: 0; /* canvas가 상단에 위치하도록 설정 */
  left: 0; /* canvas가 좌측에 위치하도록 설정 */
}

</style>
<body>
	<!-- Main Content -->
	<div id="content">


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
				<a href="#"
					class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
					class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										총 방문자 </div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">400명</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										게시물 등록수 (주)</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">409,000건</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-info text-uppercase mb-1">홈페이지 완성도
									</div>
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">70%</div>
										</div>
										<div class="col">
											<div class="progress progress-sm mr-2">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 70%" aria-valuenow="50" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-xs font-weight-bold text-warning text-uppercase mb-1">
										오늘 방문자수 </div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">18명</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Content Row -->

			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">방문자 증가</h6>

						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="Chart_visit"></canvas>
							</div>
						</div>
						
					</div>
				</div>
			

				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">회원 구성</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							
								<canvas id="Chart1"></canvas>
						
						
						</div>
					</div>
				</div>
			</div>

		
			

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
	
		<!-- chart 구현부분 -->
				<script type="text/javascript">
				const Chart2 = document.getElementById('Chart_visit').getContext('2d');
				
				
				const mixedChart  = new Chart(Chart_visit, {
				    data: {
				        datasets: [{
				            type: 'bar',
				            label: '전날 대비 증가 감소',
				            data: [2, 1, -4, 6, 2, 3, 4] ,
				            backgroundColor : [
								'rgba(41, 238, 151,1.0)',
						
								],
							borderWidth : 1,
							hoverBorderWidth : 1
				        }, {
				            type: 'line',
				            label: '주간 접속자 수',
				            data: [15, 16, 12, 18, 20, 23, 27],
				            backgroundColor :['rgba(255,0,50,1.0)']
				        }],
				        labels: ['월요일', '화요일','수요일','목요일','금요일','토요일','일요일',],
				       
				    },
				    options:  {
						scales : {
							y : {
								beginAtZero : true,
							},
						},
				    plugins: {
				        beforeUpdate: function(chart) {
				          chart.data.datasets.forEach(function(dataset) {
				            dataset.backgroundColor = dataset.data.map(function(value) {
				              return value < 0 ? 'rgba(255, 0, 0, 1.0)' : 'rgba(41, 238, 151,1.0)';
				            });
				          });
				        },
				      },
				    
				    },
				});
				
				
				const Chart1 = document.getElementById('Chart1').getContext('2d');
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

			</script>
</body>
</html>