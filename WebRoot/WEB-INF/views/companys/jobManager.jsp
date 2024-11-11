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
		$('#advertGrid').datagrid({
			title:"发布职位管理",
			url:"<%=path%>/job/findComJobList",
			frozenColumns:[[
	                 {title:'序号',field:'jobId',width:30,checkbox:true} ,
			         {title:'广告标题',field:'jobName',width:100,align:'center',sortable:true} ,
			         {title:'类型',field:'jobStatus',width:100,align:'center',sortable:true,hidden:true},
			         {title:'类型',field:'jobPersoncount',width:80,align:'center',sortable:true}       
			]],
			columns:[[
			         {title:'位置',field:'language',width:100,align:'center',sortable:true,hidden:true} ,
			         {title:'位置',field:'salary',width:100,align:'center',sortable:true} ,
			         /* {title:'跳转地址',field:'imageUrl',width:100,align:'center',sortable:true} , */
			         {title:'对应店铺',field:'manager',width:100,align:'center',sortable:true,hidden:true},
			         {title:'对应店铺',field:'mTel',width:100,align:'center',sortable:true},
			         /* {title:'所属公司',field:'companyId',width:100,align:'center',sortable:true,hidden:true},
			         {title:'所属公司',field:'companyName',width:100,align:'center',sortable:true}, */
			         {title:'广告等级',field:'startDate',width:100,align:'center',sortable:true} ,
			         {title:'广告价格',field:'endDate',width:100,align:'center',sortable:true},
			        /*  {title:'adRegular',field:'adRegular',width:100,align:'center',sortable:true} , 
			         {title:'广告群组',field:'adGroup',width:100,align:'center',sortable:true},*/
			         {title:'是否启用',field:'delFlag',width:100,align:'center',sortable:true,
			         	    formatter:function(value,rowData,rowIndex){
			         			if(value=="1"){ return "<font color='black'>启用</font>"; } 
			         			else{ return "<font color='red'>未启用</font>"; }
			         		}
			         },
			         {title:'创建人',field:'createUser',width:80,align:'center',sortable:true},
			         {title:'创建时间',field:'createTime',width:150,align:'center',sortable:true},
			         {title:'修改人',field:'updateUser',width:80,align:'center',sortable:true},
			         {title:'修改时间',field:'updateTime',width:150,align:'center',sortable:true}
			]],
			pagination:true,
			collapsible:true,
			rownumbers:true,
			remoteSort : false,
			queryParams:{position:"adPosition"},
			//fitColumns:true,
			toolbar : '#tb',
			onLoadError:function(){
					$.messager.show({title : '提示',msg : 'please loading again...',timeout : 1500,showType : 'fade',style : {top : 100,}});
			}
		});
	});
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
			   <table id="jobManagerGrid"></table>
					
				</div>
			</div>

	</body>
</html>