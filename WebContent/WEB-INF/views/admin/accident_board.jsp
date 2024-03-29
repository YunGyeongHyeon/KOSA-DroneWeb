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

<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>
<style type="text/css">
#contentPaging {
    position: absolute;  
    bottom: 10px;
}
</style>
<script type="text/javascript">

	function acBoardPicture(data) {
		$.ajax({
			url:"acBoardPicture?report_no="+data,
			data: data,
			success: function(data){
				$("#acPicture").html(data);
			}
		});
	}
	function acBoardPath(reportNo, lat2, lon2) {
		$.ajax({
	        type : "POST",
	        url : "accidentMap",
	        data: {
	        	report_no: reportNo,
	        	lat: lat2,
	        	lon: lon2
	        },
	        dataType : "html",
	        success : function(data) {
	            $('#acPicture').html(data);
	        }
	    });
	}
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
					<c:forEach var="acBoardList" items="${acBoardList}" varStatus="status">
						<tr>
							<td>${station.fire_station_name}</td>
							<td>${acBoardList.report_no}</td>
							<td>${acBoardList.report_date}</td>
							<td>${acBoardList.report_lat}</td>
							<td>${acBoardList.report_lon}</td>
							<td>
								<button class="btn btn-primary" onclick="acBoardPath(${acBoardList.report_no}, ${acBoardList.report_lat}, ${acBoardList.report_lon});">경로 확인</button><br/>
								<button class="btn btn-success" onclick="acBoardPicture(${acBoardList.report_no});">사진 확인</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<!--페이징  -->
						<div id="contentPaging">
							<div>
								<button class="btn btn-primary" onclick="moving('acBoard?pageNo=1')">처음</button>
								<c:if test="${groupNo>1}">
									<button class="btn btn-success" onclick="moving('acBoard?pageNo=${startPageNo-1}')">이전</button>
								</c:if>
								<div style="display: inline-block; padding: 20px;"class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
									<div>
										<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
											<c:if test="${pageNo==i}">
												<button onclick="moving('acBoard?pageNo=${i}')" class="btn btn-danger active">${i}</button>
											</c:if>
											<c:if test="${pageNo!=i}">
												<button onclick="moving('acBoard?pageNo=${i}')" class="btn btn-secondary">${i}</button>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<c:if test="${groupNo<totalGroupNum}">
									<button onclick="moving('acBoard?pageNo=${endPageNo+1}')" class="btn btn-success">다음</button>
								</c:if>
								<button onclick="moving('acBoard?pageNo=${totalPageNum}')" class="btn btn-primary">맨끝</button>
							</div>
						</div>
						<!--페이징  -->
					</tr>
				</tbody>
			</table>
			<div>
					<div class="aa" id=acPicture style="vertical-align: middle; text-align: center;"></div>
			</div>
		</div>
	</div>
</body>
</html>