<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table table-sm">
		<thead>
			<tr style="background-color: yellow">
				<th scope="col">화재장소(위도)</th>
				<th scope="col">화제장소(경도)</th>
				<th scope="col">접수시간</th>
				<th scope="col">처리현황</th>
				<th scope="col">신고유형</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${board}">
				<tr>
					<td>${board.report_lat}</td>
					<td>${board.report_lon}</td>
					<td><fmt:formatDate value="${board.report_date}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					<td><button type="button" class="btn btn-warning">드론출동</button></td>
					<td><button type="button" class="btn btn-danger">실제사고</button><br/>
						<button type="button" class="btn btn-primary">허위신고</button>
					</td>
				</tr>
		 	</c:forEach> 
		</tbody>
	</table>	
</body>
</html>
