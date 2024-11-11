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
		
		</script>
	</head>
	<body>
							<div class="footer_top_part">
					<div class="container">
						<div class="row clearfix">
							<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
								<h3 class="color_light_2 m_bottom_20">About</h3>
								<p class="m_bottom_25">分享我们的网站，让更多人知道.</p>
								<!--social icons-->
								<ul class="clearfix horizontal_list social_icons">
									<li class="facebook m_bottom_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">Facebook</span>
										<a href="#" class="r_corners t_align_c tr_delay_hover f_size_ex_large">
											<i class="fa fa-facebook"></i>
										</a>
									</li>
									<li class="twitter m_left_5 m_bottom_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">Twitter</span>
										<a href="#" class="r_corners f_size_ex_large t_align_c tr_delay_hover">
											<i class="fa fa-twitter"></i>
										</a>
									</li>
									<li class="linkedin m_bottom_5 m_sm_left_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">LinkedIn</span>
										<a href="#" class="r_corners f_size_ex_large t_align_c tr_delay_hover">
											<i class="fa fa-linkedin"></i>
										</a>
									</li>
									<li class="vimeo m_left_5 m_bottom_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">Vimeo</span>
										<a href="#" class="r_corners f_size_ex_large t_align_c tr_delay_hover">
											<i class="fa fa-vimeo-square"></i>
										</a>
									</li>
									<li class="youtube m_left_5 m_bottom_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">Youtube</span>
										<a href="#" class="r_corners f_size_ex_large t_align_c tr_delay_hover">
											<i class="fa fa-youtube-play"></i>
										</a>
									</li>
									<li class="envelope m_left_5 m_bottom_5 relative">
										<span class="tooltip tr_all_hover r_corners color_dark f_size_small">Contact Us</span>
										<a href="#" class="r_corners f_size_ex_large t_align_c tr_delay_hover">
											<i class="fa fa-envelope-o"></i>
										</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
								<h3 class="color_light_2 m_bottom_20">服务</h3>
								<ul class="vertical_list">
									<li><a class="color_light tr_delay_hover" href="#">网站导航<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">服务声明<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">关于我们<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">加入我们<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">我的帮助<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">合作伙伴<i class="fa fa-angle-right"></i></a></li>
								</ul>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
								<h3 class="color_light_2 m_bottom_20">信息</h3>
								<ul class="vertical_list">
									<li><a class="color_light tr_delay_hover" href="#">媒体报道<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">新的机遇<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">热门岗位<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">最新消息<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">岗位分析<i class="fa fa-angle-right"></i></a></li>
									<li><a class="color_light tr_delay_hover" href="#">面试帮助 &amp; <i class="fa fa-angle-right"></i></a></li>
								</ul>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3">
								<h3 class="color_light_2 m_bottom_20">关注我们</h3>
								<p class="f_size_medium m_bottom_15">请把你的邮箱发送给我们,当有最新招聘信息时会及时通知您!</p>
								<form id="newsletter">
									<input type="email" placeholder="您的邮箱地址" class="m_bottom_20 r_corners f_size_medium full_width" name="newsletter-email">
									<button type="submit" class="button_type_8 r_corners bg_scheme_color color_light tr_all_hover">发送</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--copyright part-->
				<%-- <div class="footer_bottom_part">
					<div class="container clearfix t_mxs_align_c">
						<p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2016 <span class="color_light">招聘</span>.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>. All Rights Reserved.</p>
						<ul class="f_right horizontal_list clearfix f_mxs_none d_mxs_inline_b">
							<li><img src="<%=request.getContextPath()%>/images/payment_img_1.png" alt=""></li>
							<li class="m_left_5"><img src="<%=request.getContextPath()%>/images/payment_img_2.png" alt=""></li>
							<li class="m_left_5"><img src="<%=request.getContextPath()%>/images/payment_img_3.png" alt=""></li>
							<li class="m_left_5"><img src="<%=request.getContextPath()%>/images/payment_img_4.png" alt=""></li>
							<li class="m_left_5"><img src="<%=request.getContextPath()%>/images/payment_img_5.png" alt=""></li>
						</ul>
					</div>
				</div> --%>
	</body>
</html>