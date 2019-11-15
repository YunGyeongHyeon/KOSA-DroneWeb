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
                <p style="font-size:40px;">드론특공대는 <br/>산불 화재만 출동합니다.<br/><span style="color:red">현재 신고 위치는</span><br/><span style="color:red">119</span>로 신고해주세요.</p>
		  		<a href="home" class="hero-cta" ><img style="width:140px;" src="<%=application.getContextPath() %>/resources/image/drone_logo.png"><br/>확인</a>
            </div> 
        </section>
    </section>  
 </body>
</html>