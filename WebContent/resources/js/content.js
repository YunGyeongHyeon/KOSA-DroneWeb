var labels = 'FH';
var labelIndex = 0;
var lat = "";
var lon = "";
var i = 1;

function initMap() {
	var myLatLng = {
		lat : 37.5500968,
		lng : 127.1269845
	};

	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : myLatLng
	});
	// Add a marker at the center of the map.
	addMarker(myLatLng, map);
}

function addMarker(location, map) {
	if(i == 1){
		var icon = {
			url : 'http://106.253.56.124:8085/FinalWebProject/resources/image/fireStation.png',
			scaledSize : new google.maps.Size(60, 60)
		}
		i++;
	}else{
		var icon = {
				url : 'http://106.253.56.124:8085/FinalWebProject/resources/image/fire3.png',
				scaledSize : new google.maps.Size(100, 100)
			}
	}
	
	// Add the marker at the clicked location, and add the next-available label
	// from the array of alphabetical characters.
	marker = new google.maps.Marker({
		position : location,
		icon : icon,
		map : map
	});
	// lat, lon data information
	lat = marker.position.lat();
	lon = marker.position.lng();
}

function listClick(lat, lon) {
	uluru = {
		lat : lat,
		lng : lon
	};

	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : uluru
	});
	// Add a marker at the center of the map.
	addMarker(uluru, map);
}

$(function() {
	client = new Paho.MQTT.Client(location.hostname, 61625, "dStart"+new Date().getTime());
	client.onMessageArrived = onMessageArrived;
	client.connect({
		onSuccess : onConnect
	});
})
	function onConnect() {// 토픽이름
		client.subscribe("/drone/service2/pub");
	}
	function onMessageArrived(message) {
		var ms = message.payloadString;
		System.out.println(ms)
	}


	function sendMessage() {
		var json = 
				{
					"report_no":report_no,
					"lat":lat,
					"lon":lon,
					"report_time":report_time};
		;
		loadjson = JSON.stringify(json);
		console.log(loadjson);
		var updateLatLon = new Paho.MQTT.Message(loadjson);
		updateLatLon.destinationName = "/drone/report/pub";

		client.send(updateLatLon);
	}
$(function(){
	$(".selectLine").click(function() {
		/*
		 * $("button").on("click",function(){ return false; })
		 */
		$(this).siblings().children("td").removeClass("select")
		$(this).children("td").toggleClass("select")
	})
	$("#cn_picture").hover(function() {
		$(this).children("div").css("display", "block");
	}, function() {
		$(this).children("div").css("display", "none");
	})
	$(".dStart").on("click",function(){
		alert("출동 접수가 되었습니다.");
		report_no = $(this).parent().parent(".selectLine").children(".reportNo").val();
		lat = $(this).parent().parent(".selectLine").children(".lat").text();
		lon = $(this).parent().parent(".selectLine").children(".lon").text();
		report_time = $(this).parent().parent(".selectLine").children(".reportTime").text();

		if(lat != null && lon != null){
			sendMessage();
		}
		
	})
})

function moving(url) {
	$.ajax({
		url : url,
		success : function(data) {
			$("#ajax").html(data);
		},
		error : function() {
			alert("에러");
		}
	});
}
