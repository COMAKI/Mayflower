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
<script src="js/state.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

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

section {
	height: 100%;
	width: 100%;
}

</style>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">MayFlower</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<form class="form-inline input-group mt-2 mt-md-0 ml-auto search-box">
				<input id="searchbox0122" class="form-control mr-sm-2 rounded"
					type="text" placeholder="Find the nearest washroom"
					aria-label="Search">
				<button id="searchmap"
					class="btn btn-outline-success my-2 my-sm-0 float-sm-left input-group-append"
					type="submit">Search</button>
			</form>

			<jsp:include page="navbar_state.jsp" />
		</div>
	</nav>

	<!-- Login start -->
	<jsp:include page="modal_login.jsp" />
	<jsp:include page="modal_reguser.jsp" />
	<jsp:include page="modal_reguserwelcome.jsp" />
	<jsp:include page="modal_policy.jsp" />
	<jsp:include page="modal_myinfo.jsp" />
	<jsp:include page="modal_comments.jsp" />
	<jsp:include page="modal_regcomment.jsp" />
	<jsp:include page="modal_status.jsp" />
	
	<!-- Map center -->
	<jsp:include page="center.jsp" />
	
</body>
</html>
