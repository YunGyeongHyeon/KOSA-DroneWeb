<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var labels = 'FH';
var labelIndex = 0;

$(document).ready(function(){
    initMap()
});

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
$(document).ready(function(){
	$(".selectLine").click(function(){
		$(this).siblings().children("td").removeClass("select")
		$(this).children("td").toggleClass("select")
	})
})

</script>
<div id="cn_list">
	<table class="table table-striped table-sm table2">
		<thead>
			<tr class="panel panel-title">
				<th class="panel panelbody" scope="col">화재장소(위도)</th>
				<th class="panel panelbody" scope="col">화제장소(경도)</th>
				<th class="panel panelbody" scope="col">접수시간</th>
				<th class="panel panelbody" scope="col">처리현황</th>
				<th class="panel panelbody" scope="col">신고유형</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board}">
				<tr class="selectLine"
					onclick="listClick(${board.report_lat}, ${board.report_lon})">
					<td class="" scope="col">${board.report_lat}</td>
					<td class="" scope="col">${board.report_lon}</td>
					<td class="" scope="col">${board.report_date}</td>
					<td class="" scope="col"><button class="btn btn-warning">드론출동</button></td>
					<td class="" scope="col"><button class="btn btn-danger">실제사고</button>
						<br />
						<button class="btn btn-primary">허위신고</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="map"></div>
</div>