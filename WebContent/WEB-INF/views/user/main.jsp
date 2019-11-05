<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fire Water Boom</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/resources/css/custom-responsive-style.css">
    <script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/all-plugins.js"></script>
    <script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/plugin-active.js"></script>
</head>
<body data-spy="scroll" data-target=".main-navigation" data-offset="150">
    <section id="MainContainer">
        <section id="HeroBanner"> 
            <div class="hero-content">
                <p style="font-size: 70px;">드론특공대</p>
                <p style="font-size: 28px;">산불 화재 신고 사이트 입니다.<br/><span style="color:red">산불이 발생한 위치</span>를 선택해주세요.<br/>소방 드론이 출동합니다.</p> 
                <a href="map" class="hero-cta"><img style="width:140px;" src="<%=application.getContextPath() %>/resources/image/drone_logo.png"><br/><span style="color:red">화재 신고하기</span></a>
            </div>
        </section>
        </section>
 </body>

</html>    