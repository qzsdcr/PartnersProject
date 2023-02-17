
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


	<!-- JS -->
	<script src="resources/assets/js/main.js"></script>
</body>
</html>