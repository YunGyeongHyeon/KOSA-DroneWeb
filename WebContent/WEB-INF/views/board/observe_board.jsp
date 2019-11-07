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
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>
<script type="text/javascript">
	function obBoardPicture(data) {
		$.ajax({
			url:"obBoardPicture?report_no="+data,
			data: data,
			success: function(data){
				$("#obPicture").html(data);
			}
		});
	}
</script>
<title>main Form</title>
</head>
<body>
	<div>
		<!-- 맨위에 로고와 아이디 나오는 부분 -->
		<div>
			<!-- 메인 로고가 들어갈 부분 -->
			<div class="cn_header">
				<div class="cn_logo">
					<table id="cn_top_first">
						<tr>
							<td><img class="cn_logo_img" alt="산림청" src="<%=application.getContextPath()%>/resources/image/drone_logo.png"></td>
						</tr>
					</table>
					<button class="cn_tap" onclick="moving('report')">
						실시간 상황
					</button>
					<button class="cn_tap"  id="cn_picture" onclick="">
						사진첩
						<div id="cn_downBar">
							<div>
								사건
							</div>
							<div>
								정찰
							</div>
						</div>
					</button>
					<!-- 로그인정보: 아이디 비밀번호 수정 로그아웃 -->
					<table id="cn_top_secound">
						<tr class="cn_login_info">
							<td id="cn_login_id">${station.fire_station_name}</td>
							<td id="cn_login_out"><a href="logout"><img src="<%=application.getContextPath()%>/resources/image/out.png"/></a></td>
						</tr>	
					</table>
				</div>
			</div>
		
			<!-- 컨텐츠를 담아놓은 부분 -->
			<div id="ajax">
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
											
							<c:forEach var="obBoardList" items="${obBoardList}" varStatus="status">
								<tr>
									<td>${station.fire_station_name}</td>
									<td><a onclick="obBoardPicture(${obBoardList.report_no})">${obBoardList.report_no}</a></td>
				 					<td>${obBoardList.report_date}</td>
									<td>${obBoardList.report_lat}</td>
									<td>${obBoardList.report_lon}</td>
								</tr>
						 	</c:forEach> 
						</tbody>
					</table>	
					<div id=obPicture style="vertical-align:middle; text-align: center; background-color: blue">
				</div>
				<div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>