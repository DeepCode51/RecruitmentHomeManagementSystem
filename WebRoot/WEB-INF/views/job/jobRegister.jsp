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

		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/validator.css"></link>
<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript">
		$(document).ready(function(){
// 	$.formValidator.initConfig({theme:"Default",submitOnce:true,formID:"form1",ajaxForm:{
// 			dataType : "html",
// 			buttons:$("#button"),
// 			url: "http://www.51gh.net/chkuser.aspx?act=ok"
// 		},
// 		onError:function(msg,obj,errorlist){
// 			$("#errorlist").empty();
// 			$.map(errorlist,function(msg){
// 				$("#errorlist").append("<li>" + msg + "</li>")
// 			});
// 			alert(msg);
// 		},
// 		submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
// 	});
$.formValidator.initConfig({formID:"jobform",debug:false,submitOnce:true,
		onError:function(msg,obj,errorlist){
			$("#errorlist").empty();
			$.map(errorlist,function(msg){
				$("#errorlist").append("<li>" + msg + "</li>")
			});
			alert(msg);
		},
		submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
	});

	$("#jobname").formValidator({onShow:"请输入职位名称",onFocus:"用户名至少2个字符,最多30个字符",onCorrect:"该用户名可以注册"}).inputValidator({min:2,max:30,onError:"你输入的用户名非法,请确认"})
	$("#description").formValidator({onShow:"请输入你的描述",onFocus:"描述至少要输入10个汉字或20个字符",onCorrect:"恭喜你,你输对了",defaultValue:"这家伙很懒，什么都没有留下。"}).inputValidator({min:20,onError:"你输入的描述长度不正确,请确认"});
});

function save(){
		$.ajax({
	          url:"<%=path%>/job/saveJob",
	          type:"post",
	          dataType:"json",
	          data:$("#jobform").serialize(),
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
	<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
			<header>
            <%@ include file="../head.jsp"%>
			</header>
		
			<!--content-->
		<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-9 col-md-9 col-sm-9">
							<div class="row clearfix">
							 <%@ include file="../contact.jsp"%>
								<div class="col-lg-8 col-md-8 col-sm-8 m_xs_bottom_30">
									<h2 class="tt_uppercase color_dark m_bottom_25"></h2>
									<p class="m_bottom_10"> <span class="scheme_color"></span> </p>
									<ul id="errorlist"></ul>
									<form id="jobform" >
										<ul>
											<li class="clearfix m_bottom_15">
												<div class="f_left half_column">
													<label for="jobName" class="required d_inline_b m_bottom_5">职位名称:</label>
													<input type="text"  id="jobName" name="jobName" class="full_width r_corners">
													   <div id="jobNameTip" style="width:250px">
												</div>
											</li>
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">工作类型</label>
											<select name="jobStatus" id=""comtype"">
                                           <option value="国企" selected="selected">文职</option>
                                           <option value="上市公司">技术</option>
                                            <option value="私人公司">管理</option></select>
											</li>
									     <li class="m_bottom_15">
												<label for="jobPersoncount" class="d_inline_b m_bottom_5">招聘(人数):</label>
												<input type="text" id="jobPersoncount" name="jobPersoncount" class="full_width r_corners" value="1">
											    <div id="empcountTip" style="width:250px">
											</li>
	                                     <li class="m_bottom_15">
												<label for="description" class="d_inline_b m_bottom_5 required">岗位介绍</label>
												<textarea id="description" name="description" class="full_width r_corners"></textarea>
												<div id="descriptionTip" style="width:250px">
											</li>
										<li class="m_bottom_15">
												<label for="address" class="d_inline_b m_bottom_5">学历要求:</label>
												<input type="text" id="degree" name="degree" class="full_width r_corners">
											    <div id="degreeTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="language" class="d_inline_b m_bottom_5">语言要求:</label>
												<input type="text" id="language" name="language" class="full_width r_corners">
											    <div id="languageTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="salary" class="d_inline_b m_bottom_5">薪资:</label>
												<input type="text" id="salary" name="salary" class="full_width r_corners">
											    <div id="salaryTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="address" class="d_inline_b m_bottom_5">工作地点:</label>
												<input type="text" id="address" name="address" class="full_width r_corners">
											    <div id="addressTip" style="width:250px">
											</li>
								         <li class="m_bottom_15">
												<label for="startDate" class="d_inline_b m_bottom_5">起始日期:</label>
												<input type="text" id="startDate" name="startDate" class="full_width r_corners">
											    <div id="startDateTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="endDate" class="d_inline_b m_bottom_5">截止日期:</label>
												<input type="text" id="endDate" name="endDate" class="full_width r_corners">
											    <div id="endDateTip" style="width:250px">
											</li>

											<li class="m_bottom_15">
												<button class="button_type_4 bg_light_color_2 r_corners mw_0 tr_all_hover color_dark" type="button" onclick="save();">保存</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</section>
					

					</div>
				</div>
			</div>
			<!--markup footer-->
			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
					<!--social widgets-->
	    <%@ include file="../right.jsp"%>
	</body>
</html>