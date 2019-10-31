<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div style="vertical-align:middle;">
<c:forEach begin="1" end="9" var="i">
	<img src="<%=application.getContextPath()%>/resources/obpicture/3.jpg" width="240px" height="240px"/>
	</c:forEach>
</div>

</body>
</html>