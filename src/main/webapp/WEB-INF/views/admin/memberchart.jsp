
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
	
	
	


<hr />

	<p id="chart">
	<h3>통계</h3>
	<div class="container">
		<div class="row row-cols-2">

			<div class="col">
				<canvas id="Chart1" width="400" height="400"></canvas>
			</div>
			<div class="col">
				<canvas id="Chart2" width="400" height="400"></canvas>
			</div>

			<div class="col-12" id="chart-bar">
				<canvas id="Chart3" width="1500" height="600"></canvas>
			</div>
			
		
	</div>
	</p>



	<!-- chart 구현부분 -->
	<script type="text/javascript">
	
 	    const Chart1 = document.getElementById('Chart1').getContext('2d');
		const Chart2 = document.getElementById('Chart2').getContext('2d');
		const Chart3 = document.getElementById('Chart3').getContext('2d');

		
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
		const mixedChart  = new Chart(Chart3, {
		    data: {
		        datasets: [{
		            type: 'bar',
		            label: '전날 대비 증가 감소',
		            data: [2, 1, -4, 6, 2, 3, 4] ,
		            backgroundColor : [
						'rgba(41, 238, 151,1.0)',
					/* 	'rgba(41, 238, 53, 0.8)', 
						'rgba(150, 200, 99, 0.6)', 
						'rgba(180, 200, 88, 0.6)', 
						'rgba(200, 200, 77, 0.6)', 
						'rgba(220, 200, 66, 0.6)', 
						'rgba(240, 200, 55, 0.6)',  */
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
		
		

	</script>

	<br />
	<hr />


	<!-- JS -->
	<script src="resources/assets/js/main.js"></script>
</body>
</html>