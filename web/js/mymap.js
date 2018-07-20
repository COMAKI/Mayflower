var map = null;
var markerCluster= null;

var myMap=function() {
	map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 3,
	    center: {lat: pcenter.lat, lng: pcenter.lng},
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
	  });
	/*var mapOptions = {
    	center: new google.maps.LatLng(-28.024, 140.887),
        zoom: 3,
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
     }; // end mapOptions
	 map = new google.maps.Map(document.getElementById("map"), mapOptions);*/
  
      // Create an array of alphabetical characters used to label the markers.
      var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

      // Add some markers to the map.
      // Note: The code uses the JavaScript Array.prototype.map() method to
      // create an array of markers based on a given "locations" array.
      // The map() method here has nothing to do with the Google Maps API.
      var markers = locations.map(function(location, i) {
        return new google.maps.Marker({
          position: location,
          label: labels[i % labels.length]
        });
      }); // end markers

      // Add a marker clusterer to manage the markers.
      markerCluster = new MarkerClusterer(map, markers,
      {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});


  	var input = document.getElementById('searchbox0122');
  	var searchBox = new google.maps.places.SearchBox(input);

};

const pcenter = {
		lat: -28.024,
		lng: 140.887
};

var locations = [
    {lat: -31.563910, lng: 147.154312},
    {lat: -33.718234, lng: 150.363181},
    {lat: -33.727111, lng: 150.371124},
    {lat: -33.848588, lng: 151.209834},
    {lat: -33.851702, lng: 151.216968},
    {lat: -34.671264, lng: 150.863657},
    {lat: -35.304724, lng: 148.662905},
    {lat: -36.817685, lng: 175.699196},
    {lat: -36.828611, lng: 175.790222},
    {lat: -37.750000, lng: 145.116667},
    {lat: -37.759859, lng: 145.128708},
    {lat: -37.765015, lng: 145.133858},
    {lat: -37.770104, lng: 145.143299},
    {lat: -37.773700, lng: 145.145187},
    {lat: -37.774785, lng: 145.137978},
    {lat: -37.819616, lng: 144.968119},
    {lat: -38.330766, lng: 144.695692},
    {lat: -39.927193, lng: 175.053218},
    {lat: -41.330162, lng: 174.865694},
    {lat: -42.734358, lng: 147.439506},
    {lat: -42.734358, lng: 147.501315},
    {lat: -42.735258, lng: 147.438000},
    {lat: -43.999792, lng: 170.463352}
  ]

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


