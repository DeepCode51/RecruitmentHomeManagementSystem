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
$.formValidator.initConfig({formID:"userform",debug:false,submitOnce:true,
		onError:function(msg,obj,errorlist){
			$("#errorlist").empty();
			$.map(errorlist,function(msg){
				$("#errorlist").append("<li>" + msg + "</li>")
			});
			alert(msg);
		},
		submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
	});

	$("#username").formValidator({onShow:"请输入用户名,",onFocus:"用户名至少5个字符,最多10个字符",onCorrect:"该用户名可以注册"}).inputValidator({min:5,max:10,onError:"你输入的用户名非法,请确认"})//.regexValidator({regExp:"username",dataType:"enum",onError:"用户名格式不正确"})
	    .ajaxValidator({
		dataType : "text",
		async : true,
		url : "<%=path%>/user/checkUsername",
		success : function(data){
            if( data.indexOf("1") > 0) return true;
            if( data.indexof("0")>0 ) return false;
			return false;
		},
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该用户名不可用，请更换用户名",
		onWait : "正在对用户名进行合法性校验，请稍候..."
	}).defaultPassed();;
	$("#password1").formValidator({onShow:"请输入密码",onFocus:"至少1个长度",onCorrect:"密码合法"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
	$("#password2").formValidator({onShow:"请再次输入密码",onFocus:"至少1个长度",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"password1",operateor:"=",onError:"2次密码不一致,请确认"});
});
	function save(){
		var determineResult = $("#determineResult").val();
		if(determineResult.length<1){
            swal("请选择研判人员!");
			return ;
		}
// 		$.ajax({
// 	          url:"<%=path%>/syntheticalDetermine/saveLuru",
// 	          type:"post",
// 	          dataType:"text",
// 	          data:$("#luruform").serialize(),
// 	          success:function(data, textStatus, jqXHR){
// 	          		if(data == 1){
// 	          			swal("录入成功!");
// 	          			getData();
// 	          			$("#simpleModal img").click();
// 	          		}else{
// 	          			swal("异常......");
// 	          		}
// 	          },
// 	          error:function(){
// 	           	 	swal("异常信息!");
// 	          }
// 	   });	
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
									<h2 class="tt_uppercase color_dark m_bottom_25">用户注册</h2>
									<p class="m_bottom_10"> <span class="scheme_color"></span> </p>
									<ul id="errorlist"></ul>
									<form id="userform" action="<%=path%>/user/saveUser">
										<ul>
											<li class="clearfix m_bottom_15">
												<div class="f_left half_column">
													<label for="cf_name" class="required d_inline_b m_bottom_5">用户名:</label>
													<input type="text"  id="username" name="username" class="full_width r_corners">
													   <div id="usernameTip" style="width:250px">
												</div>
											</li>
											<li class="m_bottom_15">
												<label for="pwd1" class="d_inline_b m_bottom_5">密码:</label>
												<input type="password" id="password1" name="pwd" class="full_width r_corners">
											    <div id="password1Tip" style="width:250px">
											</li>
											
											<li class="m_bottom_15">
												<label for="pwd2" class="d_inline_b m_bottom_5">确认密码:</label>
												<input type="password" id="password2" name="password" class="full_width r_corners">
											    <div id="password2Tip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">用户类型</label>
											<select name="status" id="status">
                                   <option value="1" selected="selected">求职用户</option>
                               <option value="2">企业用户</option></select>
											</li>
											<li class="m_bottom_15">
												<button class="button_type_4 bg_light_color_2 r_corners mw_0 tr_all_hover color_dark" type="submit">保存</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</section>
					

					</div>
				</div>
			</div>

	</body>
</html>