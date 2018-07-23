


var markerClickCallbackFunction = function() {
	  map.setZoom(8);
      map.setCenter(this.getPosition());
      //information
      
      var information = this.information;
      
      $("#commentsModal .spotidspan").html(information.id);
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
 
