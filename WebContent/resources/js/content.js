var labels = '0123456789';
var labelIndex = 0;
function initMap() {
	  var myLatLng = {lat: 37.494953, lng: 127.122557};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: myLatLng
	  });
	  
	  google.maps.event.addListener(map, 'click', function(event) {
		    addMarker(event.latLng, map);
		  });

		  // Add a marker at the center of the map.
		  addMarker(myLatLng, map);
	}
function addMarker(location, map) {
	  // Add the marker at the clicked location, and add the next-available label
	  // from the array of alphabetical characters.
	  var marker = new google.maps.Marker({
	    position: location,
	    label: labels[labelIndex++ % labels.length],
	    map: map
	  });
	}