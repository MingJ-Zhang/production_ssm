<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="jobAddForm" class="jobForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="idW" data-options="required:true"/>
	            </td>
	        </tr>
	        <tr>
	            <td>标题:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="title" 
	            		data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>创建人:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="people" 
	            		data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>创建日期:</td>
	            <td>
	            	<input class="easyui-datetimebox" name="startDate" data-options="required:true,showSeconds:true"
						   style="width:150px">
    			</td>  
	        </tr>
	         <tr>
	            <td>备注:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="beizhu" style="width:150px"data-options="required:true">
    			</td>  
	        </tr>
	 
	        
	    </table>
	    <input type="hidden" name="jobParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitjobAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearjobAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	
	//提交表单
	function submitjobAddForm(){
		//有效性验证
		if(!$('#jobAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		
		//ajax的post方式提交表单
		//$("#salaryAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("job/insert",$("#jobAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				clearjobAddForm();
				$("#jobAddWindow").window('close');
				$("#jobList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearjobAddForm(){
		$('#jobAddForm').form('reset');
		
	}
</script>
