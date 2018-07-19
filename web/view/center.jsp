<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	header > h2 {
		float : left;
	}

	.container-redborder{
		border: 1px solid red;
	}
	.container-a01{
		position: absolute;
		height: 100%;
		width:100%;
		margin : 0;
		padding: 0;
	}
	.container-ui-row{
		position: absolute;
		padding: 0;
		margin:0;
		bottom: 0px;
    	left: 50%;
    	min-width:315px;
		display:inline-block;
    	-ms-transform: translate(-50%, 0%);
    	transform: translate(-50%, 0%);
	}

	.container-ui-row > button{
		margin:20px;
	}

	#map{
		height: 100%;
		width:100%;
	}
	#map>div:nth-child(1)>{
		height: 100%;
		width:100%;
	}
</style>
<script>
	$(document).ready(function () {
		 
		 $('#ajaxbtn').click(function () {
			 var displayResources = $('#display-resources');			 
			 displayResources.text('Loading data from JSON source...');
			 
			 $.ajax({
				 type: "GET",
				 url: "getjson.hw",
				 success: function(result) {
					 var output="<table><thead><tr><th>Name</th><th>Provider</th><th>URL</th></thead><tbody>";
					 for (var i in result) {
				 		output+="<tr><td>" + result[i].a + "</td><td>" + result[i].b + "</td><td>" + result[i].c + "</td></tr>";
				 	}
				 	output+="</tbody></table>";
				 	$('#ajaxdiv').html(output);
				 	
				 }
			});
		});

		 var markers = [];
		 
		 $('.container-ui-row>button').each(function(index){
				//console.log('im the button' + index);
				//console.log($(this).html());
				if(index == 2){
					$(this).on("click",function(){
						markers.forEach(function(elm,index){
							elm.setMap(null);
						});
					});
					
					
					return;
				}


				$(this).on("click",function(){
					for(var i = 0;i < 100; i ++){
						const marker = new google.maps.Marker({
			         		position: {lat: -25.363+(Math.random()*200), lng: 131.044+(Math.random()*200)},
			          		icon: icons.info.icon,
			          		map: map,
			          		title: 'Hello World!'
		    			});
		    			markers.push(marker);
		    			marker.addListener('click', function() {
		    		       map.setZoom(8);
		    		       map.setCenter(marker.getPosition());
		    		    });
					}
				});
			});
		 
		 
	});
</script>

<script src="js/mymap.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>

