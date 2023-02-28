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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        <li><a href="masjib2">가산</a></li>
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
		style="margin: auto !important; width: 100%; height: 350px; ">
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
	
	// 주소로 좌표를 검색합니다
	//geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	geocoder.addressSearch('${content_view.sikaddress }', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${content_view.sikname }</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
	
	</div>
	
	상세페이지
   <style>
        #table {display: table; width: 100%;
        padding-bottom: 11px; padding-top:14px;}
            .row {
            display: table-row;}
            .cell {
            display: table-cell; padding: 3px; /* border-bottom: 1px solid #DDD; */}
            .col1 { 
            width: 20%;
            height: 150px;}
            .col2 {
            width:60%;
            height: 150px;
           	vertical-align: top;}

         
    </style>
<div id="table">
    <div class="row">
        <div class="cell col1"><img src="resources/upload/${content_view.filesrc}" width="300" height="300" alt=""></div>
        <div class="cell col2">
            <div>식당이름: ${content_view.sikname}</div>
            <div>별점</div>
            <div>식당내용: ${content_view.sikcontent}</div>
            <%-- <div>조회수: ${content_view.bhit }</div> --%>
            <div>주소: ${content_view.sikaddress}</div>
            <button type="button" onclick="location.href='/partners/calendar?sikno=${content_view.sikno}&sikname=${content_view.sikname}'">식단</button>
        </div>
    </div>
</div>
	</div>
	
	<!-- 리뷰 -->
	
<style>
.review{
border-bottom:1px dashed #666;
}
.container {
  /* border: 2px solid #ccc; */
  /* background-color: #eee; */
  /* border-radius: 5px; */
  
  padding: 16px;
  margin: 16px 0
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
}

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

.thumb_wrap {
	float: right;
}

.review-item clearfix{
	float: right;
}

.star_rating {
    font-size: 20px;
}
.star {
    color: gold;
    margin-right: 2px;
}

.heart-container {
	float: right;
	font-size: 30px;
}

.heart-container input{
	display: none;
}

.heart-container label {
	-webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: red; /* #FF0000 */
	cursor: pointer;
}

.heart-container :checked ~ label {
  -webkit-text-fill-color: red;
}

</style>

<button type="button" name="review" id="onReview">리뷰 작성</button>
<div class="sikdang-page-content" id="review">
	<div class="tab-content" style="width:100%;">
		<div class="tab-pane fade in active">
			<form id="review-form" class="reviews-form" role="form" style="display:none;">
				<h2>리뷰 작성</h2>
				<div class="form-group">
					<label for="username">
						이름
						<span class="require"></span>
					</label>
					<input type="text" class="form-control" id="username" value="작성자" readonly style="width:14%;">
				</div>
				
				<div class="star-rating">
					<input type="radio" id="5-stars" name="spoon" value="5" required="required" />  <!-- required 별점 선택 안하면 작성 안되게 막음 -->
					<label for="5-stars" class="star">&#9733;</label>
					<input type="radio" id="4-stars" name="spoon" value="4" />
					<label for="4-stars" class="star">&#9733;</label>
					<input type="radio" id="3-stars" name="spoon" value="3" />
					<label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="spoon" value="2" />
					<label for="2-stars" class="star">&#9733;</label>
					<input type="radio" id="1-star" name="spoon" value="1" />
					<label for="1-star" class="star">&#9733;</label>
				</div>

				<div class="form-group">
					<label for="review">리뷰</label>
					<textarea class="form-control" rows="8" id="reviewTxt" name="reviewcontent" style="word-break:break-all;width:100%;text-align:center;"></textarea>
				</div>
				<div class="form-group">
					<label for="file">파일첨부</label>
					<input type="file" name="file" id="file-input" />
				</div>
				<div class="padding-top-20" style="float: right">
					<!-- <button type="submit" class="btn btn-primary reviewBtn">작성하기</button> -->
					<input type="submit" value="작성하기" />
				</div>
			</form>
		</div>
	</div>
</div>
<br /><br />

<div class="review">
<div>리뷰</div>

<div class="container">
    <select id="sort">
        <option value="date">최신순</option>
        <option value="high">별점높은순</option>
        <option value="low">별점낮은순</option>
    </select>

    <ul class="review_list">
        <c:forEach items="${reviewList}" var="rdto">
            <li>
                <!-- 리뷰 출력 내용 -->
                <div id="reviewlist" class="container">
                <input type="hidden" name="reviewno" value="${rdto.reviewno }" />
					<div class="top_info">
						<span class="point_type" style="display: none;">
							<span class="star_mark" style="width: 100%">${rdto.spoon }</span>
						</span>
						
						<span class="star_rating">
			                <c:choose>
			                    <c:when test="${rdto.spoon == 1}">
			                        <span class="star">&#9733;</span>
			                    </c:when>
			                    <c:when test="${rdto.spoon == 2}">
			                        <span class="star">&#9733;</span><span class="star">&#9733;</span>
			                    </c:when>
			                    <c:when test="${rdto.spoon == 3}">
			                        <span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span>
			                    </c:when>
			                    <c:when test="${rdto.spoon == 4}">
			                        <span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span>
			                    </c:when>
			                    <c:when test="${rdto.spoon == 5}">
			                        <span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span><span class="star">&#9733;</span>
			                    </c:when>
			                </c:choose>
	            		</span>
						
						<span class="bar"> | </span>
						<span class="memno">${rdto.memno }</span>
						<span class="bar"> | </span>
						<span class="date">
							<fmt:formatDate value="${rdto.reviewdate }"
	                     	pattern="yyyy-MM-dd HH:mm:ss" />
	                     	<%-- ${rdto.reviewdate } --%>
						</span>
						<div class="heart-container">
							<input type="checkbox" id="${rdto.reviewno}_heart" name="reviewlike" ${localStorage.getItem(rdto.reviewno) == 'true' ? 'checked' : ''}>
							<label for="${rdto.reviewno}_heart">&#10084;</label>
							<div class="reviewlike_totcnt">${rdto.reviewlike }</div>
						</div>
					</div>
					<div class="review_tit_cont">
						<div class="tit_cont">
							<div class="tit_A">
								<p class="tit">${rdto.reviewtitle }</p>
							</div>
							<div class="cont">${rdto.reviewcontent }</div>
						</div>
						<div class="pto_thumb">
							<div class="thumb_wrap">
								<div class="review_file">
									<img src="resources/upload/${rdto.reviewfile }" alt="" />
								</div>
							</div>
						</div>
						<div class="review-item clearfix">
							<div class="reivew-item-content">
								<a href="#" class="reviewBTN del" onclick="deleteReview(${rdto.reviewno})">삭제</a>
								<a href="reviewupdate?reviewno=${rdto.reviewno }" class="reviewBTN mdf" id="mdf">수정</a>
								<a href="${rdto.reviewno }" class="reviewBTN mdfOk" id="mdfOk" style="display:none;">수정 완료</a>
							</div>
						</div>
					</div>
				</div>
            </li>
        </c:forEach>
    </ul>
</div>

</div>

<script>
//리뷰 작성 버튼 클릭시 리뷰 작성 폼 보여주거나 닫기
var flaut = false;
$("#onReview").on("click",function(e){
	if(flaut == true){
		$(".reviews-form").hide();
		$("#reviewTxt").val("");		
		flaut = false;
	}
	else{
	flaut = true;
	e.preventDefault();
	$(".reviews-form").show();
	}
});

//리뷰 작성 폼
$(document).ready(function() {
    // 파일 선택 시 미리보기
    $("#file-input").change(function() {
        var file = this.files[0];
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#image-preview").html("<img src='" + e.target.result + "' />");
        };
        reader.readAsDataURL(file);
    });

    // 리뷰 폼 제출 시 AJAX로 전송
    $("#review-form").submit(function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        if (confirm("해당 내용으로 리뷰를 작성하시겠습니까?")) {
	        $.ajax({
	            url: "reviewWrite",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	            	//location.reload(true);
	            	//location.href = "contentview?sikno="+15;
	            		
            		setTimeout(function() {
	                   	location.reload(true);
	                       //location.href = "contentview?sikno="+15;
	                   	}, 2000); // 2초 후에 페이지 이동
					
	            }
	        });
        }else {
			return;
		}
    });
});

//셀렉트 박스 이벤트 핸들러 등록
document.getElementById('sort').addEventListener('change', function() {
	// 현재 선택한 옵션의 값 가져오기
	var selectedValue = this.value;

	// 리뷰 목록을 담고 있는 ul 요소 선택
	var reviewList = document.querySelector('.review_list');

	// 리뷰 목록의 li 요소들을 배열로 저장
	var reviewItems = Array.from(reviewList.children);
	
	// 배열에 저장된 li 요소들을 선택한 값에 따라 정렬
	if (selectedValue === 'date') { //최신순
	  reviewItems.sort(function(a, b) {
	    var date1 = new Date(a.querySelector('.date').textContent);
	    var date2 = new Date(b.querySelector('.date').textContent);
	    return date2 - date1;
	  });
	} else if (selectedValue === 'high') { //별점높은순
	  reviewItems.sort(function(a, b) {
	    var rating1 = a.querySelector('.star_mark').textContent;
	    var rating2 = b.querySelector('.star_mark').textContent;
	    return rating2 - rating1;
	  });
	} else if (selectedValue === 'low') { //별점낮은순
	  reviewItems.sort(function(a, b) {
	    var rating1 = a.querySelector('.star_mark').textContent;
	    var rating2 = b.querySelector('.star_mark').textContent;
	    return rating1 - rating2;
	  });
	}
	
	// 정렬된 li 요소들을 다시 ul 요소에 추가
	
	for (var i = 0; i < reviewItems.length; i++) {
	  reviewList.appendChild(reviewItems[i]);
	}
});

$(document).ready(function() {
	// 하트 버튼 클릭 시 서버로 데이터 전송
	$('input[name="reviewlike"]').click(function() {
		var reviewno = $(this).closest('.container').find('input[name="reviewno"]').val();
		var reviewlike = $(this).is(':checked') ? true : false; // 체크 상태에 따라 좋아요 여부
		localStorage.setItem(reviewno, reviewlike); // Local Storage에 저장
		var totcntEl = $(this).closest('.heart-container').find('.reviewlike_totcnt');
		var totcnt = parseInt(totcntEl.text()) + (reviewlike ? +1 : -1); // 현재 좋아요 수
		totcntEl.text(totcnt); // 좋아요 수 업데이트
		$.ajax({
		  type: 'POST',
		  url: 'contentview',
		  data: {
		    'reviewno': reviewno,
		    'reviewlike': reviewlike ? +1 : 0
		  }
		});
		location.reload(); // 현재 페이지 새로고침
	});

	// 페이지 로드 시 Local Storage에서 하트 상태를 복원
	$('input[name="reviewlike"]').each(function() {
		var reviewno = $(this).closest('.container').find('input[name="reviewno"]').val();
		if (localStorage.getItem(reviewno) == 'true') {
		  $(this).prop('checked', true);
		}
	});
});

//리뷰 삭제
function deleteReview(reviewno) {
	if (confirm("삭제 하시겠습니까?")) {
	  $.ajax({
	    url: "reviewDelete",
	    type: "POST",
	    data: {
	      reviewno: reviewno
	    },
	    success: function() {
	      // 삭제 성공 시 처리할 내용
	      location.reload();
	    },
	    error: function(xhr, status, error) {
	      // 삭제 실패 시 처리할 내용
	      alert("삭제 실패: " + error);
	    }
	  });
	}
}

</script>

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