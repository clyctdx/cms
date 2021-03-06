<?xml version="1.0" encoding="UTF-8" ?>
<%
	String path = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/easyui/themes/default/easyui.css" type="text/css"></link>
  <link rel="stylesheet" href="<%=path %>/easyui/themes/icon.css" type="text/css"></link>
  <script type="text/javascript" src="<%=path %>/easyui/jquery.min.js"></script>
  <script type="text/javascript" src="<%=path %>/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="<%=path %>/easyui/locale/easyui-lang-zh_CN.js"></script>
  
</head>
<body>

<center>
	<br/>
	<br/>
	<br/>
	<br/>
	<table>
		<tr>
			<td>请选择模板：</td>
			<td>
			<select id="template" name="template.templateId" class="easyui-combobox" style="width:155px;" 
			    		data-options="valueField:'templateId',textField:'templateName',url:'<%=path %>/template!findTemplateByNavigation.action',editable:false"></select>
			    		&nbsp;&nbsp;&nbsp;
			    		<a id="btn" href="javascript:channelStatic()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">栏目静态化</a>
			</td>
		</tr>
		
	</table>
	
</center>
<script type="text/javascript">
	
	function channelStatic(){
		
		var id = $("#template").combobox("getValue");
		if(id != null && id != ""){
			$.post("${path}/create-html!channelStatic.action?template.templateId="+id,function(data){
				
				if(data == "yes"){
					$.messager.show({
						title:'提示',
						msg:'生成成功.',
						timeout:5000,
						showType:'slide'
					});
				}else{
					$.messager.show({
						title:'提示',
						msg:'生成失败.',
						timeout:5000,
						showType:'slide'
					});
				}
				
			});
		}else{
			$.messager.show({
				title:'提示',
				msg:'请选择模板.',
				timeout:5000,
				showType:'slide'
			});
		}
	}

</script>
</body>
</html>