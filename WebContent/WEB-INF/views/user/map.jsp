<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import= "com.fireBusters.web.dto.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/css/map.css">
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
		<script async defer
	   	 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap">
	    </script>
		<script>
		 var labels = 'F';
	      var labelIndex = 0;
			// Initialize and add the map
			function initMap() {
				var uluru = { 
						lat: 37.4978624,
						lng: 127.153762
				}
				// The map, centered at Uluru
				  var map = new google.maps.Map(
				      document.getElementById('map'), {zoom: 15, center: uluru});

				  google.maps.event.addListener(map, 'click', function(event) {
			          addMarker(event.latLng, map);
			        });
			        // Add a marker at the center of the map.
			        addMarker(uluru, map);
		      }
			// Adds a marker to the map.
			
		      function addMarker(location, map) {    
		    	if(labelIndex != 0){
		    		marker.setMap(null);
		    	}
		        // Add the marker at the clicked location, and add the next-available label
		        // from the array of alphabetical characters.
		        marker = new google.maps.Marker({
		          position: location,
		          label: labels[labelIndex++ % labels.length],
		          map: map
		        });
		        
		        // lat, lon data information
		        lat = marker.position.lat();
		        lon = marker.position.lng();
		      }
			
			var client = null;
			$(function() {
				//MQTT Broker와 연결하기
				client = new Paho.MQTT.Client(location.hostname, 61625, "clientId"+new Date().getTime()); 
				client.onMessageArrived = onMessageArrived; 
				client.connect({
					onSuccess : onConnect
				});
				
			});
			
			function onConnect() {
				console.log("onConnect");
				client.subscribe("/drone/service2/sub");
			}
			
			function sendData(){
				//MQTT
				var data = {"msgid":"report", "lat":lat, "lon":lon};
				var message = new Paho.MQTT.Message(JSON.stringify(data));
				message.destinationName = "/drone/service2/pub";
				client.send(message);
				
				console.log("sendData");
			}
			
			function onMessageArrived(message) {
				var json = JSON.parse(message.payloadString);
				if(json.result == "ok") {
					console.log("접수가 완료되었습니다.");
					location.href="complete?lat="+lat+"&lon="+lon;
				}  
			}
	     </script>
	</head>
	<body>
    	<div class="Map" id="map" ></div>
        <a onclick="sendData()" class="btn btn-danger" id="reportButton" style="width:150px; height:60px; line-height: 50px; 
        font-size:22px; text-align:center; color: white;position:absolute;top:80%;left:31.5%">신고하기</a>
	</body>
</html>