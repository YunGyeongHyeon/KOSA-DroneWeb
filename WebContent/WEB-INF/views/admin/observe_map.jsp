<%@ page contentType="text/html; charset=UTF-8"%>
<head>
<style>
	#map {
		height: 720px; 
		width: 900px;
	}
</style>
</head>
<body>
	<input type="hidden" id="sum"/>
	<div id="map"></div>
	<script>
		// Initialize and add the map
		function initMap() {
			var icon = {
					url : 'http://localhost:8085/FinalWebProject/resources/image/fire3.png',
					scaledSize : new google.maps.Size(100, 100)
				}
		  // The location of Uluru
		  var uluru = {lat:${lat}, lng: ${lon}};
		  // The map, centered at Uluru
		  var map = new google.maps.Map(
		      document.getElementById('map'), {zoom: 15, center: uluru});
		  // The marker, positioned at Uluru
		  var path = ${path}
		  var marker = new google.maps.Marker({position: uluru, map: map, icon: icon});
	      var flightPlanCoordinates = [];
	      
		  for(var i=1;i<path.length;i++){
			  var json = JSON.stringify(path[i]);
			  localStorage.setItem("line", json);

			  // Retrieving data:
			  text = localStorage.getItem("line");
			  obj = JSON.parse(text);
				flightPlanCoordinates.push({lat: obj.x, lng:obj.y});
			  if(i==1){
				new google.maps.Marker({position:{lat:obj.x, lng: obj.y}, map:map, label:"Start"});
			  }
			  if(i==path.length-2){
				  break;
			  }
			  else{
				new google.maps.Marker({position:{lat:obj.x, lng: obj.y}, map:map});				  
			  }
				

		  }
		  
			 var flightPath = new google.maps.Polyline({
		          path: flightPlanCoordinates,
		          geodesic: true,
		          strokeColor: '#FF0000',
		          strokeOpacity: 1.0,
		          strokeWeight: 2
		        });
	        flightPath.setMap(map);
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap">
	</script>
</body>