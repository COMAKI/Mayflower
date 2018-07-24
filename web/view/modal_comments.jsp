<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>

#commentsModal .content-input-frame.id0a, #commentsModal .content-input-frame.id0b{
	float:left;
}

@media ( max-width : 767px) {
	#commentsModal .content-input-frame.id0a, #commentsModal .content-input-frame.id0b{
		width:50%;
	}
}

@media ( min-width : 768px) {
	#commentsModal .content-input-frame.id0a, #commentsModal .content-input-frame.id0b{
		width:100%;
	}
}


</style>

    <div class="modal fade" id="commentsModal" style="padding:0;" role="dialog">
		<div class="modal-dialog modal-box-my" style="max-width : none;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4><span class="glyphicon glyphicon-lock"></span>Spot01</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="modal-column-my modal-column-my-a" style="float:left; border:1px solid red;">
						<div class="content-input-frame id0a" style="padding: 20px 30px;">
							
						</div>  
						<div class="content-input-frame id0b" style="padding: 20px 30px;">
							
						</div>  
					
					</div>
					<div class="modal-column-my modal-column-my-b" style="float:left; ">
						<div class="content-input-frame id0c content-frame-scrollable" style="height:90%; border:1px solid red; overflow:auto;">
						
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