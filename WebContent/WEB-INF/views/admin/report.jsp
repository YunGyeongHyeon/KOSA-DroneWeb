<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>
<style type="text/css">
.selectLine td{
	height: 85px;
}
.selectLine h4{
	font-weight: bold;
}
#contentPaging {
    position: absolute;  
    bottom: 10px;
}
</style>

<script>
var labels = 'FH';
var labelIndex = 0;

$(document).ready(function(){
    initMap()
});

function initMap() {
	  var myLatLng = {lat: 37.494953, lng: 127.122557};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: myLatLng
	  });
		  // Add a marker at the center of the map.
		 addMarker(myLatLng, map);
	}

function addMarker(location, map) {
	var icon ={
			url : 'http://localhost:8085/FinalWebProject/resources/image/fire3.png',
			scaledSize: new google.maps.Size(100, 100)
	}
	if(labelIndex != 0){
		marker.setMap(null);
	}
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    marker = new google.maps.Marker({
      position: location,
      icon: icon,
      map: map
    });
    // lat, lon data information
    lat = marker.position.lat();
    lon = marker.position.lng();
    
    var location = ${accident.path_point}
  }

function listClick(lat,lon){
	uluru = {lat: lat, lng:lon};
	
	var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 16,
	    center: uluru
	  });
	// Add a marker at the center of the map.
	addMarker(uluru, map);
}
$(document).ready(function(){
	$(".selectLine").click(function(){
		$(this).siblings().children("td").removeClass("select")
		$(this).children("td").toggleClass("select")
	})
})
$(".dStart").on("click",function(){
    	$(this).css("background","gray").css("border-color","gray");
    	$(this).text("출동중");
    	$(this).attr("disabled","true");
    	$(this).parent().parent().children("#displaynone").css("display","none");
    	
})
</script>

<div id="cn_list">
	<table class="table table-striped table-sm table2">
		<thead>
			<tr class="panel panel-title">
				<th class="panel panelbody" scope="col">화재장소(위도)</th>
				<th class="panel panelbody" scope="col">화제장소(경도)</th>
				<th class="panel panelbody" scope="col">접수시간</th>
				<th class="panel panelbody" scope="col">처리현황</th>
			</tr>
		</thead>
		<tbody>
			<%int i = 1;%>
			<c:forEach var="board" items="${board}">
			<c:if test="${board.report_handle.equals('N')}">
				<tr class="selectLine" onclick="listClick(${board.report_lat}, ${board.report_lon})">
					<input type="hidden" class="reportNo" value="${board.report_no}"/>
					<td class="lat" scope="col">${board.report_lat}</td>
					<td class="lon" scope="col">${board.report_lon}</td>
					<td class="reportTime" scope="col">${board.report_date}
					</td>
					<td scope="col">
						<button class="btn btn-danger dStart">드론출동</button>
					</td>
				</tr>
				<%i++;%>
				</c:if>
			</c:forEach>
			<tr>
				<!--페이징  -->
				<div id="contentPaging">
					<div>
						<button class="btn btn-primary" onclick="moving('report?pageNo=1')">처음</button>
						<c:if test="${groupNo>1}">
							<button class="btn btn-success" onclick="moving('report?pageNo=${startPageNo-1}')">이전</button>
						</c:if>
						<div style="display: inline-block; padding: 20px;"class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
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
	<div id="map"></div>
</div>