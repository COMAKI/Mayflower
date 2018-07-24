<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/rating.css">
<script>
$(document).ready(function(){
	
	$("#commentsRegModal .btn-btn1").on('click',function(){
		  $("#commentsRegModal").modal('hide');
		  $("#commentsModal").modal('show');		  
	});
	$("#commentsRegModal .btn-btn2").on('click',function(){
		 
		var contents = $("#commentsRegModal .input-textarea").val();
		console.log('the content of comments to be sent'+contents);
		
		var rating = $('#commentsRegModal .rating input[type=radio]:checked').val()
		
		if(rating){
			$.ajax({
		    	  type: 'GET',
		    	  url: 'registercomment.mw',
		    	  data: {
		    		  rating: rating,
		    		  content: contents
		    	  },
		    	  success: onCommentsRegistered,
		    	  dataType: 'json'
			 });			
		}else{
			alert('rating À» ÀÔ·ÂÇÏ¼¼¿ä');
		}
		
		var rating = $('#commentsRegModal .rating input[type=radio]:checked').prop( "checked", false);
		
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
					<form role="form" id="commentform">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>Comment:</label>
							<textarea class="form-control input-textarea" rows="5" id="comment"></textarea>
						</div>
						<div class="form-group" style="position:relative; height:40px;">
							<label style="position:relative; float:left; line-height:40px; margin-right:5px;"><span class="glyphicon glyphicon-eye-open"></span>Rating:</label> 
							<div style="position:relative; float:left;">
							<fieldset class="rating">
	    					<input type="radio" id="star5" name="rating" value="10" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
	    					<input type="radio" id="star4half" name="rating" value="9" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
	    					<input type="radio" id="star4" name="rating" value="8" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
	    					<input type="radio" id="star3half" name="rating" value="7" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
	    					<input type="radio" id="star3" name="rating" value="6" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
	    					<input type="radio" id="star2half" name="rating" value="5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
	    					<input type="radio" id="star2" name="rating" value="4" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
	    					<input type="radio" id="star1half" name="rating" value="3" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
	    					<input type="radio" id="star1" name="rating" value="2" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
	  						<input type="radio" id="starhalf" name="rating" value="1" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
							</fieldset>
							</div>
							<span style="line-height:40px;"> &nbsp </span>
							<span class="rating-msg" style="line-height:40px;"></span>
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-eye-open"></span>File:</label> 
							<input id="input-b1" name="input-b1" type="file" class="file">
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