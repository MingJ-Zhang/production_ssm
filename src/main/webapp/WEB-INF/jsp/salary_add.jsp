<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="salaryAddForm" class="salaryForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="id" data-options="required:true"/>
	            </td>
	        </tr>
	        <tr>
	            <td>标题:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="topic" 
	            		data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>月份:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="month" 
	            		data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>开始日期:</td>
	            <td>
	            	<input class="easyui-datetimebox" name="start_date" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
    			</td>  
	        </tr>
	         <tr>
	            <td>结束日期:</td>
	            <td>
	            	<input class="easyui-datetimebox" name="end_date" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
    			</td>  
	        </tr>
	        <tr>
	            <td>用户:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="user" 
	            		data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>日期:</td>
	            <td>
	            	<input class="easyui-datetimebox" name="date" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
    			</td>  
	        </tr>
	        
	    </table>
	    <input type="hidden" name="salaryParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitsalaryAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearsalaryAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	
	//提交表单
	function submitsalaryAddForm(){
		//有效性验证
		if(!$('#salaryAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		
		//ajax的post方式提交表单
		//$("#salaryAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("salary/insert",$("#salaryAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				clearsalaryAddForm();
				$("#salaryAddWindow").window('close');
				$("#salaryList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearsalaryAddForm(){
		$('#salaryAddForm').form('reset');
		
	}
</script>
