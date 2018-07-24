<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
	