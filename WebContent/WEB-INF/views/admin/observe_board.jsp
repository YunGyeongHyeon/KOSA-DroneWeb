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
</script>
<style>
	#no{
		height: 400px;  /* The height is 400 pixels */
        width: 50%;  /* The width is the width of the web page */
        padding-bottom:44%;
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
						<th class="panel panelbody" scope="col">사건 확인</th>
					</tr>
				</thead>
					<tbody>
					<c:forEach var="obBoardList" items="${obBoardList}"
						varStatus="status">
						<tr>
							<td>${station.fire_station_name}</td>
							<td>${obBoardList.report_no}</td>
							<td>${obBoardList.report_date}</td>
							<td>${obBoardList.report_lat}</td>
							<td>${obBoardList.report_lon}</td>
							<td>
								<button class="btn btn-primary" onclick="missionMap()">경로
									확인</button> <br />
								<button class="btn btn-success"
									onclick="obBoardPicture(${obBoardList.report_no})">사진
									확인</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div id=obPicture style="vertical-align: middle; text-align: center;"></div>
			<!--페이징  -->
			<div style="display: flex; position: absolute; bottom: 0; left: 12%">
				<div style="flex-grow: 1;">
					<a href="obBoard?pageNo=1" class="btn btn-primary">처음</a>
					<c:if test="${groupNo>1}">
						<a href="obBoard?pageNo=${startPageNo-1}" class="btn btn-success">이전</a>
					</c:if>

					<div style="display: inline-block;" class="btn-toolbar"
						role="toolbar" aria-label="Toolbar with button groups">
						<div class="btn-group mr-2" role="group" aria-label="First group">
							<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
								<!--begin시작과 end끝값을 넣어주면 된다.  -->
								<c:if test="${pageNo==i}">
									<a href="obBoard?pageNo=${i}" class="btn btn-secondary active">${i}</a>
								</c:if>
								<c:if test="${pageNo!=i}">
									<a href="obBoard?pageNo=${i}" class="btn btn-secondary">${i}</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:if test="${groupNo<totalGroupNum}">
						<a href="obBoard?pageNo=${endPageNo+1}" class="btn btn-success">다음</a>
					</c:if>
					<a href="obBoard?pageNo=${totalPageNum}" class="btn btn-primary">맨끝</a>

				</div>
				<!--페이징  -->
				
			</div>
		</div>
	</div>
</body>
</html>