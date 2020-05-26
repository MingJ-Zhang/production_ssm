<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="ataskAddForm" class="ataskForm" method="post">
	    <table cellpadding="5" >
	       <tr>
	            <td>任务编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="id" data-options="required:true"></input>
	            </td>
	        </tr>
     
	       
	       <tr>
	            <td>任务主题:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="theme" data-options="required:true"></input>
	            </td>
	        </tr>
	       
	       <tr>
	            <td>考核期间类型:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="type" data-options="required:true"></input>
	            </td>
	        </tr>	   
	       
	          <tr>
	            <td>考核周期:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="cycle" data-options="required:true"></input>
	            </td>
	        </tr>	   
	       
	        <tr>
	            <td>开始时间:</td>
	            <td>
					<input class="easyui-datebox" name="start_time" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd)" style="width:150px">
				</td>
	        </tr>
	         <tr>
	            <td>开始时间:</td>
	            <td>
					<input class="easyui-datebox" name="end_time" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd)" style="width:150px">
				</td>
	        </tr>
	     
	    </table>
	    <input type="hidden" name="ataskParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAtaskAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearAtaskADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	

	
	//提交表单
	function submitAtaskAddForm(){
		//有效性验证
		if(!$('#ataskAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
	
		
		//ajax的post方式提交表单
		//$("#ataskAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("atask/insert",$("#ataskAddForm").serialize(), function(data){
			console.log($("#ataskAddForm").serialize());
			if(data.status == 200){
				$.messager.alert('提示','新增表单成功!');
				clearAtaskADDForm();
				$("#ataskAddWindow").window('close');
				$("#ataskList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearAtaskADDForm(){
		$('#ataskAddForm').form('reset');
		
	}
</script>
