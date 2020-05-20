<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<table class="easyui-datagrid" id="branchList" title="机构列表"
	data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'branch/list',method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_branch">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">机构编号</th>
			<th data-options="field:'name',align:'center',width:100">机构名称</th>
			<th data-options="field:'short_name',align:'center',width:100">机构简称</th>

		</tr>
	</thead>
</table>

<div id="toolbar_branch"
	style="height: 22px; padding: 3px 11px; background: #fafafa;">

	<c:forEach items="${sessionScope.sysPermissionList}" var="per">
		<c:if test="${per=='branch:add' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
					onclick="branch_add()">新增</a>
			</div>
		</c:if>
		<c:if test="${per=='branch:edit' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
					onclick="branch_edit()">编辑</a>
			</div>
		</c:if>
		<c:if test="${per=='branch:delete' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="branch_delete()">删除</a>
			</div>
		</c:if>
	</c:forEach>

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
			onclick="branch_reload()">刷新</a>
	</div>

	<div id="search_branch" style="float: right;">
		<input id="search_text_branch" class="easyui-searchbox"
			data-options="searcher:doSearch_branch,prompt:'请输入...',menu:'#menu_branch'"
			style="width: 250px; vertical-align: middle;"> </input>
		<div id="menu_branch" style="width: 120px">
			<div data-options="name:'id'">机构编号</div>
			<div data-options="name:'name'">机构名称</div>
			<div data-options="name:'short_name'">机构简称</div>
		</div>
	</div>
</div>

<script>
	function doSearch_branch(value, name) { //用户输入用户名,点击搜素,触发此函数  
		if (value == null || value == '') {

			$("#branchList").datagrid({
				title : '机构列表',
				singleSelect : false,
				collapsible : true,
				pagination : true,
				rownumbers : true,
				method : 'get',
				nowrap : true,
				toolbar : "toolbar_branch",
				url : 'branch/list',
				method : 'get',
				loadMsg : '数据加载中......',
				fitColumns : true,//允许表格自动缩放,以适应父容器
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					width : 100,
					align : 'center',
					title : '机构编号'
				}, {
					field : 'name',
					width : 100,
					align : 'center',
					title : '机构名称'
				}, {
					field : 'short_name',
					width : 100,
					align : 'center',
					title : '机构简称'
				}, ] ],
			});
		} else {
			$("#branchList").datagrid(
					{
						title : '机构列表',
						singleSelect : false,
						collapsible : true,
						pagination : true,
						rownumbers : true,
						method : 'get',
						nowrap : true,
						toolbar : "toolbar_branch",
						url : 'branch/search_branch_by_' + name
								+ '?searchValue=' + value,
						loadMsg : '数据加载中......',
						fitColumns : true,//允许表格自动缩放,以适应父容器
						columns : [ [ {
							field : 'ck',
							checkbox : true
						}, {
							field : 'id',
							width : 100,
							align : 'center',
							title : '机构编号'
						}, {
							field : 'name',
							width : 100,
							align : 'center',
							title : '机构名称'
						}, {
							field : 'short_name',
							width : 100,
							align : 'center',
							title : '机构简称'
						}, ] ],
					});
		}
	}

	function getBranchSelectionsIds() {
		var branchList = $("#branchList");
		var sels = branchList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(",");

		return ids;
	}

	function branch_add() {
		$.get("branch/add_judge", '', function(data) {
			if (data.msg != null) {
				$.messager.alert('提示', data.msg);
			} else {
				$("#branchAddWindow").window("open");
			}
		});
	}
	  function branch_edit(){
	    	$.get("branch/edit_judge",'',function(data){
	       		if(data.msg != null){
	       			$.messager.alert('提示', data.msg);
	       		}else{
	       			var ids = getBranchSelectionsIds();
	               	
	               	if(ids.length == 0){
	               		$.messager.alert('提示','必须选择一个=机构哦才能编辑!');
	               		return ;
	               	}
	               	if(ids.indexOf(',') > 0){
	               		$.messager.alert('提示','只能选择一个机构!');
	               		return ;
	               	}
	               	
	               	$("#branchEditWindow").window({
	               		onLoad :function(){
	               			//回显数据
	               			var data = $("#branchList").datagrid("getSelections")[0];
	               			
	               			$("#branchEditForm").form("load", data);
	               			branchEditEditor.html(data.note);
	               			
	               			TAOTAO.init({
	               				"pics" : data.image,
	               			});
	               			
	        
	               		}
	               	}).window("open");
	       		}
	       	});
	    }
	    
	    function branch_delete(){
	    	$.get("branch/delete_judge",'',function(data){
	      		if(data.msg != null){
	      			$.messager.alert('提示', data.msg);
	      		}else{
	      			var ids = getBranchSelectionsIds();
	              	if(ids.length == 0){
	              		$.messager.alert('提示','未选中机构!');
	              		return ;
	              	}
	              	$.messager.confirm('确认','确定删除ID为 '+ids+' 的机构吗？',function(r){
	              	    if (r){
	              	    	var params = {"ids":ids};
	                      	$.post("branch/delete_batch",params, function(data){
	                  			if(data.status == 200){
	                  				$.messager.alert('提示','删除机构成功!',undefined,function(){
	                  					$("#branchList").datagrid("reload");
	                  				});
	                  			}
	                  		});
	              	    }
	              	});
	      		}
	      	});
	    }
	    
	function branch_reload() {
		$("#branchList").datagrid("reload");
	}
</script>