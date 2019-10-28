<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap">
</script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js">

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
							<td><img class="side-right cn_logo_img" alt="산림청" src="<%=application.getContextPath()%>/resources/image/logo1.jpg"></td>
							<td><img id="cn_119"class="cn_logo_img" alt="119" src="<%=application.getContextPath()%>/resources/image/logo2.jpg"></td>
						</tr>
					</table>
				
					<!-- 로그인정보: 아이디 비밀번호 수정 로그아웃 -->
					<table id="cn_top_secound">
						<tr class="cn_login_info">	
							<td>소방서 아이디</td>
							<td>로그아웃</td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 컨텐츠를 담아놓은 부분 -->
			<div>
				<div id="map"></div>
				<div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>