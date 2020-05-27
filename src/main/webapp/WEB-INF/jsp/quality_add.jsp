<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>


<div style="padding:10px 10px 10px 10px">
	<form id="qualityAddForm" class="qualityForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>编号规则名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="id" data-options="required:true"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>单据名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="documentName" data-options="required:true"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>编号前缀:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="prefix" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>日期类型:</td>
	            <td>
	            	<input id="dd" class="easyui-textbox" type="text" name="dateType" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>流水号长度:</td>
	            <td>
	            	<input id="dd"  class="easyui-textbox" type="text" name="length" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>编号示例:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="examples" data-options="required:true"></input>
    			</td>  
	        </tr>
	         <tr>
	            <td>是否为缺省规则:</td>
	            <td>
	            	<input id="dd"  class="easyui-textbox" type="text" name="defaultRule" data-options="required:true"></input>
    			</td>  
	        </tr>
	         <tr>
	            <td>启用状态:</td>
	            <td>
	            	<input id="dd"  class="easyui-textbox" type="text" name="type" data-options="required:true"></input>
    			</td>  
	        </tr>


	     
	    </table>
	    <input type="hidden" name="qualityParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitqualityAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearqualityADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	var qualityAddEditor ;
	
	//提交表单
	function submitqualityAddForm(){
		//有效性验证
		if(!$('#qualityAddForm').form('validate')){
			$.messager.alert('提示','还未填写完!');
			return ;
		}
		
		//ajax的post方式提交表单
		//$("#qualityAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("quality/add",$("#qualityAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				clearqualityADDForm();
				$("#qualityAddWindow").window('close');
				$("#qualityList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearqualityADDForm(){
		$('#qualityAddForm').form('reset');
	}
	
	$('#dd').datebox({
	    required:true
	});
</script>