<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style type="text/css">
	.star-rating{
		position: relative;
		height: 15px;
	}
	
	.star-rating *{
		margin : 0;
		padding: 0;
	}

	.star-rating>div{
		position: relative;
		float: left;
		width: 20%;
		height: 100%;
	}


	.star-rating>div>.val-div{
		position: relative;
		float: left;
		width: 45%;
		height: 100%;
	}
	
	.star-rating>div>i{
		position: absolute;
	}


</style>
<script>
$(document).ready(function(){
	var height = $('.star-rating').height();
	$('.star-rating>div>i').css('font-size',height);
	var ratio = 1.125;
	$('.star-rating').width(height*5*ratio);

	$('.star-rating>div>.id0a').css('opacity',0);
	$('.star-rating>div>.id0b').css('opacity',0);
	$('.star-rating>div>.id0a').css('color','orange');
	$('.star-rating>div>.id0b').css('color','#fabd00');
	$('.star-rating>div>.id0c').css('color','gray');

	var star_rating_callback = function(event){
		var val = parseInt($(this).children('input').val());	
		var aorb = (event.type == "click") ? 'a':'b';

		for(var i = 1 ; i <= 5 ; i++){
			if(i*2<=val){
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star').css('opacity',1);
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star-half').css('opacity',1);
			}else if((i-1)*2<val){
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star').css('opacity',0);
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star-half').css('opacity',1);
			}else{
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star').css('opacity',0);
				$('.star-rating>div:nth-child('+i+')>.id0'+aorb+'.fa-star-half').css('opacity',0);
			}
		}
		
		if(event.type='click'){
			$('#commentsRegModal .star-rating>input[type=hidden]').val(val)
		}
	};

	$('.star-rating>div>.val-div').on("mouseover",star_rating_callback);
	$('.star-rating>div>.val-div').on("click",star_rating_callback);
	$('.star-rating').on("mouseleave",function(){$('.star-rating>div>.id0b').css('opacity',0);});
});

$(document).ready(function(){
	
	$("#commentsRegModal .btn-btn1").on('click',function(){
		  $("#commentsRegModal").modal('hide');
		  $("#commentsModal").modal('show');		  
	});
	$("#commentsRegModal .btn-btn2").on('click',function(){
		 
		var contents = $("#commentsRegModal .input-textarea").val();
		console.log('the content of comments to be sent'+contents);
		
		var rating = $('#commentsRegModal .star-rating>input[type=hidden]').val()
		
		var form = new FormData(document.getElementById('commentform'));
		form.append('content',contents);
		form.append('rating',rating);
		form.append('spotid',state.currentspotid);
		
		if(rating>0){
			$.ajax({
		    	  type: 'POST',
		    	  url: 'registercomment.mw',
		    	  data: form, 
		    	  dataType: 'text', 
		    	  processData: false, 
		    	  contentType: false, 
		    	  success: onCommentsRegistered
			 });			
		}else{
			alert('ratin');
		}
		
		var rating = $('#commentsRegModal .rating>input[type=hidden]').val(0);
		$('.star-rating>div>.id0a').css('opacity',0);
		$('.star-rating>div>.id0b').css('opacity',0);
		
		
	});
	
});
</script>

<div class="modal fade" id="commentsRegModal" role="dialog">
		<div class="modal-dialog modal-1000">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>Register Comment</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="commentform" enctype="multipart/form-data">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>Comment:</label>
							<textarea class="form-control input-textarea" rows="5" id="comment"></textarea>
						</div>
						<div class="form-group" style="position:relative; height:40px;">
							<label style="position:relative; float:left; line-height:40px; margin-right:5px;"><span class="glyphicon glyphicon-eye-open"></span>Rating:</label> 
							<div class="star-rating" style="margin-left:10px; display:inline-block;">
								<div>
									<i class="id0c fas fa-star"></i>
									<i class="id0a fas fa-star"></i>
									<i class="id0a fas fa-star-half"></i>
									<i class="id0b fas fa-star"></i>
									<i class="id0b fas fa-star-half"></i>
									<div class="val-div"><input type="hidden" value="1"/></div>		
									<div class="val-div"><input type="hidden" value="2"/></div>
								</div>
								<div>
									<i class="id0c fas fa-star"></i>
									<i class="id0a fas fa-star"></i>
									<i class="id0a fas fa-star-half"></i>
									<i class="id0b fas fa-star"></i>
									<i class="id0b fas fa-star-half"></i>
									<div class="val-div"><input type="hidden" value="3"/></div>		
									<div class="val-div"><input type="hidden" value="4"/></div>
								</div>
								<div>
									<i class="id0c fas fa-star"></i>
									<i class="id0a fas fa-star"></i>
									<i class="id0a fas fa-star-half"></i>
									<i class="id0b fas fa-star"></i>
									<i class="id0b fas fa-star-half"></i>
									<div class="val-div"><input type="hidden" value="5"/></div>		
									<div class="val-div"><input type="hidden" value="6"/></div>
								</div>
								<div>
									<i class="id0c fas fa-star"></i>
									<i class="id0a fas fa-star"></i>
									<i class="id0a fas fa-star-half"></i>
									<i class="id0b fas fa-star"></i>
									<i class="id0b fas fa-star-half"></i>
									<div class="val-div"><input type="hidden" value="7"/></div>		
									<div class="val-div"><input type="hidden" value="8"/></div>
								</div>
								<div>
									<i class="id0c fas fa-star"></i>
									<i class="id0a fas fa-star"></i>
									<i class="id0a fas fa-star-half"></i>
									<i class="id0b fas fa-star"></i>
									<i class="id0b fas fa-star-half"></i>
									<div class="val-div"><input type="hidden" value="9"/></div>		
									<div class="val-div"><input type="hidden" value="10"/></div>
								</div>
								
								<input type="hidden" value="0"/>
						
							</div>

							<span style="line-height:40px;"> &nbsp </span>
							<span class="rating-msg" style="line-height:40px;"></span>
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>File:</label> 
							<input id="input-b1" name="img" type="file" class="file">
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