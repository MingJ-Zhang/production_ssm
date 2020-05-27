<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>	
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<table class="easyui-datagrid" id="qualityList" title="编号规则设置"
	data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'quality/list',method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_quality">
	<thead> 
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',align:'center',width:150">编号规则名称</th>
            <th data-options="field:'documentName',align:'center',width:150">单据名称</th>
            <th data-options="field:'prefix',align:'center',width:150">编号前缀</th>
            <th data-options="field:'dateType',align:'center',width:150">日期类型</th>
            <th data-options="field:'length',align:'center',width:150">流水号长度</th>
            <th data-options="field:'examples',align:'center',width:150">编号示例</th>
            <th data-options="field:'defaultRule',align:'center',width:150">是否为缺省规则</th>
            <th data-options="field:'type',align:'center',width:150">启用状态</th>
		</tr>
	</thead>
</table>

<div id="toolbar_quality"
	style="height: 22px; padding: 3px 11px; background: #fafafa;">

	<c:forEach items="${sessionScope.sysPermissionList}" var="per">
		<c:if test="${per=='quality:add' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
					onclick="quality_add()">新增</a>
			</div>
		</c:if>
		<c:if test="${per=='quality:delete' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="quality_delete()">删除</a>
			</div>
		</c:if>
	</c:forEach>

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
			onclick="quality_reload()">刷新</a>
	</div>

	
</div>

<div id="qualityAddWindow" class="easyui-window" title="添加" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'quality/add'" style="width:45%;height:60%;padding:10px;">
</div>
<script>

	function getqualitySelectionsIds() {
		var qualityList = $("#qualityList");
		var sels = qualityList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(",");

		return ids;
	}

	function quality_add() {
		$.get("quality/add_judge", '', function(data) {
			if (data.msg != null) {
				$.messager.alert('提示', data.msg);
			} else {
				$("#qualityAddWindow").window("open");
			}
		});
	}

	    
	    function quality_delete(){
	    	$.get("quality/delete_judge",'',function(data){
	      		if(data.msg != null){
	      			$.messager.alert('提示', data.msg);
	      		}else{
	      			var ids = getqualitySelectionsIds();
	              	if(ids.length == 0){   
	              		$.messager.alert('提示','未选中!');
	              		return ;
	              	}
	              	$.messager.confirm('确认','确定删除 '+ids+' 吗？',function(r){
	              	    if (r){
	              	    	var params = {"ids":ids};
	                      	$.post("quality/delete_batch",params, function(data){
	                  			if(data.status == 200){
	                  				$.messager.alert('提示','删除成功!',undefined,function(){
	                  					$("#qualityList").datagrid("reload");
	                  				});
	                  			}
	                  		});
	              	    }
	              	});
	      		}
	      	});
	    }
	    
	function quality_reload() {
		$("#qualityList").datagrid("reload");
	}
</script>