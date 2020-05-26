<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>


<div style="padding: 10px 10px 10px 10px">
	<form id="selfAddForm" class="selfForm" method="post">
		<table cellpadding="5">
			<!-- 第一行 -->
			<tr height="250px">
				<!-- 第一列 -->
				<th width="150px">编号</th>
				<th><input value="自己定义" name="self_id"> </input></th>
				<!-- 第2列 -->
				<th>主题</th>
				<th><input></input></th>


			</tr>
			<!-- 第2行 -->
			<tr>
				<!-- 第一列 -->
				<th>鉴定周期分类</th>
				<th><select name="evaluation_type" onChange="ShowToText(); ">
						<option value="1">年</option>
						<option value="2">月</option>
						<option value="3">日</option>

				</select><br></th>
				<!-- 第2列 -->
				<th>考核周期</th>
				<th><select name="examination_date1" onChange="ShowToText(); ">
						<option value="1">2020</option>
						<option value="2">2019</option>
						<option value="3">2018</option>
						<option value="4">2017</option>
				</select> <select name="examination_date2" onChange="ShowToText(); ">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select><br></th>


			</tr>
			<!-- 第3行 -->
			<tr>
				<!-- 第一列 -->
				<th>开始日期</th>
				<th><input name="start_date"></input></th>
				<!-- 第2列 -->
				<th>结束日期</th>
				<th><input name="end_date"></input></th>


			</tr>
			<!-- 第4行 -->
			<tr height="50px">
				<!-- 第一列 -->
				<th>工作内容</th>
				<th><textarea name="title"> </textarea></th>
			</tr>
			<!-- 第5行 -->
			<tr>
				<!-- 第一列 -->
				<th>完成情况</th>
				<th><input  name="finish_situation"></input></th>
			</tr>
			<!-- 第6行 -->
			<tr>
				<!-- 第一列 -->
				<th>后续工作</th>
				<th><input  name="after_work"></input></th>
			</tr>
			<!-- 第7行 -->
			<tr>
				<!-- 第一列 -->
				<th>存在不足</th>
				<th><input name="shortages"></input></th>
			</tr>
			<!-- 第8行 -->
			<tr>
				<!-- 第一列 -->
				<th>存在困难</th>
				<th><input name="difficulty"></input></th>
			</tr>
			<!-- 第9行 -->
			<tr>
				<!-- 第一列 -->
				<th>个人建议</th>
				<th><input name="suggest"></input></th>
			</tr>
			<!-- 第7行 -->
			<tr>
				<!-- 第一列 -->
				<th>备注说明</th>
				<th><input name="remarks"></input></th>
			</tr>


		</table>
		<input type="hidden" name="selfParams" />
	</form>
	<div style="padding: 5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitselfAddForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearselfADDForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var selfAddEditor;

	//提交表单
	function submitselfAddForm() {
		//有效性验证
		if (!$('#selfAddForm').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}

		//ajax的post方式提交表单
		//$("#selfAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("self/add", $("#selfAddForm").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '新增机构成功!');
				clearselfADDForm();
				$("#selfAddWindow").window('close');
				$("#selfList").datagrid("reload");
			} else {
				$.messager.alert('提示', data.msg);
			}
		});
	}

	function clearselfADDForm() {
		$('#selfAddForm').form('reset');
	}
</script>