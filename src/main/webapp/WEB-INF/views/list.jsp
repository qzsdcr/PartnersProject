<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="resources/css/styles.css"/>
	
	
</head>
<body>

	<div style="text-align: right;">
		<a href="login">로그인</a>|<a href="#">회원가입</a>
	</div>

	<div class="jumbotron text-left" style="text-align: center">
		<div style="">
			<a href="#">식신</a> 
			<input type="text" name="sk" value="검색" /> 
			<input type="submit" value="검색" />
		</div>
	</div>
	<div class="container" style="text-align: center;">
		<div class="row">
			<div id="d1" class="col-xs-12 col-md-4">
				<a href="#">맛집 찾기</a>
			</div>
			<div id="d2" class="col-xs-12 col-md-4">
				<a href="#">테마</a>
			</div>
			<div id="d3" class="col-xs-12 col-md-4">
				<a href="#">마켓</a>
			</div>
		</div>
	</div>
	<hr />

	<div class="container">
		<div class="row">
			<div id="d11" class="col-xs-12 col-md-4">
				<a href="#">Menu1</a>
				<table width="300" border="1">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>날자</td>
						<td>히트</td>
					</tr>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.bid }</td>
							<td>${dto.bname }</td>
							<td><c:set value="${dto.bindent }" var="endindent" /> <c:forEach
									begin="1" end="${dto.bindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
										<img src="resources/img/icon_reply.gif" />[re]
				</c:if>
								</c:forEach> <a href="contentview?bid=${dto.bid }">${dto.btitle }</a></td>
							<td><fmt:formatDate value="${dto.bdate }"
									pattern="yyyy/MM/dd" /></td>
							<td>${dto.bhit }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><a href="writeview">글쓰기</a></td>
					</tr>
				</table>

			</div>

			<div id="d21" class="col-xs-12 col-md-4">
				<a href="#">Menu2</a>
				<table width="300" border="1">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>날자</td>
						<td>히트</td>
					</tr>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.bid }</td>
							<td>${dto.bname }</td>
							<td><c:set value="${dto.bindent }" var="endindent" /> <c:forEach
									begin="1" end="${dto.bindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
										<img src="resources/img/icon_reply.gif" />[re]
				</c:if>
								</c:forEach> <a href="contentview?bid=${dto.bid }">${dto.btitle }</a></td>
							<td><fmt:formatDate value="${dto.bdate }"
									pattern="yyyy/MM/dd" /></td>
							<td>${dto.bhit }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><a href="writeview">글쓰기</a></td>
					</tr>
				</table>
			</div>

			<div id="d21" class="col-xs-12 col-md-4">
				<a href="#">Menu3</a>
				<table width="300" border="1">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>날자</td>
						<td>히트</td>
					</tr>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.bid }</td>
							<td>${dto.bname }</td>
							<td><c:set value="${dto.bindent }" var="endindent" /> <c:forEach
									begin="1" end="${dto.bindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
										<img src="resources/img/icon_reply.gif" />[re]
				</c:if>
								</c:forEach> <a href="contentview?bid=${dto.bid }">${dto.btitle }</a></td>
							<td><fmt:formatDate value="${dto.bdate }"
									pattern="yyyy/MM/dd" /></td>
							<td>${dto.bhit }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><a href="writeview">글쓰기</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr />
		  <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $120.00 - $280.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

		
	
	<footer>
		<hr />
		<div id="copy" style="text-align: center">
			All contents Copyright 2011 ShopWeb Inc. all rights reserved<br>
			Contact mail : master@shoptech.com Tel: +82 64 123 4315 Fax +82 64
			123 4321
		</div>
		<div id="social" style="text-align: center">
			<img src="images/facebook.gif" width="33" height="33" alt="facebook">
			<img src="images/twitter.gif" width="34" height="33" alt="twitter">
		</div>
	</footer>








</body>
</html>