<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<style>
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

</style>

<body>

<h3>review 수정 페이지</h3>

<form id="review-form" class="reviews-form" role="form" action="reviewmodify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="reviewno" value="${review.reviewno}" />
	<h2>리뷰 작성</h2>
	<div class="form-group">
		<label for="username">
			작성자
			<span class="require"></span>
		</label>
		<input type="text" class="form-control" id="username" value="작성자아이디" readonly style="width:14%;">
	</div>
	
	<div class="star-rating">
	    <input type="radio" id="5-stars" name="spoon" value="5" ${review.spoon == 5 ? 'checked' : ''} />
	    <label for="5-stars" class="star">&#9733;</label>
	    <input type="radio" id="4-stars" name="spoon" value="4" ${review.spoon == 4 ? 'checked' : ''} />
	    <label for="4-stars" class="star">&#9733;</label>
	    <input type="radio" id="3-stars" name="spoon" value="3" ${review.spoon == 3 ? 'checked' : ''} />
	    <label for="3-stars" class="star">&#9733;</label>
	    <input type="radio" id="2-stars" name="spoon" value="2" ${review.spoon == 2 ? 'checked' : ''} />
	    <label for="2-stars" class="star">&#9733;</label>
	    <input type="radio" id="1-star" name="spoon" value="1" ${review.spoon == 1 ? 'checked' : ''} />
	    <label for="1-star" class="star">&#9733;</label>
	</div>
	
	<div class="form-group">
		<label for="review">리뷰</label>
		<textarea class="form-control" rows="8" id="reviewTxt" name="reviewcontent" style="word-break:break-all;width:100%;text-align:center;">${review.reviewcontent }</textarea>
	</div>
	<div class="form-group">
		<label for="file">파일첨부</label>
		<input type="file" name="file" id="file-input" />
		<div id="image-preview">
        	<img src="resources/upload/${review.reviewfile}" alt="review image" />
    	</div>
	</div>
	<div class="padding-top-20" style="float: right">
		<!-- <button type="submit" class="btn btn-primary reviewBtn">작성하기</button> -->
		<input type="submit" value="수정" />
	</div>
</form>

</body>

<script>
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
        if (confirm("해당 내용으로 리뷰를 수정하시겠습니까?")) {
        	var fileInput = $("#file-input")[0];
            if (fileInput.files.length == 0) {
                // 파일이 선택되지 않은 경우, 기존 파일 데이터를 폼 데이터에 추가
                formData.append("reviewfile", "${review.reviewfile}");
            }
	        $.ajax({
	            url: "reviewmodify",
	            type: "POST",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	            	//alert("해당 내용으로 리뷰를 작성하시겠습니까?");
	            	//location.reload(true);
	            	//location.href = "contentview?sikno="+15;
	            		
            		setTimeout(function() {
	                   	//location.reload(true);
	                    location.href = "contentview?sikno="+15;
	                   	}, 2000); // 2초 후에 페이지 이동
					
	            }
	        });
        }else {
			return;
		}
    });
});

</script>

</html>