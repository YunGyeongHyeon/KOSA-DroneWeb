<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>
<script src="https://code.jquery.com/jquery=3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function obBoardPicture() {
	$.ajax({
		url:"obBoardPicture",
		data: {report_no:obBoardList.report_no},
		success: function(data){
			$("#obPicture").html(data);
		}
	})
	
}


</script>
<title>main Form</title>
</head>
<body>
	<div id="wraper">
		<!-- 맨위에 로고와 아이디 나오는 부분 -->
		<div>
			<!-- 메인 로고가 들어갈 부분 -->
			<div class="cn_header">
				<div class="cn_logo">
					<table id="cn_top_first">
						<tr>
							<td><img class="side-right cn_logo_img" alt="산림청" src="<%=application.getContextPath()%>/resources/image/logo1.png"></td>
							<td><img id="cn_119"class="cn_logo_img" alt="119" src="<%=application.getContextPath()%>/resources/image/logo2.png"></td>
						</tr>
					</table>
				
					<!-- 로그인정보: 아이디 비밀번호 수정 로그아웃 -->
					<table id="cn_top_secound">
						<tr class="cn_login_info">
							<td id="cn_login_id">${station.fire_station_name}</td>
							<td id="cn_login_out"><a href="logout">로그아웃</a></td>
						</tr>	
					</table>
				</div>
			</div>
			
			<!-- 컨텐츠를 담아놓은 부분 -->
			<div>
				<div id="cn_list">
					<table class="table2 table-sm">
						<thead>
							<tr style="background-color: yellow">
								<th scope="col">소방서</th>
								<th scope="col">사건번호</th>
								<th scope="col">사건날짜</th>
								<th scope="col">화재장소(위도)</th>
								<th scope="col">화제장소(경도)</th>

							</tr>
						</thead>
						<tbody>
											
							<c:forEach var="obBoardList" items="${obBoardList}" varStatus="status">
								<tr>
									<td>${station.fire_station_name}</td>
									<td><a onclick="obBoardPicture()" type="button">${obBoardList.report_no}</a></td>
				 					<td>${obBoardList.report_date}</td>
									<td>${obBoardList.report_lat}</td>
									<td>${obBoardList.report_lon}</td>
								</tr>
						
						 	</c:forEach> 
						</tbody>
					</table>	
					<div>
					<table>
						<tbody>
							<tr>
							<c:forEach var="obBoardPicture" items="${obBoardPicture}">
								<td><img src="<%=application.getContextPath()%>/resources/obpicture/${obBoardPicture.fire_station_id}.jpg"  width="200px" height="200px"/></td>
							</c:forEach>
							</tr>
						</tbody>
					</table>			
				</div>
				<div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>