<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%    
String path = request.getContextPath();
%>    
<!doctype html>
  <head> 
    <title>My JSP 'emps.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path%>/common/js/jquery-1.9.1.js"></script>
<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/icon.css">
		<script type="text/javascript">
var $obj;  
$(function() {  
    $obj = $("#tt");  
    $obj.datagrid({  
        loadMsg : '数据加载中请稍后……',  
        url : '<%=path%>/info/findInfoList',  
        //url : root + 'js/app/sysManagement/sysConfig.json',  
        fitColumns : true,  
        autoRowHeight : true,  
        pagination : true,  
        pagePosition : 'bottom',  
        pageSize : 10,  
        toolbar: '#tb',
         queryParams:{
        "status":$('#status').val(),
        "isApply":$('#isApply').val()
        } ,  
        pageList : [ 10, 20, 30 ],  
        border : false,  
        singleSelect:true,  
        idField:'infoId',
        				iconCls: 'icon-edit',
				pagination:true,
			collapsible:true,
			rownumbers:true,
			remoteSort : false,
                striped: true, //行背景交换
                nowap: true, //列内容多时自动折至第二行
                border: false,  
        columns : [ [ {  
                field : 'infoId',  
                title : 'infoId',  
                hidden : true  
            },{  
                field : 'title',  
                title : "标题",  
                width : 200,  
                editor : 'text',  
                sortable : true  
            }, {  
                field : 'content',  
                title : "内容",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'createdate',  
                title : "发布日期",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, 
            {  
                field : 'username',  
                title : "发布人",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, 
                                    {  
                field : 'status',  
                title : "信息类型",  
                editor : 'text',  
                width : 200,  
                sortable : true ,
                                formatter:function(value,row,index){  
                                if(value==1){
                                   return "求职信息";     
                                }else{
                                   return "招聘信息";     
                                }
                               
             
                }  
            }, 
                {  
                field : 'isApply',  
                title : "审核状态",  
                editor : 'text',  
                width : 200,  
                sortable : true ,
                                formatter:function(value,row,index){  
                                if(value==1){
                                 var t= row.infoId;
                                   var s = '<a href="javascript:;" class="ope-save" onclick="apply('+t+',0)">撤销</a> '; 
              
                                   return "已通过审核||  "+s ;    
                                }else{
                                 var t= row.infoId;
                                   var s = '<a href="javascript:;" class="ope-save" onclick="apply('+t+',1)">通过</a> '; 
                                   return "未通过审核 ||  "+s  ;     
                                }
                               
             
                }  
            }, 
            {  
                field : 'opt',  
                title : "详情",  
                width : 150,  
                align : 'center',  
                formatter:function(value,row,index){  
                                var s = '<a href="<%=path%>/user/goCommond?id='+row.infoId+'" class="ope-save">查看详情</a> '; 
             return s;        
                }  
        } ] ],  
        onLoadSuccess : function(data) {  
  
        },  
        onBeforeEdit:function(index,row){  
            row.editing = true;  
            $obj.datagrid('refreshRow', index);  
        },  
        onAfterEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        },  
        onCancelEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        }  
    });  
  
});  
    function selectCurRow(obj){  
        var $a = $(obj);  
        var $tr = $a.parent().parent().parent();  
        var tmpId = $tr.find("td:eq(0)").text();  
        $obj.datagrid('selectRecord', tmpId);  
    }  
      
    function getIndexAfterDel(){  
        var selected = $obj.datagrid('getSelected');  
        var index = $obj.datagrid('getRowIndex', selected);  
        return index;  
    }  
      
    function editrow(index,obj){  
        selectCurRow(obj);  
          
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('beginEdit', tmpIndex);  
    }  
      
    function deleterow(index,obj){  
        $.messager.confirm('Confirm','确认删除?',function(r){  
            if (r){               
                selectCurRow(obj);  
                var index = getIndexAfterDel();  
                var node = $obj.datagrid('getSelected');  
                var id = node.id;   
                $.ajax({  
                    url :'<%=path%>/job/delJob?id='+id,  
                    type : 'GET',                     
                    timeout : 60000,  
                    success : function(data, textStatus, jqXHR) {     
                        var msg = '删除';  
                        if(data == 'o') {  
                            $obj.datagrid('deleteRow', index);  
                            return;  
                        }else if (data == "1") {  
                            $obj.datagrid('deleteRow', index);  
                            //$obj.datagrid('reload');  
                            $.messager.alert('提示', msg + '成功！', 'info', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        } else {  
                            $.messager.alert('提示', msg + '失败！', 'error', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        }  
                    }  
                });   
                  
            }  
        });  
    }  
    function saverow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('endEdit', tmpIndex);  
        var node = $obj.datagrid('getSelected');  
        //var data = JSON.stringify(node);  
        var json = {};  
        json.jobId = node.jobId;  
        json.jobName = node.jobName;  
        json.jobPersoncount = node.jobPersoncount;  
        json.salary   = node.salary;  
        json.jobStatus  = node.jobStatus;
          json.degree = node.degree;  
        json.address = node.address;  
        json.description = node.description;  
        json.language   = node.language;  
        json.startDate   = node.startDate;  
        json.endDate  = node.endDate;    
        $.ajax({  
            url : '<%=path%>/job/editOrSaveComJob',  
            type : 'POST',  
            data : json,  
            timeout : 60000,  
            success : function(data, textStatus, jqXHR) {     
                var msg = '';  
                if (data == 1) {  
                    $.messager.alert('提示', '保存成功！', 'info', function() {  
                        $obj.datagrid('refreshRow', tmpIndex);  
                    });  
                } else{  
                      msg = "保存失败！";  
                    $.messager.alert('提示', msg , 'error', function() {  
                        $obj.datagrid('beginEdit', tmpIndex);  
                    });  
                }                     
  
            }  
        });  
          
    }  
    function cancelrow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('cancelEdit', tmpIndex);  
    }  
      
    function appendRow(){  
        $obj.datagrid('appendRow',{  
            id: new Date().getTime(),  
            configName: '',  
            configNameCn: "",  
            configType: "",  
            configValue:"",  
            opt:""  
        });  
          
        var length = $obj.datagrid("getRows").length;  
        if(length > 0){  
            editIndex = length - 1;  
        }else{  
            editIndex = 0;  
        }         
        //$obj.datagrid("selectRow", editIndex);  
        $obj.datagrid("beginEdit", editIndex);  
    }  
         function dosearch(){
  window.location.reload();
			}
      function  apply(id,status){
           var json = {};  
           json.infoId=id;
           json.isapply=status;
              $.ajax({  
            url : '<%=path%>/info/updateInfo',  
            type : 'POST',  
            data : json,  
            timeout : 60000,  
            success : function(data, textStatus, jqXHR) {     
               
                if (data == 1) {  
                    $.messager.alert('提示', '成功！', 'info', function() {  
                        $obj.datagrid().reload();  
                    });  
                } else{  
                      msg = "失败！";  
                    $.messager.alert('提示', msg , 'error', function() {  
                        
                    });  
                }                     
  
            }  
        });  
      }
		</script>
  </head>
  
  <body>
  <form>
	<span>信息类型：</span>											<select name="status" id="status">
	                              <option value="0" selected="selected">全部</option>
                                   <option value="1" >求职信息</option>
                               <option value="2">招聘信息</option></select>
                               <select name="isApply" id="isApply">
	                              <option value="3" selected="selected">全部</option>
                                   <option value="0" >未审核</option>
                               <option value="1">审核通过</option></select>
	<a href="#" class="easyui-linkbutton" iconCls="search"  onclick="dosearch();">查询</a>
</form>
	<table id="tt" ></table>
  </body>
</html>
