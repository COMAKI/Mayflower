<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
.whois-nav{
	text-align: center;
	padding: 0 auto !important;
}
.whois{
	margin: 0 auto;
	padding: 0 auto;
	font-size: x-small;
}
</style>
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
						<c:choose>
							<c:when test="${groupid == 1}">
								<li class="nav-item"><a class="nav-link whois-nav" href="#">
									<i class="fas fa-user"></i>
									<div class="whois">
										ADMIN
									</div>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link whois-nav" href="#">
									<i class="fas fa-user"></i>
									<div class="whois">
										USER
									</div>
								</a></li>
							</c:otherwise>
						</c:choose>
						<li class="nav-item active"><a href="#" class="nav-link"
							data-toggle="modal" data-target="#MyInfo">
								${loginid } <span class="sr-only">(current)</span>
						</a></li> 
						<li class="nav-item active"><a href="logout.mw" class="nav-link">
								LOGOUT <span class="sr-only">(current)</span>
						</a></li> 
						<script>
							state.id = '${loginid}';
							console.log(state.id);
						</script>
				</c:otherwise>
			</c:choose>
</ul>