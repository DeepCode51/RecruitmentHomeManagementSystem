<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%    
	String root = request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>校园招聘管理系统后台</title>
		<script type="text/javascript" src="<%=root%>/common/js/jquery-1.9.1.js"></script>
		<link rel="shortcut icon" href="<%=root%>/common/images/head.jpg">
		<!-- jquery easyui -->
		<link rel="stylesheet" type="text/css"
			href="<%=root%>/common/js/easyui/themes/dayun/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="<%=root%>/common/js/easyui/themes/icon.css">
		<script type="text/javascript"
			src="<%=root%>/common/js/easyui/js/jquery.easyui.min.js">
</script>
		<script type="text/javascript"
			src="<%=root%>/common/js/easyui/js/easyui-lang-zh_CN.js">
</script>
		<script type="text/javascript"
			src="<%=root%>/common/js/easyui/validate/easyui_validate.js">
</script>
		<link rel="stylesheet" type="text/css"
			href="<%=root%>/common/css/style1.css">
		<script type="text/javascript" src="<%=root%>/common/js/main.js">
</script>
		<style type="text/css">
.west {
	width: 100px;
	padding: 10px;
}

.north {
	height: 100px;
}

li {
padding:10px;
	list-style-type: square;
}

A:link {
	color: black;
	text-decoration: none
}

A:visited {
	color: red;
	text-decoration: none
}

A:hover {
	color: green;
	text-decoration: none
}
</style>
		<script type="text/javascript">
function logout() {
	window.location.href = "/recruit";
}
function first() {
	$('#tabs').tabs('select', 0);
}
function currentTime() {
	var d = new Date(), str = '';
	str += d.getFullYear() + '年';
	str += d.getMonth() + 1 + '月';
	str += d.getDate() + '日';
	str += d.getHours() + '时';
	str += d.getMinutes() + '分';
	str += d.getSeconds() + '秒';
	return str;
}
setInterval(function() {
	$('#time').html(currentTime)
}, 1000);
</script>
	</head>
	<!-- 设置了class就可在进入页面加载layout -->
	<body class="easyui-layout">
		<!-- 正上方panel -->
		<div region="north" style="padding: 10px;">
			<div class="top">
				<img src="/recruit/common/images/sheep.jpeg"
					style="width: 35px; height: 40px;" />
				<div class="top_title">
					<span>欢迎使用人员招聘管理系统后台</span>
				</div>
				<div>
					<div id="time" class="time">

					</div>
				</div>
				<div class="exit">
					<a href="javascript:void(0);" onclick="logout();"> <img
							src="/recruit/common/images/exit.jpg" /> <span>退出</span> </a>
					<a href="javascript:void(0);" onclick="first();"> <img
							src="/recruit/common/images/index.jpg" /> <span>返回首页</span> </a>
				</div>
			</div>
		</div>
		<!-- 正左边panel -->
		<div region="west" title="菜单栏" split="true"
			style="width: 280px; padding1: 1px; overflow: hidden;" id="westPanel">
			<div class="easyui-accordion" fit="true" border="false">
				<!-- selected -->
				<div title="用户管理" selected="false">
					<ul>
						<li>
							<a
								href="javascript:addTab('tabId_loginInfo','求职者管理','<%=root%>/admin/goEmps');">求职者管理</a>
						</li>
						<li>
							<a
								href="javascript:addTab('tabId_privilege','企业管理','<%=root%>/admin/goComs');">企业管理</a>
						</li>
					</ul>
				</div>
				
								<div title="信息监督" selected="false">
					<ul>
						<li>
							<a
								href="javascript:addTab('tabId_loginInfo','职位监督','<%=root%>/admin/goJobs');">职位监督</a>
						</li>
						<li>
							<a
								href="javascript:addTab('tabId_privilege','论坛监督','<%=root%>/admin/goInfos');">论坛监督</a>
						</li>
					</ul>
				</div>


			</div>
		</div>
		<!-- 正中间panel -->
		<div region="center" title="功能区">
			<div class="easyui-tabs" id="centerTab" fit="true" border="false">
				<div title="欢迎页" style="padding: 20px; overflow: hidden;">
					<div style="margin-top: 0px;">
						<h3>
							<img alt="" src="/recruit/common/images/fox3.jpg"
								style="width: 1100px; height: 400px;">
						</h3>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
