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
    background-image: url('<%=application.getContextPath() %>/resources/image/400x600.jpg');
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
	<div class="layer" >
		<div class="input-group mb-3">
			 <h1 class="ment" style="height:100px; color:red; padding-top:20px">저희는 산불만 취급합니다</h1>
		</div>
		<div id="goToMain">
		  	<a href="http://192.168.2.7:8080/FinalWebProject/" class="btn btn-secondary">확인</a>
		</div>	
	</div>
</body>     

</html>  