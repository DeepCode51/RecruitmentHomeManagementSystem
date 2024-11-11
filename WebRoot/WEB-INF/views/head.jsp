<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
	<head>
		<title>招聘之家</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/images/fav.ico">
		<!--stylesheet include-->
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/camera.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/owl.carousel.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/owl.transitions.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/jquery.custom-scrollbar.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/css/style.css">
		<script src="<%=request.getContextPath()%>/common/sweet/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/sweet/sweet-alert.css">
		<!--font include-->
		<link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript">
		 function login(){
		var username = $('#username').val();
		var password = $('#pwd').val();
		if (username == null || username == "") {
			swal("请输入用户名");
			return;
		}
		if (password == null || password == "") {
			swal("请输入密码");
			return;
		}
		var str= "<%=request.getContextPath()%>/doLogin?username="+username+"&pwd="+password;
		swal(str);
		$.ajax({
			url : str,
			type : "get",
			dataType : "json",
			success : function(data, textStatus, jqXHR) {
				if (data.status == 200) {
                 alert(data.content);					
				} else {
					alert("用户名或密码错误 ");
				}

			},
			error : function() {
				alert('系统异常');
			}
		});
	}
	function goRegister(status){
	 if(status==1){
	  window.location.href = "<%=request.getContextPath()%>/user/goEmp";
	 }
	 else{
	 window.location.href = "<%=request.getContextPath()%>/user/goCompany";
	 }
	}
			function showNo(){
		swal("该功能暂时还未开通!敬请期待!");
		}
		function doSearch(){
			var search = $('#search1').val();
		window.location.href = "<%=request.getContextPath()%>/user/goJobList2?param="+search;	
		}
		</script>
		
	</head>
	<body>
				<!--header top part-->
				<section class="h_top_part">
					<div class="container">
						<div class="row clearfix">
							<div class="col-lg-4 col-md-4 col-sm-5 t_xs_align_c">
								
				<c:if test="${user==null}">
									
		<p class="f_size_small">欢迎你<a href="<%=request.getContextPath()%>/goLogin" >登入</a> or <a href="<%=request.getContextPath()%>/user/goCompany">注册</a> </p>

		</c:if>

		<c:if test="${user!=null}">
		 <p class="f_size_small"><b>您好${user.username }
						，欢迎光临招聘之家</b> ||&nbsp;<a href="<%=request.getContextPath()%>/logout" >登出</a></p>
		
		</c:if>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-2 t_align_c t_xs_align_c">
								<p class="f_size_small">免费电话 <b class="color_dark">(123) 456-7890</b></p>
							</div>
								<c:if test="${user!=null}">
							<nav class="col-lg-4 col-md-4 col-sm-5 t_align_r t_xs_align_c">
								<ul class="d_inline_b horizontal_list clearfix f_size_small users_nav">
									<li><a href="<%=request.getContextPath()%>/user/goUserInfo" class="default_t_color">我的信息</a></li>
									<!-- <li><a href="#" class="default_t_color">浏览历史</a></li> -->
								</ul>
							</nav>
									</c:if>
						</div>
					</div>
				</section>
				<!--header bottom part-->
				<section class="h_bot_part container">
					<div class="clearfix row">
						<div class="col-lg-6 col-md-6 col-sm-4 t_xs_align_c">
							<a href="<%=request.getContextPath()%>/goMain" class="logo m_xs_bottom_15 d_xs_inline_b">
								<img src="<%=request.getContextPath()%>/images/logo.png" alt="">
							</a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-8 t_align_r t_xs_align_c">
							<ul class="d_inline_b horizontal_list clearfix t_align_l site_settings">
								<!--like-->
								<!-- <li>
									<a role="button" href="#" class="button_type_1 color_dark d_block bg_light_color_1 r_corners tr_delay_hover box_s_none"><i class="fa fa-heart-o f_size_ex_large"></i><span class="count circle t_align_c">12</span></a>
								</li>
								<li class="m_left_5">
									<a role="button" href="#" class="button_type_1 color_dark d_block bg_light_color_1 r_corners tr_delay_hover box_s_none"><i class="fa fa-files-o f_size_ex_large"></i><span class="count circle t_align_c">3</span></a>
								</li> -->
								<!--language settings-->
								<li class="m_left_5 relative container3d">
									<a role="button" href="#" class="button_type_2 color_dark d_block bg_light_color_1 r_corners tr_delay_hover box_s_none" id="lang_button"><img class="d_inline_middle m_right_10 m_mxs_right_0" src="<%=request.getContextPath()%>/images/flag_cc.jpg" alt=""><span class="d_mxs_none">中文</span></a>
									<ul class="dropdown_list top_arrow color_light">
										<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<%=request.getContextPath()%>/images/flag_en.jpg" alt="">English</a></li>
								<%-- 		<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<%=request.getContextPath()%>/images/flag_fr.jpg" alt="">French</a></li>
										<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<%=request.getContextPath()%>/images/flag_g.jpg" alt="">German</a></li>
										<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<%=request.getContextPath()%>/images/flag_i.jpg" alt="">Italian</a></li>
										<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<%=request.getContextPath()%>/images/flag_s.jpg" alt="">Spanish</a></li> --%>
									</ul>
								</li>

								<!--shopping cart-->
						
							</ul>
						</div>
					</div>
				</section>
				<!--main menu container-->
				<section class="menu_wrap relative">
					<div class="container clearfix">
						<!--button for responsive menu-->
						<button id="menu_button" class="r_corners centered_db d_none tr_all_hover d_xs_block m_bottom_10">
							<span class="centered_db r_corners"></span>
							<span class="centered_db r_corners"></span>
							<span class="centered_db r_corners"></span>
						</button>
						<!--main menu-->
						<nav role="navigation" class="f_left f_xs_none d_xs_none">	
							<ul class="horizontal_list main_menu clearfix">
								<li class="current relative f_xs_none m_xs_bottom_5"><a href="<%=request.getContextPath()%>/goMain" class="tr_delay_hover color_light tt_uppercase"><b>首页</b></a>

								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="#" class="tr_delay_hover color_light tt_uppercase"><b>职位列表</b></a>
																	<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
										<ul class="sub_menu">
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/user/goJobList">企业职位列表</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/user/goInfoList">求职列表</a></li>
						
										</ul>
									</div>
								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="#" class="tr_delay_hover color_light tt_uppercase"><b>求职者点我</b></a>
									<!--sub menu-->
									<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
										<ul class="sub_menu">
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/info/goAddInfo">发布求职信息</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/info/goMyInfo">我的求职信息</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/emp/goEmpInfo">我的信息</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/emp/goHistoryJobList">浏览职位历史</a></li>
											<!-- <li><a class="color_dark tr_delay_hover" href="javascript: void(0);"  onclick="showNo();">我的收藏</a></li> -->
										</ul>
									</div>
								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="#" class="tr_delay_hover color_light tt_uppercase"><b>企业用户点我</b></a>
									<!--sub menu-->
									<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
										<ul class="sub_menu">
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/job/goSaveJob">发布招聘信息</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/job/goComJobList">招聘信息管理</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/com/goCompanyInfo">企业信息管理</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/info/goAddInfo">发布信息</a></li>
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/">应聘人员查看</a></li>
										</ul>
									</div>
								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="#" class="tr_delay_hover color_light tt_uppercase"><b>博客</b></a>
									<!--sub menu-->
									<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
										<ul class="sub_menu">
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/blog/goBlog">职场博客</a></li>
											<!-- <li><a class="color_dark tr_delay_hover" href="javascript: void(0);"  onclick="showNo();">我的博客</a></li> -->
										</ul>
									</div>
								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="#" class="tr_delay_hover color_light tt_uppercase"><b>知名企业</b></a>
									<!--sub menu-->
									<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
										<ul class="sub_menu">
											<li><a class="color_dark tr_delay_hover" href="<%=request.getContextPath()%>/com/goAllCompany">查看知名企业</a></li>
											<!-- <li><a class="color_dark tr_delay_hover" href="javascript: void(0);"  onclick="showNo();">我收藏的企业</a></li> -->
										</ul>
									</div>
								</li>
								<li class="relative f_xs_none m_xs_bottom_5"><a href="<%=request.getContextPath()%>/blog/goContactUs" class="tr_delay_hover color_light tt_uppercase"><b>联系我们</b></a></li>
							</ul>
						</nav>
						<button class="f_right search_button tr_all_hover f_xs_none d_xs_none">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<!--search form-->
					<div class="searchform_wrap tf_xs_none tr_all_hover">
						<div class="container vc_child h_inherit relative">
							<form role="search" class="d_inline_middle full_width">
								<input type="text" name="search" id="search1" placeholder="请输入您要搜索的内容" class="f_size_large" onblur="doSearch();">
							</form>
							<button class="close_search_form tr_all_hover d_xs_none color_dark">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
				</section>
	</body>
</html>