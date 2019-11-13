<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
crossorigin="anonymous">
<title>Login 페이지</title>

<style>
body, html {
	padding: 0;
	height: 100%;
	width: 100%;
	/*  	padding-bottom: 1px; */
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	/* 	background-repeat: no-repeat; */
	background: linear-gradient(to bottom right);
}

#bg {
	border: 0;
	padding: 0;
	background-image:
		url('<%=application.getContextPath()%>/resources/image/gain.jpg');
	/* min-height: 100%; */
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.layer {
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	font-size: 20px;
}

.layer .content {
	display: inline-block;
	vertical-align: middle
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle
}

.card {
	margin: auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	background-color: rgba(255, 255, 255, 0.5);
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 20px;
	font-size: 20px;
}
</style>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<!--절대 경로  -->
<script type="text/javascript">
	function checkForm() {
		var result = true;

		if ($("#fire_station_id").val().length > 3) {
			$("#fire_station_idError").text("*아이디를 제대로 입력해주세요");
			result = false;
			return result;
		}

		if ($("#fire_station_id").length > 3) {
			alert($("#fire_station_id").length);
		}

		//모든 에러 내용 지우기
		$(".error").text("");
		
		//입력값 검사
		if ($("#fire_station_id").val() == "") {
			$("#fire_station_idError").text("*아이디를 입력하세요");
			result = false;
		}
		if ($("#fire_station_password").val() == "") {
			$("#fire_station_passwordError").text("*비밀번호를 입력하세요");
			result = false;
		}
		return result;
	}
</script>
<body id="bg">
	<div class="layer">
		<span class="content">
			<div class="card align-middle" style="width: 40rem; border-radius: 50px; background-color: rgba(255, 255, 255, 0.5)">
				<div class="card-title" style="margin-top: 0px;">
					<h2 class="card-title text-center" style="color: #113366; padding-top: 10px; color: white; font-weight: bold">드론특공대</h2>
				</div>
				<div class="card-body">
					<form class="form-signin" method="POST" action="login" onSubmit="return checkForm()">
						<p align="center">
							<input type="text" id="fire_station_id" name="fire_station_id" class="form-control" placeholder="아이디 입력"
								style="width: 90%; text-align: center; background-color: rgba(255, 255, 255, 0.5)">
							<span id="fire_station_idError" class="error" style="color: red">${fire_station_idError}</span>
						</p>
						<p align="center">
							<input type="password" id="fire_station_password" name="fire_station_password" class="form-control" placeholder="비밀번호 입력"
								style="width: 90%; text-align: center; background-color: rgba(255, 255, 255, 0.5)"><br/>
							<span id="fire_station_passwordError" class="error" style="color: red">${fire_station_passwordError}</span>
						</p>
						<input type="submit" class="btn btn-lg btn-dark btn-block" value="로그인" />
					</form>
				</div>
			</div>
		</span> 
		<span class="blank">
		</span>
	</div>

</body>
</html>