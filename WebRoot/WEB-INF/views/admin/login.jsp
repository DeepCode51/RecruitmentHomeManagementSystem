<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<%
	String root = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: url(<%=root%>/common/images/bj.jpg) top left no-repeat;
}
</style>

<script type="text/javascript" src="<%=root%>/common/js/jquery-1.9.1.js"></script>

<script type="text/javascript">
	function doLogin() {
		var username = $('#username').val();
		var password = $('#password').val();
		if (username == null || username == "") {
			alert("请输入用户名");
			return;
		}
		if (password == null || password == "") {
			alert("请输入密码");
			return;
		}
		$.ajax({
			url : "<%=root%>/doAdminLogin",
			type : "post",
			dataType : "json",
			data : {
				"username" : username,
				"pwd" : password
			},
			success : function(data, textStatus, jqXHR) {
				if (data.status == 200) {
					//window.location.href = "/fkqb/login/goMain";
					window.parent.location.href = "<%=root%>/admin/goMain";
				} else {
					alert("用户名或密码错误 ");
				}

			},
			error : function() {
				alert('系统异常');
			}
		});
	}
</script>

</head>

<body>
	<div style=" width:502px; height:333px; margin:0 auto; background:url(<%=root%>/common/images/dlbj.png) no-repeat; margin-top:200px; overflow:hidden;">
		<div style="width: 370px; height: 47px; overflow: hidden; margin: 0 auto; margin-top: 64px; margin-bottom: 22px;">
			<img src="<%=root%>/common/images/yhm.jpg" style="float: left;">
			<input id="username" name="" type="text"
				style="float: left; width: 310px; padding-left: 10px; height: 47px; line-height: 47px; font-size: 14px; color: #666; background: #FFF; border: 0; display: block;"
				placeholder="输入用户名"  value="admin"/>
		</div>
		<div style="width: 370px; height: 47px; overflow: hidden; margin: 0 auto; margin-bottom: 22px;">
			<img src="<%=root%>/common/images/mm.jpg" style="float: left;">
			<input id="password" name="" type="password"
				style="float: left; width: 310px; padding-left: 10px; height: 47px; line-height: 47px; font-size: 14px; color: #666; background: #FFF; border: 0; display: block;"
				placeholder="输入密码" value="123456" />
		</div>
		<img src="<%=root%>/common/images/dl.png"
			style="width: 224px; height: 40; display: block; margin: 0 auto; margin-top: 53px; border: 0; cursor: pointer;"
			onclick="doLogin();">
	</div>
</body>
</html>
