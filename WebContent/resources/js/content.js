var labels = 'FH';
var labelIndex = 0;


function initMap() {
	  var myLatLng = {lat: 37.494953, lng: 127.122557};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: myLatLng
	  });
		  // Add a marker at the center of the map.
		 addMarker(myLatLng, map);
	}

function addMarker(location, map) {
	var icon ={
			url : 'http://192.168.2.10:8080/FinalWebProject/resources/image/fire3.png',
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
$(document).ready(function(){
	
	$(".selectLine").click(function(){
		$("button").on("click",function(){
			return false;
		})
		$(this).siblings().children("td").removeClass("select")
		$(this).children("td").toggleClass("select")
	})
	$("#cn_picture").hover(function(){
		$(this).children("div").css("display","block");
	},
	function(){
		$(this).children("div").css("display","none");
	}
	)
})

function moving(url){
	$.ajax({
		url:url,
		success : function(data){
			$("#ajax").html(data);
		},
		error:function(){
			alert("에러");
		}
	});
}



