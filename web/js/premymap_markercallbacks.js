
$(document).ready(function(){
	$("#commentsRegModal .btn-btn1").on('click',function(){
		  $("#commentsRegModal").modal('hide');
		  $("#commentsModal").modal('show');		  
	});
	$("#commentsRegModal .btn-btn2").on('click',function(){
		$("#commentsRegModal").modal('hide');
		$("#commentsModal").modal('show');
	    $("#commentsModal .content-input-frame").html('comments being loaded');
		
		 $.ajax({
	    	  type: 'GET',
	    	  url: 'getcomments.mw',
	    	  data: {
	    		  spotid: 'spot01'
	    	  },
	    	  success: onCommentsLoaded,
	    	  dataType: 'json'
		 });
	});
	
	$('.modal').scroll(function(){
			var docH = $(document).height();	
			var scrollH = $(window).height()+$(window).scrollTop();
			
			
			console.log('modal height: '+ $(this).height());
			console.log('window height : '+ $(window).height());
			console.log('modal scrolltop: '+ $(this).scrollTop());
			console.log('modal scrollheight: '+ $(this).prop('scrollHeight'));
			
			
	});
	
});

var onCommentsLoaded = function(data){
	console.log('some data returned from getcomments.mw');
	
	
	var content = '';
    
	  for(var i = 0 ; i < 10 ; i++){
		content+= '<div class="modal-body modal-body-my" style="padding: 40px 50px;">';
		content+= '<h3>a content</h3>';
		content+= '</div>';  
	  }	
	  
	  $("#commentsModal .content-input-frame").html(content);	
	  $("#commentsModal .btn-btn1").on('click',function(){
		  $("#commentsModal").modal('hide');
		  $("#commentsRegModal").modal();		  
	  });

}




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
      $("#commentsModal").modal()
      
};


var makeMarkerInfoBoxContent = function(information){
	var content = "<div><table id = 'customers' border='1'>";
	content += "<tr><td style='border:1px solid;'>"+information.id+"</td></tr>";
	content += "<tr><td style='border:1px solid;'>aaaaaaaaaakm/h</td></tr>";
	content += "</table></div>";
	return content;
};
 
