<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
							<label for="pwd"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" name="joinPwd"
								placeholder="Enter password">
				</div>
				<div class="form-group">
							<label for="pwd"><span
								class="glyphicon glyphicon-eye-open"></span> Password Confirm</label> <input
								type="password" class="form-control" name="joinPwdRe"
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
	</div>	
</div>    