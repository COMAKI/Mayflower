


var comments = [];


var onCommentsLoaded = function(data){
	console.log('some data returned from getcomments.mw');
	
	$("#commentsModal .input-span").html(state.currentspotname);
	
	
	var randomint = 1+Math.floor(Math.random() * 4);
	var imgpath = 'img/bathrooms/bathroom'+randomint+'.jpg';
	
	var content = '';
	
	content+= '<img style="width:100%;" src="'+imgpath+'"/>';
	
	$("#commentsModal .content-input-frame.id0a").html(content);	
	
	var rating = 0;
	var count = 0;
	data.forEach(function(elm,index){
		rating += elm.rating;
		count++;
	});
	rating = Math.round(rating / count * 100) / 100;
	
	content = '';
	
	var ratingsaved = rating;
	var numstar = 0;
	while(numstar<5){
		if(rating>=2){
			rating -= 2;
			content+='<span class="fas fa-star"></span>';
		}else if(rating >0){
			rating = 0;
			content+='<span class="fas fa-star-half-alt"></span>';			
		}else{			
			content+='<span class="far fa-star"></span>';
		}
		numstar++;
	}
	
	content+='<span><br class="responsive-br"> &nbsp'+ratingsaved+'/10.0</span>';
	
	content+='<br>';
	
	content+= '<h6>some info about bathroom</h6>';
	
	
	$("#commentsModal .content-input-frame.id0b").html(content);	
	
	content = '';
	
	data.forEach(function(elm,index){
		content+= '<div class="modal-body modal-body-my" style="padding: 20px 25px;">';
		content+= '<h3>'+elm.userid+'</h3>';
		content+= '<h5>'+elm.content+'</h5>';
		
		var rating = elm.rating;
		var ratingsaved = rating;
		var numstar = 0;
		while(numstar<5){
			if(rating>=2){
				rating -= 2;
				content+='<span class="fas fa-star"></span>';
			}else if(rating >0){
				rating = 0;
				content+='<span class="fas fa-star-half-alt"></span>';			
			}else{			
				content+='<span class="far fa-star"></span>';
			}
			numstar++;
		}
		
		
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
	    		  spotid: state.currentspotid
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
      
      state.currentspotname = information.name;
      state.currentspotid = information.id;
      
      $.ajax({
    	  type: 'GET',
    	  url: 'getcomments.mw',
    	  data: {
    		  spotid: state.currentspotid
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
 
