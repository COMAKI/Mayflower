var map = null;

var myMap=function() {
	var myLatLng = {lat: -25.363, lng: 131.044};
    
	var mapOptions = {
    	center: new google.maps.LatLng(-27.33, 131.12),
        zoom: 6,
        mapTypeId: google.maps.MapTypeId.HYBRID,
		mapTypeControl: true,
 		mapTypeControlOptions: {
 		    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
 		    position: google.maps.ControlPosition.TOP_CENTER
 		},
 		zoomControl: true,
 		zoomControlOptions: {
 		    position: google.maps.ControlPosition.LEFT_CENTER
 		},
 		scaleControl: true,
 		streetViewControl: true,
 		streetViewControlOptions: {
 		    position: google.maps.ControlPosition.LEFT_TOP
 		},
 		fullscreenControl: true
     }
 	 map = new google.maps.Map(document.getElementById("map"), mapOptions);
};

var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
var icons = {
   	parking: {
  		icon: iconBase + 'parking_lot_maps.png'
   	},
   	library: {
   		icon: iconBase + 'library_maps.png'
   	},
   	info: {
   		icon: iconBase + 'info-i_maps.png'
   	}
};


