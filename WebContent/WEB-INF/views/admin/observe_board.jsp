<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
	function hi(){
		$("#mapView").attr('id','no');
		
	}
</script>
<style>
	#no{
		width:200px;
		height:200px;
		background-color:white;
	}
</style>
<title>main Form</title>
</head>
<body>
			<!-- 컨텐츠를 담아놓은 부분 -->
			<div id="ajax">
				<div id="cn_list">
					<table class="table table-striped table-sm table2">
						<thead>
							<tr class="panel panel-title">
								<th class="panel panelbody" scope="col">담당 소방서</th>
								<th class="panel panelbody" scope="col">사건 번호</th>
								<th class="panel panelbody" scope="col">접수시간</th>
								<th class="panel panelbody" scope="col">화재장소(위도)</th>
								<th class="panel panelbody" scope="col">화재장소(경도)</th>
								<th class="panel panelbody" scope="col">드론 경로</th>
							</tr>
						</thead>
						<tbody>
											
							<c:forEach var="obBoardList" items="${obBoardList}" varStatus="status">
								<tr>
									<td>${station.fire_station_name}</td>
									<td><a onclick="obBoardPicture(${obBoardList.report_no})">${obBoardList.report_no}</a></td>
				 					<td>${obBoardList.report_date}</td>
									<td>${obBoardList.report_lat}</td>
									<td>${obBoardList.report_lon}</td>
									<td><button class="btn btn-success" onclick="hi()">경로 확인</button></td>
								</tr>
						 	</c:forEach> 
						</tbody>
					</table>	
					<div id=obPicture style="vertical-align:middle; text-align:center;"></div>
					<div id="mapView"></div>
				<div>
				</div>
			</div>
		</div>
</body>
</html>