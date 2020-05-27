<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<table class="easyui-datagrid" id="reportList" title="绩效列表"
	data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'report/list',method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_report">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">编号</th>
			<th data-options="field:'topic',align:'center',width:100">主题</th>
			<th data-options="field:'type',align:'center',width:100">类型</th>
			
		</tr>
	</thead>
</table>

<div id="toolbar_report"
	style="height: 22px; padding: 3px 11px; background: #fafafa;">

	<c:forEach items="${sessionScope.sysPermissionList}" var="per">
		<c:if test="${per=='report:add' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
					onclick="report_add()">新增</a>
			</div>
		</c:if>
		
		<c:if test="${per=='report:edit' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="report_edit()">编辑</a>
			</div>
		</c:if>
		<c:if test="${per=='report:delete' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="report_delete()">删除</a>
			</div>
		</c:if>
	</c:forEach>

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
			onclick="report_reload()">刷新</a>
	</div>

</div>
<div id="reportEditWindow" class="easyui-window" title="编辑绩效" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'report/edit'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="reportAddWindow" class="easyui-window" title="添加绩效" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'report/add'" style="width:45%;height:60%;padding:10px;">
</div>
<script>
	function doSearch_report(value, name) { //用户输入用户名,点击搜素,触发此函数  
		if (value == null || value == '') {

			$("#reportList").datagrid({
				title : '绩效列表',
				singleSelect : false,
				collapsible : true,
				pagination : true,
				rownumbers : true,
				method : 'get',
				nowrap : true,
				toolbar : "toolbar_report",
				url : 'report/list',
				method : 'get',
				loadMsg : '数据加载中......',
				fitColumns : true,//允许表格自动缩放,以适应父容器
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'idW',
					width : 100,
					align : 'center',
					title : '绩效id'
				}, {
					field : 'title',
					width : 100,
					align : 'center',
					title : '主题'
				}, {
					field : 'people',
					width : 100,
					align : 'center',
					title : '人员'
				}, {
					field : 'createDate',
					width : 100,
					align : 'center',
					title : '创建日期'
				},] ],
			});
		} else {
			$("#reportList").datagrid(
					{
						title : '绩效列表',
						singleSelect : false,
						collapsible : true,
						pagination : true,
						rownumbers : true,
						method : 'get',
						nowrap : true,
						toolbar : "toolbar_report",
						url : 'report/search_report_by_' + name
								+ '?searchValue=' + value,
						loadMsg : '数据加载中......',
						fitColumns : true,//允许表格自动缩放,以适应父容器
						columns : [ [ {
							field : 'ck',
							checkbox : true
						},{
							field : 'idW',
							width : 100,
							align : 'center',
							title : '绩'
						}, {
							field : 'title',
							width : 100,
							align : 'center',
							title : '主题'
						}, {
							field : 'people',
							width : 100,
							align : 'center',
							title : '人员'
						}, 
						{
							field : 'createDate',
							width : 100,
							align : 'center',
							title : '创建时间'
						}, ] ],
					});
		}
	}

	function getreportSelectionsIds() {
		var reportList = $("#reportList");
		var sels = reportList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(",");

		return ids;
	}

	function report_add() {
		$.get("report/add_judge", '', function(data) {
			if (data.msg != null) {
				$.messager.alert('提示', data.msg);
			} else {
				$("#reportAddWindow").window("open");
			}
		});
	}
	  function report_edit(){
	    	$.get("report/edit_judge",'',function(data){
	       		if(data.msg != null){
	       			$.messager.alert('提示', data.msg);
	       		}else{
	       			var ids = getreportSelectionsIds();
	               	
	               	if(ids.length == 0){
	               		$.messager.alert('提示','必须选择一个绩效哦才能编辑!');
	               		return ;
	               	}
	               	if(ids.indexOf(',') > 0){
	               		$.messager.alert('提示','只能选择一个绩效!');
	               		return ;
	               	}
	               	
	               	$("#reportEditWindow").window({
	               		onLoad :function(){
	               			//回显数据
	               			var data = $("#reportList").datagrid("getSelections")[0];
	               			
	               			$("#reportEditForm").form("load", data);
	               			/* reportEditEditor.html(data.note); */
	               			
	               			TAOTAO.init({
	               				"pics" : data.image,
	               			});
	               			
	        
	               		}
	               	}).window("open");
	       		}
	       	});
	    }
	    
	    function report_delete(){
	    	$.get("report/delete_judge",'',function(data){
	      		if(data.msg != null){
	      			$.messager.alert('提示', data.msg);
	      		}else{
	      			var ids = getreportSelectionsIds();
	              	if(ids.length == 0){   
	              		$.messager.alert('提示','未选中绩效!');
	              		return ;
	              	}
	              	$.messager.confirm('确认','确定删除ID为 '+ids+' 的绩效吗？',function(r){
	              	    if (r){
	              	    	var params = {"ids":ids};
	                      	$.post("report/delete_batch",params, function(data){
	                  			if(data.status == 200){
	                  				$.messager.alert('提示','删除绩效成功!',undefined,function(){
	                  					$("#reportList").datagrid("reload");
	                  				});
	                  			}
	                  		});
	              	    }
	              	});
	      		}
	      	});
	    }
	    
	function report_reload() {
		$("#reportList").datagrid("reload");
	}
</script>