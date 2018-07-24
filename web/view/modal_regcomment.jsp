<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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