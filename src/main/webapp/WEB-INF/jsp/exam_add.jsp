<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>


<div style="padding:10px 10px 10px 10px">
	<form id="examAddForm" class="examForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>考试编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="id" data-options="required:true"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>主题:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="title" data-options="required:true"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>负责人:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="teacher" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>创建时间:</td>
	            <td>
	            	<input id="dd" class="easyui-datetimebox" type="text" name="create_time" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>结束时间:</td>
	            <td>
	            	<input id="dd"  class="easyui-datetimebox" type="text" name="over_time" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>地点:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="address" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <!-- <td>类型:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="type" data-options="required:true"></input>
    			</td>   -->
    			 <td nowrap width="10%" align="right">类型:</td>
                            <td style="text-align:left">
                                <span class="radioSpan">
                                    <input type="radio" id="test_switch" name="type" value="1">考试</input>
                                    <input type="radio" id="test_switch" name="type" value="2">考核</input>
                                </span>
                 </td>
	        </tr>
	        <tr>
	            <td>参与人员:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="join_person" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>详情:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="context" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>考试结果:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="result" data-options="required:true"></input>
    			</td>  
	        </tr>
	        <tr>
	            <td>备注:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="others" data-options="required:true"></input>
    			</td>  
	        </tr>
	     
	    </table>
	    <input type="hidden" name="examParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitexamAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearexamADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	var examAddEditor ;
	
	//提交表单
	function submitexamAddForm(){
		//有效性验证
		if(!$('#examAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		//ajax的post方式提交表单
		//$("#examAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("exam/add",$("#examAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增考试成功!');
				clearexamADDForm();
				$("#examAddWindow").window('close');
				$("#examList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearexamADDForm(){
		$('#examAddForm').form('reset');
	}
	
	$('#dd').datebox({
	    required:true
	});
</script>