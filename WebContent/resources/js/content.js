var labels = 'FH';
var labelIndex = 0;
function initMap() {
	  var myLatLng = {lat: 37.494953, lng: 127.122557};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: myLatLng
	  });
	  
	/*  google.maps.event.addListener(map, 'click', function(event) {
		    addMarker(event.latLng, map);
		  });*/
		  // Add a marker at the center of the map.
		 addMarker(myLatLng, map);
	}
function addMarker(location, map) {    
	if(labelIndex != 0){
		marker.setMap(null);
	}
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    marker = new google.maps.Marker({
      position: location,
      label: "FH",
      map: map
    });
    
    // lat, lon data information
    lat = marker.position.lat();
    lon = marker.position.lng();
  }

function listClick(lat,lon){
	uluru = {lat: lat, lng:lon};
	var map = new google.maps.Map(
		      document.getElementById('map'), {zoom: 15, center: uluru});
		 
	        // Add a marker at the center of the map.
	        addMarker(uluru, map);
}
