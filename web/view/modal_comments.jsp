<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>

#commentsModal .content-input-frame.id0a, #commentsModal .content-input-frame.id0b{
	float:left;
}

.modal-body-my {
	border-top: 1px solid gray;
}


@media ( max-width : 767px) {
	#commentsModal .content-input-frame.id0a{
		width:45%;
	}
	
	#commentsModal .content-input-frame.id0b{
		width:50%;
		margin-top:0px;
		margin-left:5%;
	}
	
	
	.responsive-br{
		display:none;
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
	#commentsModal .content-input-frame.id0a, #commentsModal .content-input-frame.id0b{
		width:100%;
	}
	#commentsModal .content-input-frame.id0b{
		margin-left:0px;
		margin-top:20px;
	}
	.responsive-br{
		display:block;
	}
	.modal-box-my{
		width:80%;
	}
	.modal-column-my-a{
		width:30%;
		height:600px;
		margin:0;
	}
	.modal-column-my-b{
		width:65%;
		margin-left:5%;
		height:600px;
	} 	 
	
}


</style>

    <div class="modal fade" id="commentsModal" style="padding:0;" role="dialog">
		<div class="modal-dialog modal-box-my" style="max-width : none;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4><span class="glyphicon glyphicon-lock"></span><span class="input-span">Spot01</span></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="modal-column-my modal-column-my-a" style="padding: 20px 30px; float:left; border:1px solid red;">
						<div class="content-input-frame id0a">
							
						</div>  
						<div class="content-input-frame id0b">
							
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