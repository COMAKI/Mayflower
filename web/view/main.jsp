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
}

@media ( min-width : 768px) {
	.search-box {
		max-width: 500px !important;
	}
}
</style>
<script>

$(document).ready(()=>{
	const innerHtmlRegister = $('#Register .modal-body').html();
	$('.nav-link[data-target=#Register]').on({
		click: function(){
			$('#Register .modal-body').html(innerHtmlRegister);			
		}
	});
	$('#user-register').submit((e)=>{
		console.log('user-register start');
	    var email = $('input[name=joinEmail]').val();   
		var name = $('input[name=joinName]').val();
		var phone = $('input[name=joinPhone]').val();
		var pwd = $('input[name=joinPsw]').val();
		var repwd = $('input[name=joinPswRe]').val();
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

	function login() {
		alert('Login Suceess. Welcome :)');
		$("#loginform").attr('action', 'loginaction.mw');
		$("#loginform").submit();
	};
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
						</a>님</li>
				</c:otherwise>
			</c:choose>
			</ul>

		</div>
	</nav>

	<!-- Login start -->
	<div class="modal fade" id="Login" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="loginform">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Email</label> <input
								type="email" name="loginid" class="form-control" id="loginEmail"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" name="loginpwd" class="form-control" id="loginPsw"
								placeholder="Enter password">
						</div>
						<button class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<%-- <button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel  
					</button >--%>
					<p>
						Not a member? <a href="#" data-toggle="modal" data-target="#Register">Sign
							Up <span class="sr-only">(current)</span>
						</a>
					</p>
					<p>
						Forgot <a href="#" data-toggle="modal" data-target="#myinfo">Password?
							<span class="sr-only">(current)</span>
						</a>

					</p>
				</div>
			</div>
			<!-- Modal content end -->
		</div>
	</div>
	<!-- Login end -->
	<!-- Register start -->
	<div class="modal fade" id="Register" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Register
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="user-register">
						<div class="form-group">
							<label for="email"><span
								class="glyphicon glyphicon-user"></span> Email</label> <input
								type="email" class="form-control" name="joinEmail"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Name</label> <input
								type="text" class="form-control" name="joinName"
								placeholder="Enter name">
						</div>
						<div class="form-group">
							<label for="phone"><span
								class="glyphicon glyphicon-user"></span> Phone</label> <input
								type="text" class="form-control" name="joinPhone"
								placeholder="Enter phone number">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" name="joinPsw"
								placeholder="Enter password">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password Confirm</label> <input
								type="password" class="form-control" name="joinPswRe"
								placeholder="Enter password">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked> I
								have read the private policy about this service. </label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Register
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<p>
						To read <a href="#" data-toggle="modal" data-target="#Policy">Private
							Policy <span class="sr-only">(current)</span>
						</a>
					</p>
				</div>
			</div>
			<!-- Modal content end -->
		</div>	</div>
	<!-- Register end -->

	<!-- Policy content start -->
	<div class="modal fade" id="Policy" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span>Private Policy
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<p style="text-align: center;">
								<b>Privacy Notice</b><br> <br>This privacy notice
								discloses the privacy practices for (website address). This
								privacy notice applies solely to information collected by this
								website. <br>It will notify you of the following:<br>
							</p>

							<p style="text-align: left;">
								<br>- What personally identifiable information is collected
								from you through the website, how it is used and with whom it
								may be shared. <br>- What choices are available to you
								regarding the use of your data. <br>- The security
								procedures in place to protect the misuse of your information. <br>-
								How you can correct inaccuracies in the information.
							</p>
							<p style="text-align: center;">
								<b>Information Collection, Use, and Sharing </b><br>
								<br> We are the sole owners of the information collected on
								this site. We only have access to/collect information that you
								voluntarily give us via email or other direct contact from you.
								We will not sell or rent this information to anyone. <br>
								<br> We will use your information to respond to you,
								regarding the reason you contacted us. We will not share your
								information with any third party outside of our organization,
								other than as necessary to fulfill your request, e.g. to ship an
								order. <br>
								<br> Unless you ask us not to, we may contact you via email
								in the future to tell you about specials, new products or
								services, or changes to this privacy policy.
							</p>

							<p>
								Your Access to and Control Over Information You may opt out of
								any future contacts from us at any time. You can do the
								following at any time by contacting us via the email address or
								phone number given on our website: <br>
								<br> <b>- See what data we have about you, if any.</b><br>
								<b>- Change/correct any data we have about you.</b><br> <b>-
									Have us delete any data we have about you.</b><br> <b>-
									Express any concern you have about our use of your data.</b><br>
							</p>

							<p style="text-align: center;">
								<b>Security</b><br> <br>We take precautions to protect
								your information. When you submit sensitive information via the
								website, your information is protected both online and offline.
								<br>
								<br> Wherever we collect sensitive information (such as
								credit card data), that information is encrypted and transmitted
								to us in a secure way. You can verify this by looking for a lock
								icon in the address bar and looking for "https" at the beginning
								of the address of the Web page. <br>
								<br> While we use encryption to protect sensitive
								information transmitted online, we also protect your information
								offline. Only employees who need the information to perform a
								specific job (for example, billing or customer service) are
								granted access to personally identifiable information. The
								computers/servers in which we store personally identifiable
								information are kept in a secure environment.
							</p>

						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked> I
								have acknowledged all the terms and conditions. </label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Confirm
						</button>
					</form>
				</div>
			</div>
			<!-- Modal content end -->
		</div>
	</div>
	<!-- Policy content end -->
	<!-- MyInfo content start -->
	<div class="modal fade" id="MyInfo" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> My Info.
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span><b>
									${sessionScope.loginid } </b></label>
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Phone</label> <input
								type="text" class="form-control" name="myPhone"
								placeholder="Enter phone number">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Current Password</label> <input
								type="password" class="form-control" name="myPsw"
								placeholder="Enter password">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Change Password</label> <input
								type="password" class="form-control" name="myChnPsw"
								placeholder="Enter password">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Confirm Password</label> <input
								type="password" class="form-control" name="myConPsw"
								placeholder="Enter password">
						</div>

						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Update Info.
						</button>
					</form>
				</div>
			</div>
			<!-- Modal content end -->
		</div>
	</div>
	<!-- MyInfo content end -->
 	<!-- commentsModal content start -->
	<div class="modal fade" id="commentsModal" role="dialog">
		<div class="modal-dialog" style="width:80%; max-width : none;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4><span class="glyphicon glyphicon-lock"></span>Spot01</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div style="float:left; width:30%; height:600px; border:1px solid red;">
					
					
					</div>
					<div style="float:left; width:60%; margin-left:10%; height:600px;">
						<div class="content-input-frame" style="height:90%; border:1px solid red; overflow:auto;">
						
						</div>
						<div class="modal-body" style="padding: 20px 30px;">
							<button class="btn btn-success btn-block btn-btn1">
								<span class="glyphicon glyphicon-off"></span> Add Comment
							</button>
						</div>  
							
					</div>		
					
					
				</div>
			</div>
			<!-- Modal content end -->
		</div>
	</div>
	<!-- commentsModal content end -->
	<!-- commentsRegModal content start -->
	<div class="modal fade" id="commentsRegModal" role="dialog">
		<div class="modal-dialog modal-1000">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>Register Comment</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="commentform">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>Comment:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>
								File:</label> <input id="input-b1" name="input-b1" type="file"
								class="file">
						</div>
						<button type="button" class="btn btn-success btn-block btn-btn1">
							Back to Comments</button>
						<button type="button" class="btn btn-success btn-block btn-btn2">
							Register Comment</button>
					</form>
				</div>
			</div>

			<!-- Modal content end -->
		</div>
	</div>
	<!-- commentsRegModal content end -->

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
