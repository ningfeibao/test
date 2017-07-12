<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<script type="text/javascript" src="${PATH}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
			<div class="col-md-12" align="center">
				<h2>员工管理系统</h2>
			</div>
		</div>
		<form class="form-horizontal col-sm-offset-3" action="login" method="post">
			<div class="form-group" align="center">
				<label for="account" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;&nbsp;户：</label>
				<div class="col-sm-5">
					<input type="text" name="account" class="form-control" id="account">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
				<div class="col-sm-5">
					<input type="password" name="password" class="form-control"
						id="password">
				</div>
			</div>
			<div class="form-group">
				<label for="captcha" class="col-sm-2 control-label">验证码：</label>
				<div class="col-sm-2">
					<input type="text" name="captcha" class="form-control" id="captcha">
				</div>
				<div class="col-sm-3">
					<img id="img" src="captchaImg" onclick="changeImg()" /> <a href="javascript:void(0)"
						style="margin-left: 20px;" onclick="changeImg()">换一张</a>
				</div>
			</div>
			<div class="form-group" style="margin-top: 20px;">
				<div class="col-sm-offset-3 col-sm-8">
					<span style="color: red;">${sessionScope.error }</span>
				</div>
			</div>
			<div class="form-group" style="margin-top: 20px;">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-primary" id="loginBtn">登陆</button>
					<button style="margin-left: 60px;" disabled="disabled"
						type="button" class="btn btn-primary">注册</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		//验证码换一张
		function changeImg() {
			var img = document.getElementById("img");
			img.src = "captchaImg?date=" + new Date();
		}
	</script>
</body>
</html>