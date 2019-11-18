<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/content.js"></script>

<script type="text/javascript">
function fnImgPop(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width;
	  var img_height=img.height;
	  var win=img.height;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
	 }
</script>

<title>Insert title here</title>
</head>
<body>
 
<div style="overflow:auto; width:900px; height:720px; vertical-align:middle; position: absolute; left: 950px;" >
	<c:forEach var="picture" items="${acBoardPicture}">
	 	<img id="fnImgPop" class="fnImgPop" src="<%=application.getContextPath()%>/resources/image/${picture.filename}" width="280px" height="240px" onclick="fnImgPop(this.src)"/> 
	</c:forEach>
</div>

</body>
</html>