<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/content.css">
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap">
	</script>
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>
	<title>Insert title here</title>
</head>

<body>
		<button type="button" class="btn btn-primary">Primary</button>
		<button type="button" class="btn btn-secondary">Secondary</button>
		<button type="button" class="btn btn-success">Success</button>
		<button type="button" class="btn btn-danger">Danger</button>
		<button type="button" class="btn btn-warning">Warning</button>
		<button type="button" class="btn btn-info">Info</button>
	</body>
</html>