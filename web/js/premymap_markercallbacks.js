


var comments = [];


var onCommentsLoaded = function(data){
	console.log('some data returned from getcomments.mw');
	
	
	var randomint = 1+Math.floor(Math.random() * 4);
	var imgpath = 'img/bathrooms/bathroom'+randomint+'.jpg';
	
	var content = '';
	
	content+= '<img style="width:100%;" src="'+imgpath+'"/>';
	
	$("#commentsModal .content-input-frame.id0a").html(content);	
	
	content = '';
	
	content+= '<h6>some info about bathroom</h6>';
	
	$("#commentsModal .content-input-frame.id0b").html(content);	
	
	content = '';
	
	data.forEach(function(elm,index){
		content+= '<div class="modal-body modal-body-my" style="padding: 40px 50px;">';
		content+= '<h3>'+elm.userid+'</h3>';
		content+= '<h5>'+elm.content+'</h5>';
		content+= '</div>';
	});
	  
	$("#commentsModal .content-input-frame.id0c").html(content);	
}

var onCommentsRegistered = function(data){
	if(data.status == 'success'){
		console.log('comment register success');
		$("#commentsRegModal").modal('hide');
		$("#commentsModal").modal('show');
	    $("#commentsModal .content-input-frame").html('<h3>contents are being loaded<h3>');
		
		
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
		if(state.id != undefined){
			$("#commentsModal").modal('hide');
			$("#commentsRegModal").modal();		  			
		}else{
			$("#commentsModal").modal('hide');
			state.activitybeforelogin = 'addcomment';
			$("#Login").modal();			
		}
		 
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
	  map.setZoom(18);
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
      				     
      $("#commentsModal .content-input-frame").html('<h3>contents are being loaded<h3>');
      $("#commentsModal").modal();
};


var makeMarkerInfoBoxContent = function(information){
	var content = "<div><table id = 'customers' border='1'>";
	content += "<tr><td style='border:1px solid;'>"+information.name+"</td></tr>";
	content += "<tr><td style='border:1px solid;'>"+information.category+"</td></tr>";
	content += "</table></div>";
	return content;
};
 
