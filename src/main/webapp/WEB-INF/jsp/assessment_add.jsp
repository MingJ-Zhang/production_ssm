<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="assessmentAddForm" class="assessmentForm" method="post">
	    <table cellpadding="5" >
	       <tr>
	            <td>考核编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="id" data-options="required:true"></input>
	            </td>
	        </tr>
	       
	       
	         <tr>
	            <td>培训信息:</td>
	            <td>
	            	<input class="easyui-combobox" name="train.id"   
    					data-options="valueField:'id',textField:'id',
    						url:'train/get_data', editable:false, required:true" />
    			</td>  
	        </tr>
	       
	       
	       
	       <tr>
	            <td>考核方式:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="mode" data-options="required:true"></input>
	            </td>
	        </tr>
	       
	       <tr>
	            <td>考核人:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="teacher" data-options="required:true"></input>
	            </td>
	        </tr>	   
	       
	        <tr>
	            <td>考评时间:</td>
	            <td>
					<input class="easyui-datetimebox" name="time" data-options="required:true,showSeconds:true"
						   value="date.format('yyyy-MM-dd hh:mm:ss')" style="width:150px">
				</td>
	        </tr>
	     
	    </table>
	    <input type="hidden" name="assessmentParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAssessmentAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearAssessmentADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	

	
	//提交表单
	function submitAssessmentAddForm(){
		//有效性验证
		if(!$('#assessmentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
	
		
		//ajax的post方式提交表单
		//$("#assessmentAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("assessment/insert",$("#assessmentAddForm").serialize(), function(data){
			console.log($("#assessmentAddForm").serialize());
			if(data.status == 200){
				$.messager.alert('提示','新增表单成功!');
				clearAssessmentADDForm();
				$("#assessmentAddWindow").window('close');
				$("#assessmentList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearAssessmentADDForm(){
		$('#assessmentAddForm').form('reset');
		
	}
</script>
