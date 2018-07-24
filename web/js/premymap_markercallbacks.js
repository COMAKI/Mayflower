


var comments = [];


var onCommentsLoaded = function(data){
	console.log('some data returned from getcomments.mw');
	var content = '';
	
	data.forEach(function(elm,index){
		content+= '<div class="modal-body modal-body-my" style="padding: 40px 50px;">';
		content+= '<h3>'+elm.userid+'</h3>';
		content+= '<h5>'+elm.content+'</h5>';
		content+= '</div>';
	});
	  
	$("#commentsModal .content-input-frame").html(content);	
}

var onCommentsRegistered = function(data){
	if(data.status == 'success'){
		console.log('comment register success');
		$("#commentsRegModal").modal('hide');
		$("#commentsModal").modal('show');
	    $("#commentsModal .content-input-frame").html('comments being loaded');
		
		
		 $.ajax({
	    	  type: 'GET',
	    	  url: 'getcomments.mw',
	    	  data: {
	    		  spotid: 'spot01',
	    		  lastid:'d'
	    	  },
	    	  success: onCommentsLoaded,
	    	  dataType: 'json'
		 });
	}else{
		console.log('comment register fail');
		
		
		
	}
	
}



$(document).ready(function(){
	$("#commentsModal .btn-btn1").on('click',function(){
		if(session.id != undefined){
			$("#commentsModal").modal('hide');
			$("#commentsRegModal").modal();		  			
		}else{
			$("#commentsModal").modal('hide');
			state.activitybeforelogin = 'addcomment';
			$("#Login").modal();			
		}
		 
	});
	
	$("#commentsRegModal .btn-btn1").on('click',function(){
		  $("#commentsRegModal").modal('hide');
		  $("#commentsModal").modal('show');		  
	});
	$("#commentsRegModal .btn-btn2").on('click',function(){
		 
		var contents = $("#commentsRegModal .input-textarea").val();
		console.log('the content of comments to be sent'+contents);
		
		$.ajax({
	    	  type: 'GET',
	    	  url: 'registercomment.mw',
	    	  data: {
	    		  rating: 9,
	    		  content: contents
	    	  },
	    	  success: onCommentsRegistered,
	    	  dataType: 'json'
		 });
	});
	
	$('.content-frame-scrollable').scroll(function(){
			var vh = $(this).height();	
			var sh = $(this).prop('scrollHeight');
			var st = $(this).scrollTop();
			
			if((st+vh)>(sh-50)){
				//
			}	
	});
	
});




var markerClickCallbackFunction = function() {
	  map.setZoom(8);
      map.setCenter(this.getPosition());
      //information
      
      var information = this.information;
      
      $.ajax({
    	  type: 'GET',
    	  url: 'getcomments.mw',
    	  data: {
    		  spotid: 'spot01'
    	  },
    	  success: onCommentsLoaded,
    	  dataType: 'json'
	});
      				     
      $("#commentsModal .content-input-frame").html('comments being loaded');
      $("#commentsModal").modal();
};


var makeMarkerInfoBoxContent = function(information){
	var content = "<div><table id = 'customers' border='1'>";
	content += "<tr><td style='border:1px solid;'>"+information.id+"</td></tr>";
	content += "<tr><td style='border:1px solid;'>aaaaaaaaaakm/h</td></tr>";
	content += "</table></div>";
	return content;
};
 
