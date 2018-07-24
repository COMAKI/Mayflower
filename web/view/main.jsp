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

section {
	height: 100%;
	width: 100%;
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}

.modal {
	overflow-y: auto;
}

.modal-body-my {
	border-top: 1px solid gray;
}


@media ( max-width : 767px) {
	.search-box {
		max-width: 100%;
	}
	.modal-box-my{
		width:100%;
	}
	.modal-column-my{
		width:100%;
		margin:0;
	}
	.modal-column-my-a{
		height:300px;
		margin-bottom:30px;
	} 	
	.modal-column-my-b{
		height:500px;
	} 	
}

@media ( min-width : 768px) {
	.search-box {
		max-width: 500px !important;
	}
	.modal-box-my{
		width:80%;
	}
	.modal-column-my{
		width:100%;
	}
	.modal-column-my-a{
		width:30%;
		height:600px;
		margin:0;
	}
	.modal-column-my-b{
		width:60%;
		margin-left:10%;
		height:600px;
	} 	 	
	
}
</style>
<script>

$(document).ready(()=>{
	/* let innerHtmlRegister = $('#Register .modal-body').html();
	$('.nav-link[data-target=#Register]').click(()=>{
		console.log('nav-link');
		$('#Register .modal-body').html(innerHtmlRegister);			
	});  */
	$('#user-register').submit((e)=>{
		console.log('user-register start');
	    var email = $('input[name=joinEmail]').val();   
		var name = $('input[name=joinName]').val();
		var phone = $('input[name=joinPhone]').val();
		var pwd = $('input[name=joinPwd]').val();
		var repwd = $('input[name=joinPwdRe]').val();
		if (pwd !== repwd) return;
		$.ajax({
			url: 'userregisteraction.mw',
			method: 'POST',
			data: {
				'email':email,
				'name': name,
				'phone':phone,
				'pwd':pwd
			},
			success: (data)=>{
				console.log(data);
				var str = '';
				str += '<h3><b>' + data[0].name +'</b>님, 가입하신 것을 환영합니다. </h3>';
				str += '<h4>아래와 같은 내용으로 가입하셨습니다.</h4>';
				str += '<h5>로그인 ID: '+data[0].email+'</h5>';
				str += '<h5>휴대폰 번호: '+data[0].phone+'</h5>';
				str += '<h5>가입 날짜: '+data[0].regdate+'</h5>';
				$('#Register .modal-body').html(
					str
				);
			},
			error: (err)=>{
				alert(err);
			},
			dataType: 'json'
	    });
	    e.preventDefault(); // avoid to execute the actual submit of the form.
	});
	$('#user-login').submit((e)=>{
		console.log('user-login start');
		var email = $('#loginEmail').val();
		var pwd = $('#loginPwd').val();
		$.ajax({
			url: 'loginaction.mw',
			method: 'POST',
			data:{
				'email':email,
				'pwd':pwd
			},
			success: (data)=>{
	            $("#Login").modal('hide');
	            location.href="main.mw";
			},
			error: (err)=>{
				console.log(err);
				alert('error');
			},
			dataType:'json'							
		});
		e.preventDefault(); // avoid to execute the actual submit of the form.
	});
});
</script>
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
				<input id="searchbox0122" class="form-control mr-sm-2 rounded"
					type="text" placeholder="Find the nearest washroom"
					aria-label="Search">
				<button id="searchmap"
					class="btn btn-outline-success my-2 my-sm-0 float-sm-left input-group-append"
					type="submit">Search</button>
			</form>

			<ul class="navbar-nav">
			<c:choose>
				<c:when test="${loginid == null }">
						<li class="nav-item active"><a class="nav-link"
							data-toggle="modal" data-target="#Login">LOGIN <span
								class="sr-only">(current)</span></a></li>
						<li class="nav-item active"><a class="nav-link"
							data-toggle="modal" data-target="#Register">REGISTER <span
								class="sr-only">(current)</span></a></li>
				</c:when>
				<c:otherwise>
						<li class="nav-item active"><a href="#" class="nav-link"
							data-toggle="modal" data-target="#MyInfo">
								${loginid } <span class="sr-only">(current)</span>
						</a></li> 
						<li class="nav-item active"><a href="logout.mw" class="nav-link">
								LOGOUT <span class="sr-only">(current)</span>
						</a></li> 
				</c:otherwise>
			</c:choose>
			</ul>

		</div>
	</nav>

	<!-- Login start -->
	<jsp:include page="modal_login.jsp" />
	<jsp:include page="modal_reguser.jsp" />
	<jsp:include page="modal_policy.jsp" />
	<jsp:include page="modal_myinfo.jsp" />
	<jsp:include page="modal_login.jsp" />
	<jsp:include page="modal_comments.jsp" />
	<jsp:include page="modal_regcomment.jsp" />
	
	<!-- Map center -->
	<jsp:include page="center.jsp" />
	
</body>
</html>
