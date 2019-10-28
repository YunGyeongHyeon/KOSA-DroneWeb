<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath() %>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<style>
			#background{
				background-image: url('<%=application.getContextPath() %>/resources/image/400x600.jpg');
				backgorund-repeat: no-repeat;
			}
			#fire_button{
				margin-left: 25%;
				margin-top: 120%;
			}
		</style>
	</head>

	<body id=background style="width:100%;">
		<div id=fire_button>
			<a href="map" class="btn btn-danger" style="width:200px; height:80px;  line-height: 70px;">화재 위치 선택</a>
		</div>
	</body>
</html>