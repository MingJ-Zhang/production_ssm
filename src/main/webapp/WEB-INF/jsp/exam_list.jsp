<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>	
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<table class="easyui-datagrid" id="examList" title="考试列表"
	data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'exam/list',method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_exam">
	<thead> 
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">考试编号</th>
			<th data-options="field:'title',align:'center',width:100">主题</th>
			<th data-options="field:'teacher',align:'center',width:100">负责人</th>
			<th data-options="field:'create_time',align:'center',width:100,formatter:TAOTAO.formatDateTime">开考时间</th>
			<th data-options="field:'over_time',align:'center',width:100,formatter:TAOTAO.formatDateTime">结束时间</th>
			<th data-options="field:'address',align:'center',width:100">地点</th>
			<th data-options="field:'type',align:'center',width:100">类型</th>
			<th data-options="field:'join_person',align:'center',width:100">参与人员</th>
			<th data-options="field:'context',align:'center',width:100">详情</th>
			<th data-options="field:'result',align:'center',width:100">考试结果</th>
			<th data-options="field:'others',align:'center',width:100">备注</th>			
		</tr>
	</thead>
</table>

<div id="toolbar_exam"
	style="height: 22px; padding: 3px 11px; background: #fafafa;">

	<c:forEach items="${sessionScope.sysPermissionList}" var="per">
		<c:if test="${per=='exam:add' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
					onclick="exam_add()">新增</a>
			</div>
		</c:if>
		<c:if test="${per=='exam:delete' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="exam_delete()">删除</a>
			</div>
		</c:if>
	</c:forEach>

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
			onclick="exam_reload()">刷新</a>
	</div>

	
</div>

<div id="examAddWindow" class="easyui-window" title="添加考试" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'exam/add'" style="width:45%;height:60%;padding:10px;">
</div>
<script>

	function getexamSelectionsIds() {
		var examList = $("#examList");
		var sels = examList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(",");

		return ids;
	}

	function exam_add() {
		$.get("exam/add_judge", '', function(data) {
			if (data.msg != null) {
				$.messager.alert('提示', data.msg);
			} else {
				$("#examAddWindow").window("open");
			}
		});
	}

	    
	    function exam_delete(){
	    	$.get("exam/delete_judge",'',function(data){
	      		if(data.msg != null){
	      			$.messager.alert('提示', data.msg);
	      		}else{
	      			var ids = getexamSelectionsIds();
	              	if(ids.length == 0){   
	              		$.messager.alert('提示','未选中考试!');
	              		return ;
	              	}
	              	$.messager.confirm('确认','确定删除ID为 '+ids+' 的考试吗？',function(r){
	              	    if (r){
	              	    	var params = {"ids":ids};
	                      	$.post("exam/delete_batch",params, function(data){
	                  			if(data.status == 200){
	                  				$.messager.alert('提示','删除考试成功!',undefined,function(){
	                  					$("#examList").datagrid("reload");
	                  				});
	                  			}
	                  		});
	              	    }
	              	});
	      		}
	      	});
	    }
	    
	function exam_reload() {
		$("#examList").datagrid("reload");
	}
</script>