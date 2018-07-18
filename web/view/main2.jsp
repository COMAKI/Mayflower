<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>Insert title here</title>

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

</head>
<body>


<div class="container-redborder container-a01">
	<div id="map"></div>
	<div class="container-ui-row container-redborder">
	  	<button type="button" class="btn">Basic</button>
	  	<button type="button" class="btn">Basic</button>
	  	<button type="button" class="btn">Basic</button>
  	</div>
</div>

<script src="js/mymap.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
</body>
</html>