<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/bootstrap-3.3.2-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css"href="<%=application.getContextPath()%>/resources/css/content.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA6QqekZ1wnL7A8e0nPlnEsHowprAdcm8c&callback=initMap">
</script>
<style type="text/css">
#contentPaging {
    position: absolute;  
    bottom: 10px;
}
</style>

<script type="text/javascript">
	function missionMap(){
		$.ajax({
			url:"observe_map",
			success : function(data){
				$("#obPicture").html(data);
			},
			error:function(){
				alert("에러");
			}
		});
	}
	
	function obBoardPicture(data) {
		$.ajax({
			url:"obBoardPicture?report_no="+data,
			data: data,
			success: function(data){
				$("#obPicture").html(data);
			}
		});
	}
	
	//화면 숨김
	$(document).ready(function(){
		$('.bb').hide();
	});
	
	function doShow() { 
		 $('.bb').show(); // 클래스값을 받아서 보이기
		 $('.aa').hide(); // 클래스값을 받아서 숨기기 
	} 
	
	function dohide(){
		$('.bb').hide(); // 클래스값을 받아서 숨기기
		$('.aa').show(); // 클래스값을 받아서 보이기 
	}
	//화면 숨김
	
</script>

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
						<th class="panel panelbody" scope="col">사건 확인</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obBoardList" items="${obBoardList}" varStatus="status">
						<tr>
							<td>${station.fire_station_name}</td>
							<td>${obBoardList.report_no}</td>
							<td>${obBoardList.report_date}</td>
							<td>${obBoardList.report_lat}</td>
							<td>${obBoardList.report_lon}</td>
							<td>
								<button class="btn btn-primary" onclick="listClick(${obBoardList.report_lat}, ${obBoardList.report_lon}); doShow()">경로 확인</button><br/>
								<button class="btn btn-success" onclick="obBoardPicture(${obBoardList.report_no});dohide()">사진 확인</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<!--페이징  -->
						<div id="contentPaging">
							<div>
								<button class="btn btn-primary" onclick="moving('obBoard?pageNo=1')">처음</button>
								<c:if test="${groupNo>1}">
									<button class="btn btn-success" onclick="moving('obBoard?pageNo=${startPageNo-1}')">이전</button>
								</c:if>
								<div style="display: inline-block; padding: 20px;"class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div>
										<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
											<c:if test="${pageNo==i}">
												<button onclick="moving('obBoard?pageNo=${i}')" class="btn btn-danger active">${i}</button>
											</c:if>
											<c:if test="${pageNo!=i}">
												<button onclick="moving('obBoard?pageNo=${i}')" class="btn btn-secondary">${i}</button>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<c:if test="${groupNo<totalGroupNum}">
									<button onclick="moving('obBoard?pageNo=${endPageNo+1}')" class="btn btn-success">다음</button>
								</c:if>
								<button onclick="moving('obBoard?pageNo=${totalPageNum}')" class="btn btn-primary">맨끝</button>
							</div>
						</div>
						<!--페이징  -->
					</tr>
				</tbody>
			</table>
			<div class="aa" id=obPicture style="vertical-align: middle; text-align: center;"></div>
			<div class="bb" id="map"></div>
		</div>
	</div>
</body>
</html>