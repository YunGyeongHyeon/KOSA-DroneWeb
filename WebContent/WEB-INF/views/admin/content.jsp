<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/content.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/paho-mqtt-min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>

<script type="text/javascript">
   function hideButton(clickedId){
      $('#trueReport'+clickedId).hide();
      $('#falseReport'+clickedId).hide();
   } 
   
   $(function() {
      //MQTT Broker와 연결하기
      client = new Paho.MQTT.Client(location.hostname, 61625, "clientId"+new Date().getTime()); 
      client.onMessageArrived = onMessageArrived; 
      client.connect({
         onSuccess : onConnect
      });
   });
   
   //연결이 완료되었을 때 자동으로 실행(콜백)되는 함수
   function onConnect() {
      client.subscribe("/drone/service2/sub");
   }
   
   //메시지를 수신했을 때 자동으로 실행(콜백)되는 함수
   function onMessageArrived(message) {
      location.href="content";
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
							<td><a href="" onclick="moving('report?pageNo=1')"><img class="cn_logo_img" src="<%=application.getContextPath()%>/resources/image/symbol.png"></a></td>
						</tr>
					</table>
					<button class="cn_tap" onClick="moving('report?pageNo=1')">실시간 상황</button>
					<button class="cn_tap" id="cn_picture">
						사건일지
						<div id="cn_downBar" id="buttonTab">
							<div class="layer" onclick="moving('acBoard')">실제사건</div>
							<div class="layer" onclick="moving('obBoard')">허위신고</div>
						</div>
					</button>
					<!-- 로그인정보: 아이디 비밀번호 수정 로그아웃 -->
					<table id="cn_top_secound">
						<tr class="cn_login_info">
							<td id="cn_login_id">${station.fire_station_name}</td>
							<td id="cn_login_out"><a href="logout"><img src="<%=application.getContextPath()%>/resources/image/out.png" /></a></td>
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
							<%int i = 1;%>
							<c:forEach var="board" items="${board}">
								<tr class="selectLine" onclick="listClick(${board.report_lat}, ${board.report_lon})">
									<td class="lat" scope="col">${board.report_lat}</td>
									<td class="lon" scope="col">${board.report_lon}</td>
									<td class="" scope="col">${board.report_date}</td>
									<td class="dStart" scope="col">
										<button class="btn btn-danger">드론출동</button></td>
									<td class="" scope="col" >
										<form action="handle" method="post" onsubmit="return hideButton(<%=i%>)">
											<c:if test="${board.report_handle=='N'}">
												<input type="hidden" name="reportNo" value="${board.report_no}" />
												<input type="submit" name="Y" class="btn btn-primary" id="trueReport<%=i%>" onclick="hideButton(<%=i%>)" value="실제사고" /><br />
												<input type="submit" name="R" class="btn btn-success" id="falseReport<%=i%>" onclick="hideButton(<%=i%>)" value="허위신고" />
											</c:if>
											<c:if test="${board.report_handle=='Y'}">
												<h4 style="color:red">실제사고</h4>
											</c:if>
											<c:if test="${board.report_handle=='R'}">
												<h4>허위신고</h4>
											</c:if>
										</form>
									</td>
								</tr>
								<%i++;%>
							</c:forEach>
							<tr>
								<!--페이징  -->
								<div id="contentPaging">
									<div>
										<button class="btn btn-primary" onclick="moving('report?pageNo=1')">처음</button>
										<c:if test="${groupNo>1}">
											<button class="btn btn-success" onclick="moving('report?pageNo=${startPageNo-1}')">이전</button>
										</c:if>
										<div style="display: inline-block; padding: 20px;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
											<div>
												<c:forEach begin="${startPageNo}" end="${endPageNo}" var="j">
													<c:if test="${pageNo==j}">
														<button onclick="moving('report?pageNo=${j}')" class="btn btn-danger active">${j}</button>
													</c:if>
													<c:if test="${pageNo!=j}">
														<button onclick="moving('report?pageNo=${j}')" class="btn btn-secondary">${j}</button>
													</c:if>
												</c:forEach>
											</div>
										</div>
										<c:if test="${groupNo<totalGroupNum}">
											<button onclick="moving('report?pageNo=${endPageNo+1}')" class="btn btn-success">다음</button>
										</c:if>
										<button onclick="moving('report?pageNo=${totalPageNum}')" class="btn btn-primary">맨끝</button>
									</div>
								</div>
								<!--페이징  -->
							</tr>
						</tbody>
					</table>
					<div>
						<div id="this"></div>
						<div id="map"></div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>