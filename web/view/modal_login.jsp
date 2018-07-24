<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
					<form role="form" id="user-login">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Email</label> <input
								type="email" name="loginid" class="form-control" id="loginEmail"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" name="loginpwd" class="form-control" id="loginPwd"
								placeholder="Enter password">
						</div>
						<button type="submit" class="btn btn-success btn-block">
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