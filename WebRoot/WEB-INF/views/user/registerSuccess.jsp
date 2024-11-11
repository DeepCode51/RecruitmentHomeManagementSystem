<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../base.jsp"%>

<!doctype html>
	<head>
				<title>招聘之家</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/validator.css"></link>
			<link type="text/css" rel="stylesheet" href="<%=path%>/css/famouse.css"></link>
	</head>
	<body>
			<!--wide layout-->
		<div class="wide_layout relative">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
	<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<header>
<!--             <%@ include file="../head.jsp"%> -->
			</header>
			
										
		<div>
	<div class="col-lg-8 col-md-8 col-sm-8 m_xs_bottom_30">
									<h2 class="tt_uppercase color_dark m_bottom_25">注册成功</h2>
									
									</div>
		</div>
			<div >
				<div>
					<img
						src="${pageContext.request.contextPath}/common/images/success.jpg" />
				</div>
				<h5>
		<p class="m_bottom_10">	${user.username}， <span class="scheme_color"></span> 欢迎加入招聘之家</p>
				</h5>
				<h6>
				</h6>

				<ul>
					<li >
						您现在可以：
					</li>
					<li>
						进入"
					        	<a href="<%=path%>/user/goUserInfo">我的信息</a>”查看并管理您的个人信息
					</li>
					<li>
					        	<a href="<%=path%>/goMain">浏览信息</a>
					</li>
				</ul>
			</div>
</div></div>
				<!--markup footer-->
			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
					<!--social widgets-->
	    <%@ include file="../right.jsp"%>
	</body>
</html>

