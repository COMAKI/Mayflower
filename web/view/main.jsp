<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

header {
	margin: 0 auto;
	width: 800px;
	height: 150px;
	background: red;
	position: relative;
}

section {
	margin: 0 auto;
	width: 800px;
	min-height: 400px;
	background: gray;
}

footer {
	margin: 0 auto;
	width: 800px;
	height: 80px;
	background: black;
}

header>#top_menu {
	position: absolute;
	top: 0;
	right: 0;
	list-style: none
}

header>#top_menu>li {
	float: left;
}

header>#top_menu>li>a {
	margin: 2px;
	font-size: 110%;
	font-weight: bold;
}

header>#top_menu>li>a:hover {
	color: white;
	background: black;
}

header>#main_menu {
	position: absolute;
	left: 80px;
	bottom: 0;
	list-style: none
}

header>#main_menu>li {
	float: left;
	padding-right: 5px;
}

header>#main_menu>li>a {
	font-size: 150%;
	font-weight: bold;
	padding: 0 10px;
}

header>#main_menu>li>a:hover {
	color: white;
	background: black;
}

section {
	height: 100%;
	width:100%;
}

@media ( max-width : 767px) {
	.search-box {
		max-width: 100%;
	}
}

@media ( min-width : 768px) {
	.search-box {
		max-width: 500px !important;
	}
}
</style>
<script></script>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">MayWeather</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<form class="form-inline input-group mt-2 mt-md-0 ml-auto search-box">
				<input class="form-control mr-sm-2 rounded" type="text"
					placeholder="지역, 관공서  검색" aria-label="Search">
				<button
					class="btn btn-outline-success my-2 my-sm-0 float-sm-left input-group-append"
					type="submit">Search</button>
			</form>
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					data-toggle="modal" data-target="#myModal">LOGIN <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					data-toggle="modal" data-target="#myModal">REGISTER <span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Username</label> <input
								type="text" class="form-control" id="usrname"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="text" class="form-control" id="psw"
								placeholder="Enter password">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>Remember
								me</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Not a member? <a href="#">Sign Up</a>
					</p>
					<p>
						Forgot <a href="#">Password?</a>
					</p>
				</div>
			</div>
			<!-- Modal content end -->
		</div>
	</div>
	<!-- Modal end -->

	<c:choose>
			<c:when test="${center != null }">
				<jsp:include page="${center }.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="center.jsp" />
			</c:otherwise>
	</c:choose>

</body>
</html>
