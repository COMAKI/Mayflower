



var onCommentsLoaded = function(data){
	console.log('some data returned from getcomments.mw');
	
	$("#commentsModal .spotidspan").html('need repair');
    var content = '<div class="modal-header modal-header-my" style="padding: 35px 50px;">';
	  content+= '<h4>Comments for <span class="spotidspan"></span></h4>';
	  content+= '<button type="button" class="close" data-dismiss="modal">&times;</button>';
	  content+= '</div>';
    
	  for(var i = 0 ; i < 10 ; i++){
		content+= '<div class="modal-body modal-body-my" style="padding: 40px 50px;">';
		content+= '<h3>a content</h3>';
		content+= '</div>';  
	  }
	  
	  content+= '<div class="modal-body modal-body-my" style="padding: 40px 50px;">';
	  content+= '<button class="btn btn-success btn-block">';
	  content+= '<span class="glyphicon glyphicon-off"></span> Confirm</button>';
	  content+= '</div>';  
	  
	  $("#commentsModal .modal-content").html(content);	
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
      				     
      $("#commentsModal .modal-content").html('comments being loaded');
      $("#commentsModal").modal()
      
};


var makeMarkerInfoBoxContent = function(information){
	console.log(information);
	var content = "<div><table id = 'customers' border='1'>";
	content += "<tr><td style='border:1px solid;'>"+information.id+"</td></tr>";
	content += "<tr><td style='border:1px solid;'>aaaaaaaaaakm/h</td></tr>";
	content += "</table></div>";
	return content;
};
 
