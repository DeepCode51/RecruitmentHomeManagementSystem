<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../base.jsp"%>
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
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/validator.css"></link>
<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/icon.css">
<script type="text/javascript">
	$(document).ready(function(){
	var json={};
        json.id=${info.infoId};
           json.page=1;
           json.rows=9;
		$.ajax({
			url : "<%=path%>/user/findCommondById",
			type : "post",
			dataType : "json",
				data: json,
			success : function(data, textStatus, jqXHR) {
			  	var html = "";
			  	if(data.total==0){

					html+= '<div class="product_item full_width list_type hit m_left_0 m_right_0">'	;
								html+= 	'<figure class="r_corners photoframe tr_all_hover type_2 shadow relative clearfix">';
						html+= 	'<a href="#" class="d_block f_left relative pp_wrap m_right_30 m_xs_right_25">';
										html+='<span class="hot_stripe"><img src="<%=path%>/images/hot_product.png" alt=""></span><img src="<%=path%>/photo/commond.jpg" class="tr_all_hover" alt="">';
							html+='<figcaption><div class="clearfix"><div class="f_left p_list_description f_sm_none w_sm_full m_xs_bottom_10">';
													html+='<hr class="m_bottom_10"><p class="d_sm_none d_xs_block">暂时没有留言.</p></div>';
												html+='</div></div></figcaption></figure></div>';
												
				 $("#commond_list").html(html);
			  	return;
			  	}
              	$.each(data.rows,function(index,value){
					html+= '<div class="product_item full_width list_type hit m_left_0 m_right_0">'	;
								html+= 	'<figure class="r_corners photoframe tr_all_hover type_2 shadow relative clearfix">';
						html+= 	'<a href="#" class="d_block f_left relative pp_wrap m_right_30 m_xs_right_25">';
										html+='<span class="hot_stripe"><img src="<%=path%>/images/hot_product.png" alt=""></span><img src="<%=path%>/photo/commond.jpg" class="tr_all_hover" alt="">';
							html+='<figcaption><div class="clearfix"><div class="f_left p_list_description f_sm_none w_sm_full m_xs_bottom_10">';
												html+='<h4 class="fw_medium"><a href="#" class="color_dark">'+value.username+'</a></h4><div class="m_bottom_10">';
													html+='<hr class="m_bottom_10"><p class="d_sm_none d_xs_block">'+value.content+'</p></div>';
												html+='<div class="f_right f_sm_none t_align_r t_sm_align_l"><p class="scheme_color f_size_large m_bottom_15"><span class="fw_medium">时间'+value.createdate+'</span></p><br class="d_sm_none">';
												html+='</div></div></figcaption></figure></div>';
              	});
         
           $("#commond_list").html(html);
			},
			error : function() {
				alert('系统异常');
			}
		});
		});
		
		function saveCommond(){
var pwd=$('#content').val();
if(pwd==null||pwd==""){
swal("内容不能为空!");
return;
}
		$.ajax({
	          url:"<%=path%>/commond/saveCommond",
	          type:"POST",
	          dataType:"text",
	          data:$("#commondform").serialize(),
	          success:function(data, textStatus, jqXHR){
	          		if(data == 1){
	          			swal("发布成功!");
                  
	          		}else{
	          			swal(data);
	          		}
	          },
	          error:function(){
	           	 	swal("异常信息!");
	          }
	   });	
	}
</script>
	</head>
	<body>
		<!--wide layout-->
		<div class="wide_layout relative">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
						<header>
            <%@ include file="../head.jsp"%>
			</header>
			<!--breadcrumbs-->
			<section class="breadcrumbs">
				<div class="container">
					<ul class="horizontal_list clearfix bc_list f_size_medium">
						<li class="m_right_10 current"><a href="#" class="default_t_color">求职信息<i class="fa fa-angle-right d_inline_middle m_left_10"></i></a></li>
						<li><a href="#" class="default_t_color">信息详情</a></li>
					</ul>
				</div>
			</section>
			<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-9 col-md-9 col-sm-9">
							<h2 class="tt_uppercase color_dark m_bottom_25">标题       ${info.title}</h2>
						 	时间:	   ${info.createdate}
							<div class="clearfix m_bottom_40">
									<p class="m_bottom_10">内容:    	${info.content}</p>
							</div>
							
						</section>
							<div class="col-lg-8 col-md-8 col-sm-8 m_xs_bottom_30">
														<h2> </h2></BR>
									<p class="m_bottom_10">留言 <span class="scheme_color"></span></p>
									
									<!--products list type-->
									<section class="products_container list_type clearfix m_bottom_5 m_left_0 m_right_0" style="margin-bottom: 300px">
										<!--product item-->
										<div id="commond_list"> </div>
									</section>
									
									<form id="commondform">
										<ul>
										<input type="hidden" id="infoId" name="infoId" value=" ${info.infoId}">
								
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">内容</label>
												<textarea id="content" name="content" class="full_width r_corners"></textarea>
											</li>
											<li>
												<button type="button" class="button_type_4 bg_light_color_2 r_corners mw_0 tr_all_hover color_dark" onclick="saveCommond();">发布</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
					</section>
						</div>
						</div>
						
						</div>
						
						</div>
						
						<!--markup footer-->
			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
					<!--social widgets-->
	    <%@ include file="../right.jsp"%>

	
		<!--scripts include-->
		<script src="js/jquery-2.1.0.min.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/retina.js"></script>
		<script src="js/waypoints.min.js"></script>
		<script src="js/jquery.isotope.min.js"></script>
		<script src="js/jquery.tweet.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.custom-scrollbar.js"></script>
		<script src="js/scripts.js"></script>

	</body>
</html>