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
	<link rel="stylesheet" type="text/css" href="<%=path%>/common/cs
s/jcDate.css" media="all" />
<script src="<%=path%>/common/date/laydate.js"></script>

<script type="text/javascript" src="<%=path%>/common/js/format.js"></script>
<script src="<%=path%>/common/sweet/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/common/sweet/sweet-alert.css">

<style type="text/css">
.dataTables_scroll{ margin-bottom: 20px;}
.xz input{
	margin-left: 20px;
	margin-top: 10px;
}
.detail{ 
	width: 580px;
	text-align:center;
	padding-left:20px;
	border-bottom: 1px dashed #ebebeb;
	height: 60px;
	line-height: 60px;
	font-size: 14px;
}

.display_a a{ font-size: 14px;}
.dataTables_info{
	font-size: 14px;
	color: #666;
}
.paging_full_numbers
{
	font-size: 14px;
	color: #666;
	margin-right: 10px;
}
table.display td {
    min-height:24px;
    vertical-align:middle;
    height:30px;
}
/* table.display .status{
	color:#3968AE;
} */

.detail-header{
	width: 100%;
	background-color: gray;
	height: 60px;
	line-height: 60px;
}

</style>
<style>
	table{ border-top:1px #CCC solid; border-right:1px #CCC solid; background: #fff;}
	table td{ border-left:1px #CCC solid; border-bottom:1px #CCC solid; text-align:center; font-size:12px; height:40px;}
	.input_01{ width:75%; height:30px; font-size:12px; border:0;}
	.input_02{ width:90%; height:30px; font-size:12px; border:0;}
 	.bk1{ border:1px #e7cbca solid; background:#fdeee9;}
	input{background-color:transparent;}
</style>
</head>

<script type="text/javascript" charset="utf-8">

$(document).ready(function() {
});

	function saveEmp(){
		var name=$("#detail_realname").val();
		if((name==null||name=="")){
			swal("姓名不可以为空!");
			return;
		}
			var src=$('#detail_image').attr('src');
			var srcDefault="/recruit/common/images/photoDefault.jpg";
  			if(srcDefault==src){
                if(confirm("您没有选择头像,请选择头像!")){
                	//doSave();
 			   }else{
 				   return;
 			   }
  			}else{ 				
  				doSave();
  			}


		
	}
	function doSave(){
		$.ajax({
	          url:"<%=path%>/emp/saveEmp",
	          type:"post",
	          dataType:"text",
	          data:$("#dpform").serialize(),
	          success:function(data, textStatus, jqXHR){
	          		if(data != 0){
	          		var src=$('#detail_image').attr('src'); 
	          			var file=document.getElementById('imageFile');	 
	          		  
	          				saveDeterpersonImage(file,data);
	          		}else{
	          			
	          			openMsgDialog("异常......");
	          		}
	          },
	          error:function(){
	        	  openMsgDialog("异常信息!");
	          }
	   });	
		
	}
</script>
<style type="text/css">
#detail_image {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
</style>
<script type="text/javascript">


                //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
    
          var MAXWIDTH  = 140;
          var MAXHEIGHT = 160;
          if (file.files && file.files[0])
          {
              var img = document.getElementById('detail_image');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;};
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
        
        
        function change(){
        	$('#imageFile').click();
        	
        }
        
    	function saveDeterpersonImage(file,id){
    		if(!window.FormData) {
    	        swal('浏览器版本不符');
    	        return false;
    	    }
    		var formData = new FormData();
    		formData.append("file",file.files[0]);
    		formData.append("eid",id);
    		$.ajax({
    	          url:"<%=path%>/emp/uploadImage",
    	          async: false,
    	          enctype: 'multipart/form-data',
    	          processData: false,
    	          contentType: false,
    	          dataType:'json',
    	          type:"post",
    	          data:formData,
    	          success:function(data, textStatus, jqXHR){
    	          		if(data == 1){
    	          			swal("保存成功!");
    	          			window.location.href="<%=path%>/emp/goSuccess?flag=1"
    	          		}else{
    	          			swal("异常......");
    	          			window.location.href="<%=path%>/emp/goSuccess?flag=0"
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
							<h2 class="tt_uppercase color_dark m_bottom_25">	${user.username }账号密码设置成功，请填写详细信息完成注册</h2>
									<p class="m_bottom_10"> <span class="scheme_color"></span> </p>
									<ul id="errorlist"></ul>
										<div class="subject">
		
		<div id="" class="" style="">
			    <form id="dpform">
        <table width="100%" cellpadding="0" cellspacing="0" style=" margin-top: 10px;">
            <tr>
                <td width="91"><font class="c1">姓名：</font></td>
                <td width="237"><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="realname" id="detail_realname"></font></td>
                <td width="120"><font class="c1">性别：</font></td>
                <td width="289"><font class="c2"><select name="sex" style="width:95%;height:35px;border: none;" id="detail_sex"><option selected="selected" value="男">男</option><option value="女">女</option></select></font></td>
                <td width="140" rowspan="4">
                 <img id="detail_image"  name="image" width="140px" height="160px" border=0 onclick="change(); "src="<%=path%>/common/images/photoDefault.jpg" />                  
                 <input type="file"  name="file"  id="imageFile" onchange="previewImage(this);"  style="display: none;"/>         
                </td>
            </tr>
            <tr>
                <td><font class="c1">学历：</font></td>
                <td><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="degree" id="detail_degree"></font></td>
                <td><font class="c1">是否结婚：</font></td>
                <td><font class="c2"><select name="marry" style="width:95%;height:35px;border: none; " id="detail_marry"><option selected="selected" value="否">否</option><option value="是">是</option></font></td>
            </tr>
            <tr>
                <td><font class="c1">国籍：</font></td>
                <td><font class="c2"><select name="country" style="width:95%;height:35px;border: none; " id="detail_country"><option selected="selected"></option><option value="中国">中国</option><option value="伊朗">伊朗</option><option value="沙特">沙特</option><option value="阿联酋">阿联酋</option></select></font></td>
                 <td><font class="c1">是否在职：</font></td>
                <td><font class="c2"><select name="jobstatus" style="width:95%;height:35px;border: none; " id="detail_jobstatus"><option selected="selected"></option><option value="否">否</option><option value="是">是</option></font></td>
            </tr>
            <tr>
                <td><font class="c1">出生日期：</font></td>
                <td><font class="c2"><input class="laydate-icon" type="text" style="width:85%;height:35px;border: none; " name="birthday" id="detail_birthday">
                				<script>
					;!function(){
					laydate({
					   elem: '#detail_birthday',
					   format: 'YYYY-MM-DD',
					    istime: false,
					    istoday: true
					})
					}();
				</script>
    </font></td>
                <td><font class="c1">外语等级：</font></td>
                <td><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="language" id="detail_language"></font></td>
            </tr>
            <tr>
                <td><font class="c1">简历名称：</font></td>
                <td><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="resumeName" id="detail_resumeName"></font></td>
                 <td><font class="c1">QQ号码：</font></td>
                <td id="check3"><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="qq" id="detail_qq"  onblur="checkData(this.value)"></font></td>
                
            </tr>
            <tr>
                <td><font class="c1">邮箱地址：</font></td>
                <td id="check1"><font class="c2"><input type="text" style="width:95%;height:35px;border: none; " name="email" id="detail_email" ></font></td>
                <td><font class="c1 ">电话号码：</font></td>
                <td id="check2" colspan="2" ><font class="c2"><input type="text"style="width:95%;height:35px;border: none;" name="tel" id="detail_tel"  onblur="isMobile(this.value)"></font></td>
            </tr>
            <tr>
                <td><font class="c1">户籍：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%;width:95%;height:35px;border: none; " name="hj" id="detail_hj"></font></td>
                <td><font class="c1">暂住地：</font></td>
                <td colspan="2"><font class="c2"><input type="text" style="padding-left:2%;width:95%;height:35px;border: none; " name="address" id="detail_address"></font></td>
            </tr>
        </table>
        
        
        <table  width="100%" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td width="171"><font class="c1">自我评价：</font></td>
                <td width="568" ><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:35px;border: none;  "  name="description" id="detail_description"></font></td>
            </tr>
            <tr>
                <td><font class="c1">得奖情况：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:35px;border: none;  "name="study" id="detail_study"></font></td>
            </tr>
            <tr>
                <td><font class="c1">期望工作类型：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:35px;border: none;  " name="jobtype" id="detail_jobtype"></font></td>
            </tr>
            <tr>
                <td><font class="c1">期望工作地点：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; " name="waddress" id="detail_waddress"></font></td>
            </tr>
            <tr>
                <td><font class="c1">期望薪资：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; " name="salary" id="detail_salary"></font></td>
            </tr>
            <tr>
                <td><font class="c1">工作经历：</font></td>
                <td ><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; " name="work" id="detail_work"></font></td>
            </tr>
            <tr>
                <td><font class="c1">家庭成员：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; "  name="family" id="detail_family"></font></td>
            </tr>
            <tr>
                <td><font class="c1">项目经验：</font></td>
                <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; "  name="experience" id="detail_experience"></font></td>
            </tr>
        </table>
	</form>
			<div class="details-footer">
				<input value="保存" type="button" style="width: 60px;margin-right: 20px; height: 30px; line-height: 30px; background: #fff; border: 1px #999 solid;;" onclick="saveEmp();">
				<input value="返回" type="button" style="width: 60px; height: 30px; line-height: 30px; background: #fff; border: 1px #999 solid;;" onclick="javascript:window.history.go(-1);">
			</div>
		</div>
						</div>
</div>
	</body>
</html>