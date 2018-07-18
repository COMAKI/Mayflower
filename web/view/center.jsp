<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	#main_center{
		width: 600px;
		height: 400px;
		margin: 0 auto;
		background-image:url('img/background_hamberger.jpg');
		background-repeat: no-repeat;
		background-size: 100%;
		text-align: center;
		position: relative;
	}
</style>

<style>

h1{
    color: white;
}
#w{
    position: absolute;
    left: 20px;
    width:100%;
    float:left;
    //border: 2px solid red;
    color: white;
    background: rgba(0,0,0,0.3);
    z-index: 1;
}
#f{
    position: absolute;
    left: 20px;
    bottom: 20px;
    width:300px;
    /* height:300px; */
    //border: 2px solid red;
    color: white;
    background: rgba(0,0,0,0.3);
    z-index: 1;
}
#m{
    position: absolute;
    right: 20px;
    bottom: 20px;
    width:500px;
    height:500px;
    background: rgba(0,0,0,0.3);
    z-index: -1;
    //float:left;
    //border: 2px solid red;
}
td{
    font-size:small;
}
button{
	z-index: 100;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.google.com/maps/api/js?sensor=false"></script> <!-- sensor=true면 브라우저에서 직접 gps에 접근 가능 (html5)-->
<script>
var error;
 
function wdisplay(data){
    var w = $(data).find('yweather\\:condition,condition'); // ':'를 특수문자로 인식하기 때문에 string으로 인식시키려면 '\\'기호사용
    var code = $(w).attr('code');                            // 'w'는 jquery의 Object이므로 $(w)와 w 둘 다 사용 가능
    var date = $(w).attr('date');
    var temp = $(w).attr('temp');
    var text = $(w).attr('text');
    var result = '';
    result += '<img src="http://l.yimg.com/a/i/us/we/52/'+code+'.gif"/>';
    result += '<h3>'+date+'</h3>';
    result += '<h3>'+temp+'</h3>';
    result += '<h3>'+text+'</h3>';
    $('#w').html(result);
};
function fdisplay(data){
    var w = $(data).find('yweather\\:forecast,forecast');
    var result = '';
    
    result += '<table><tr><th>code</th>';
    result += '<th>date</th>';
    result += '<th>day</th>';
    result += '<th>high</th>';
    result += '<th>low</th>';
    result += '<th>text</th></tr>';
    w.each(function(index, item){
        if(w.eq(0).attr('day') === w.eq(index).attr('day') && index>0){
            return false;
        }
        result += '<tr>';
        console.log(w.eq(0).attr('day'));
        console.log(w.eq(index+1).attr('day'));
        var code = $(item).attr('code');
        var date = $(item).attr('date');
        var day = $(item).attr('day');                            // 'w'는 jquery의 Object이므로 $(w)와 w 둘 다 사용 가능
        var high = $(item).attr('high');
        var low = $(item).attr('low');
        var text = $(item).attr('text');
        result += '<td><img src="http://l.yimg.com/a/i/us/we/52/'+code+'.gif"/></td>';
        result += '<td>'+date+'</td>';
        result += '<td>'+day+'</td>';
        result += '<td>'+high+'</td>';
        result += '<td>'+low+'</td>';
        result += '<td>'+text+'</td>';
        result += '</tr>';
    });
    result += '</table>';
    $('#f').html(result);
};
function mdisplay(data){
    var div = document.querySelector('#m');
    var ilat = $(data).find('geo\\:lat,lat').text();
    var ilng = $(data).find('geo\\:long,long').text();
    var map = new google.maps.Map(div, {
        mapTypeId:google.maps.MapTypeId.ROADMAP,
        zoom:14,
        center: new google.maps.LatLng(ilat,ilng)
    });
    var marker = new google.maps.Marker({
        map: map,
        animation: google.maps.Animation.DROP,
        position: {lat: ilat, lng: ilng},
        label:$(data).find('description').html()
    });
    // click
    marker.addListener('click', function(){
        marker.setAnimation(
                google.maps.Animation.BOUNCE
        );
        infowindow.open(marker.get('map'),marker);    
    });
};
 
function getWeather(){
    var wurl = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22seoul%22)%20%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
 
    $.ajax({
        url:wurl,
        success:function(data){
            wdisplay(data);
            fdisplay(data);
            mdisplay(data);
        },
        error:function(err){
            error = err;
            alert();
        }
    });
};
$(document).ready(function(){
    $('button').click(function(){
        getWeather();
    });
    setInterval(() => {
        getWeather();
    }, 60000);
});
</script>

<div id="main_center">
<h1>Weather</h1>
<div id='w'></div>
<div id='f'></div>
<div id='m'></div>
<button>Weather</button>
</div> <!-- end main center -->

