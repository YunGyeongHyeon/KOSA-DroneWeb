<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7fc91c58f8e6b8882e86ec0f088ab95b"></script>
		<script async defer
	   	 	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAy0_KJWjxBnkhGTDY7pTiw-2oHrht5Zjs&callback=initMap">
	    </script>
		<script>
			// Initialize and add the map
			function initMap() {
			  // The location of Uluru
			  var uluru = {lat: 37.495068, lng: 127.122448};
			  // The map, centered at Uluru
			  var map = new google.maps.Map(
			      document.getElementById('map'), {zoom: 15, center: uluru});
			  // The marker, positioned at Uluru
			  var marker = new google.maps.Marker({position: uluru, map: map});
			}
	     </script>
	</head>
	<body>
		<div id="map" style="width:500px;height:400px;"></div>
	</body>
</html>