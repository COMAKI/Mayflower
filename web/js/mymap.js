var map = null;
var markerCluster= null;
var markers=[];
let isIdle=true;
var iconBase = 'img/';
var icons = {};
var nw, se = null;

var InfoBox = null;
var infoBox = null;

var searchBox = null;
var geocoder = null;
var searchMarkers = null;


const pcenter = {
		lat: 36.3,
		lng: 128.01
};

var myMap=function() {
	setInfoBox(google);
	
	map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 8,
	    center: {lat: pcenter.lat, lng: pcenter.lng},
	    mapTypeControl: true,
 		mapTypeControlOptions: {
 		    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
 		    position: google.maps.ControlPosition.TOP_CENTER
 		},
	    zoomControl: true,
 		zoomControlOptions: {
 		    position: google.maps.ControlPosition.LEFT_CENTER,
 		    minZoom: 3
 		},
 		scaleControl: true,
 		streetViewControl: true,
 		streetViewControlOptions: {
 		    position: google.maps.ControlPosition.LEFT_TOP
 		},
 		fullscreenControl: true
	  });
	
	var opt = { minZoom: 3};
	map.setOptions(opt);
	  
	//Initialize Object[icons] for using google api
	initialize();
	
	
    // Create an array of alphabetical characters used to label the markers.
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

     
    
    // Add Event Listener
    map.addListener('bounds_changed', getNewPos);
    map.addListener('idle', ()=>{
  	    isIdle=true;
    });
    map.addListener('dragend', ()=>{
    	isIdle=true;
    });

    // Add a marker clusterer to manage the markers.
    markerCluster = new MarkerClusterer(map, markers,
    {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});

  	var input = document.getElementById('searchbox0122');
  	searchBox = new google.maps.places.SearchBox(input);
  	
    searchBox.addListener('places_changed', searchLocation);
    geocoder = new google.maps.Geocoder();
  	
  	
  	infoBox = new InfoBox({   //객체 생성, 정보 지정
  	    content: "", //infobox 내용
  	    boxStyle:{
  	        border :"5px #000099 solid" ,
  	        borderRadius :"2px",
  	        background : "#FFFF99",
  	        textAlign: "left",
  	        fontSize : "9pt",
  	        color : "black",
  	        width : "180px",
  	        opacity : 1.0
  	    },
  	    closeBoxURL : "" // infobox에  x 버튼 삭제
  	 });
};

function getNewPos(event) {
	if(!isIdle) return;
	
   // map.panTo(map.getCenter());
    //console.log(pcenter.lat, pcenter.lng);
    var ne = map.getBounds().getNorthEast();
    var sw = map.getBounds().getSouthWest();
    nw = new google.maps.LatLng(ne.lat(),sw.lng());
    se = new google.maps.LatLng(sw.lat(),ne.lng());

    var str = 'New north-west corner: ' + nw.lat() + ', ' + nw.lng() + '<br>' +
    'New south-east corner: ' + se.lat() + ', ' + se.lng();
    console.log(str);
    $.ajax({
    	  type: 'POST',
    	  url: 'getspots.mw',
    	  data: {
    		  nwlng: nw.lng(),
    		  nwlat: nw.lat(),
    		  selng: se.lng(),
    		  selat: se.lat()
    	  },
    	  success: function(data){
    		  if(markers.length!=0){
    			  markers.forEach(function(elm,index){
    				  elm.setMap(null);
    				  markerCluster.clearMarkers();
    			  });
			  };
    		  for(var i = 0;i < data.length; i ++){
    			  const marker = new google.maps.Marker({
    				  position: {lat: data[i].lat, lng: data[i].lng},
		          	  icon: icons.wc.icon,
		          	  map: map,
		          	  title: data[i].name,
		          	  label: data[i].category
	    		  });
	    		  markers.push(marker);
	    		  
	    		  marker.information = data[i];
	    		  
	    		  marker.addListener('mouseover', function(){
	    			  infoBox.setContent(makeMarkerInfoBoxContent(marker.information)); //infobox오픈시 내용 셋팅
	    			  infoBox.open(map, this); // infobox가 위치할 map과 위치 지정
	    	     });
	    	    
	    		  marker.addListener('mouseout', function(){
	    	 
	    			  infoBox.close();// 닫기
	    	     
	    		  });
	    	 
	    		  marker.addListener('click', markerClickCallbackFunction);
	    		  markerCluster.addMarker(marker);
			  };
    	  },
    	  dataType: 'json'
	});
    isIdle=false;
}

function initialize(){
	
	icons = {
	   	parking: {
	  		icon: iconBase + 'parking_lot_maps.png'
	   	},
	   	library: {
	   		icon: iconBase + 'library_maps.png'
	   	},
	   	info: {
	   		icon: iconBase + 'info-i_maps.png'
	   	},
	   	wc: {
	   		icon: {
	   			url: iconBase + 'icon_wc.png',
	   			size: new google.maps.Size(71, 71),
	  		  	origin: new google.maps.Point(0, 0),
	  		  	anchor: new google.maps.Point(17, 34),
	  		  	scaledSize: new google.maps.Size(25, 25)
			}
	   	}
	};
	/*
	 * Point location on google map
	 */
	$('#searchmap').click(function (e) {
	    var address = $('#searchbox0122').val();
	    // Clear out the old markers.
	    clearSearchMarkers();
	    console.log(address);
	    geocoder.geocode({'address': address}, function (results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	        	searchLocation();
	            map.panTo(results[0].geometry.location);
	            searchMarkers.push( 
	            		new google.maps.Marker({
	            			map: map,
	            			position: results[0].geometry.location
	            		})
	            );
	            //marker.setPosition(results[0].geometry.location);
	            /* $('.search_addr').val(results[0].formatted_address);
	            $('.search_latitude').val(marker.getPosition().lat());
	            $('.search_longitude').val(marker.getPosition().lng()); */
	        } else {
	            alert("Geocode was not successful for the following reason: " + status);
	        }
	    });
	    e.preventDefault();
	});
};

function searchLocation() {
	console.log('Ready to search a location');
	console.log(searchBox.getPlaces());
    var places = searchBox.getPlaces();

    if (places == null) {
      return;
    }
 
    // Clear out the old markers.
    clearSearchMarkers();

    searchMarkers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }

      // Create a marker for each place.
      searchMarkers.push(new google.maps.Marker({
        map: map,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
};

function clearSearchMarkers(){
    // Clear out the old markers.
    if(searchMarkers != null) {
    	searchMarkers.forEach(function(marker) {
    		marker.setMap(null);
    	});
    };
}

