<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="trainAddForm" class="trainForm" method="post">
	    <table cellpadding="5" >
	       <tr>
	            <td>培训名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="name" data-options="required:true"></input>
	            </td>
	        </tr>
	       
	       <tr>
	            <td>培训方式:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="mode" data-options="required:true"></input>
	            </td>
	        </tr>
	       
	       <tr>
	            <td>培训老师:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="teacher" data-options="required:true"></input>
	            </td>
	        </tr>	   
	       
	        <tr>
	            <td>开始时间:</td>
	            <td>
					<input class="easyui-datetimebox" name="start_time" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
				</td>
	        </tr>
	        <tr>
	            <td>结束时间:</td>
	            <td>
					<input class="easyui-datetimebox" name="end_time" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
				</td>
	        </tr>
	          <tr>
	            <td>培训地点:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="address" data-options="required:true"></input>
	            </td>
	        </tr>	 
	    </table>
	    <input type="hidden" name="trainParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitTrainAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearTrainADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	

	
	//提交表单
	function submitTrainAddForm(){
		//有效性验证
		if(!$('#trainAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
	
		
		//ajax的post方式提交表单
		//$("#trainAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("train/insert",$("#trainAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增订单成功!');
				clearTrainADDForm();
				$("#trainAddWindow").window('close');
				$("#trainList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearTrainADDForm(){
		$('#trainAddForm').form('reset');
		
	}
</script>
