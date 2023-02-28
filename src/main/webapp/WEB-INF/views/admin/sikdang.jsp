
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
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

<!-- JS -->
<script src="resources/assets/js/main.js"></script>

<body>
	<script type="text/javascript">

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('bid');
	  
	 
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}



</script>
	<script>
  $(document).ready(function(){
    var visibleCount = 10; // 초기에 보여지는 게시물 수
    var incrementCount = 10; // 한번에 추가되는 게시물 수
    var $table = $('#myTable');
    var $rows = $table.find('tr:gt(0)'); // 첫 번째 row는 제외
    $rows.slice(visibleCount).hide(); // 초기 visibleCount 이후 row들 숨김

    $('#loadMore').click(function(e){
      e.preventDefault();
      var visibleRows = $rows.filter(':visible').length;
      $rows.slice(visibleRows, visibleRows + incrementCount).show();
      if($rows.filter(':visible').length == $rows.length) {
        $('#loadMore').hide(); // 모든 row들이 보이게 되면 더보기 버튼 숨김
      }
    });
  });
</script>
	<script>
$(document).ready(function() {
  var numToShow = 10; // 보여줄 리뷰 수
  var numVisible = 10; // 현재 보여지고 있는 리뷰 수
  var numRows = $('.review-list tr').length; // 총 리뷰 수

  // 더보기 버튼 클릭 시
  $('#loadMoreButton').click(function() {
    numVisible += numToShow;
    $('.review-list tr').slice(numVisible, numVisible + numToShow).show();
    // 모든 리뷰를 로드한 경우 더보기 버튼 숨기기
    if (numVisible >= numRows) {
      $('.load-more-row').hide();
    }
  });

  // 초기에는 numToShow 만큼의 리뷰만 보여주기
  $('.review-list tr').slice(numToShow).hide();
});
</script>
<style>
button{
border: 0; outline: 0; background-color: white;
}
</style>
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">
<!-- Begin Page Content -->
					<div class="container-fluid">

			
					<h1 id="sikdang">관리자 페이지</h1>
					<form action="sikdang" method="post">
					
							<select class="search-select" name="searchType2">
								<option value="SIKNO" name="SIKNO">사업자 번호 검색</option>
								<option value="SIKNAME" name="SIKNAME">식당 이름 검색</option>
							</select> <input type="text" class="search-input" name="searchName2" />
							<button type="submit" class="btn search-bnt">검색</button>
						
					</form>


<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">회원 관리</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="myTable" width="80%"
										cellspacing="0">
				
							<tr>

								<td><input id="allCheck" type="checkbox" name="bid"
									onclick='selectAll(this)' /></td>
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
								<a href="sikdangwrite"><img src="resources/css/icon/addition.png" alt="" style="width: 40px;" /></a>
								<button type="submit"><img src="resources/css/icon/minus.png" alt="" style="width: 40px;" /></button> 
								<c:forEach items="${list }" var="i">
									<tr>
										<td style="text-align: center;"><input name="bid"
											type="checkbox" value="${i.sikno }" /></td>
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

								

							</form>
						</table>
						
						<button id="loadMore"><img src="resources/css/icon/more.png" alt="" style="width: 40px;" /></button>

					</div>
				</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

</body>
</html>