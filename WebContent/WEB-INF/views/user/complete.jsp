<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>complete.jsp</title>
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<form>
	  <div class="form-group">
	    <label for="exampleInputEmail1">위도</label>
	    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="위도">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">경도</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="경도">
	  </div>
	  <h5>신고가 접수되었습니다</h5>
	  <a href="#" class="btn btn-secondary">확인</a>
	</form>		
</body>
</html>