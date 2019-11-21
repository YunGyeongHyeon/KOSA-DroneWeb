<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#contentPaging {
    position: absolute;  
    bottom: 10px;
}
</style>
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
	
	function obBoardPath(reportNo, lat2, lon2) {
		$.ajax({
	        type : "POST",
	        url : "observeMap",
	        data: {
	        	report_no: reportNo,
	        	lat: lat2,
	        	lon: lon2
	        },
	        dataType : "html",
	        success : function(data) {
	            $('#obPicture').html(data);
	        }
	    });
	}
</script>

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
						<button class="btn btn-primary" onclick="obBoardPath(${obBoardList.report_no},${obBoardList.report_lat},${obBoardList.report_lon})">경로 확인</button><br/>
						<button class="btn btn-success" onclick="obBoardPicture(${obBoardList.report_no})">사진 확인</button>
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
</div>
