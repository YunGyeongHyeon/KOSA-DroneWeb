<%@ page contentType="text/html; charset=UTF-8"%>
<script>

$(document).ready(function(){
    initMap()
});

function addMarker(location, map) {
	var icon ={
			url : 'http://localhost:8080/FinalWebProject/resources/image/fire3.png',
			scaledSize: new google.maps.Size(100, 100)
	}
	if(labelIndex != 0){
		marker.setMap(null);
	}
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    marker = new google.maps.Marker({
      position: location,
      icon: icon,
      map: map
    });
    // lat, lon data information
    lat = marker.position.lat();
    lon = marker.position.lng();
  }

function listClick(lat,lon){
	uluru = {lat: lat, lng:lon};
	var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: uluru
	  });
	// Add a marker at the center of the map.
	addMarker(uluru, map);
}

</script>

<div id="map"></div>