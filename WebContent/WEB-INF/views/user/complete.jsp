<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>complete.jsp</title>
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<style type="text/css">
html {
    height: 100%;
}
 
body {
    margin: 0px;
    height: 100%;
    width: 100%;

}
#background{
				background-image: url('<%=application.getContextPath() %>/resources/image/400x600.jpg');
				border: 0;
				padding: 0;
				background-position: center;
				background-size: contain;
				background-repeat: no-repeat;
				width: 100%;
				background-position: 50% 50%;
			}

.layer{
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
  
}

#ment{
  left:40%;
  width:400px;
  text-align:center;
  vertical-align: middle;
  font-size: 100%;
}

#goToMain {
	text-align:center;
	vertical-align: middle;
}

</style>
 
<body>
<div id="background" style="width: 100%; height: 100%;">
	<div class="layer">
		<div class="input-group mb-3">
			 <input style="height:100px; text-align: center; background-color:white" type="text" class="form-control" placeholder="위도" value="<%= request.getParameter("lat") %>" readonly>
			 <input style="height:100px; text-align: center; background-color:white" type="text" class="form-control" placeholder="경도" value="<%= request.getParameter("lon") %>" readonly>
		</div>
		<div id="ment" style="background-color:green; text-align:center;">
			<h1 class="ment" style="height:100px; color:white; padding-top:28px;">신고가 접수되었습니다</h1>
		</div>
		<div id="goToMain" >
		  	<a href="http://192.168.2.7:8080/FinalWebProject/" class="btn btn-success"
		  	style="width:150px; height:70px;  line-height: 60px; margin-top:30%; font-size:35px;">확인</a>
		</div>	
	</div>
	</div>
</body>     

</html>  