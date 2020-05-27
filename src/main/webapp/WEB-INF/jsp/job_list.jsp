<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<table class="easyui-datagrid" id="jobList" title="绩效列表"
	data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'job/list',method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_job">
	<thead>
		<tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'idW',align:'center',width:100">绩效编号</th>
			<th data-options="field:'title',align:'center',width:100">主题</th>
			<th data-options="field:'people',align:'center',width:100">人</th>
			<th data-options="field:'startDate',align:'center',width:100,formatter:TAOTAO.formatDateTime" >日期</th>	
		</tr>
	</thead>
</table>

<div id="toolbar_job"
	style="height: 22px; padding: 3px 11px; background: #fafafa;">

	<c:forEach items="${sessionScope.sysPermissionList}" var="per">
		<c:if test="${per=='job:add' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
					onclick="job_add()">新增</a>
			</div>
		</c:if>
		
		<c:if test="${per=='job:edit' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="job_edit()">编辑</a>
			</div>
		</c:if>
		<c:if test="${per=='job:delete' }">
			<div style="float: left;">
				<a href="#" class="easyui-linkbutton" plain="true"
					icon="icon-cancel" onclick="job_delete()">删除</a>
			</div>
		</c:if>
	</c:forEach>

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
			onclick="job_reload()">刷新</a>
	</div>

</div>
<div id="jobEditWindow" class="easyui-window" title="编辑绩效" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'job/edit'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="jobAddWindow" class="easyui-window" title="添加绩效" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'job/add'" style="width:45%;height:60%;padding:10px;">
</div>
<script>
	function doSearch_job(value, name) { //用户输入用户名,点击搜素,触发此函数  
		if (value == null || value == '') {

			$("#jobList").datagrid({
				title : '绩效列表',
				singleSelect : false,
				collapsible : true,
				pagination : true,
				rownumbers : true,
				method : 'get',
				nowrap : true,
				toolbar : "toolbar_job",
				url : 'job/list',
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
			$("#jobList").datagrid(
					{
						title : '绩效列表',
						singleSelect : false,
						collapsible : true,
						pagination : true,
						rownumbers : true,
						method : 'get',
						nowrap : true,
						toolbar : "toolbar_job",
						url : 'job/search_job_by_' + name
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

	function getjobSelectionsIds() {
		var jobList = $("#jobList");
		var sels = jobList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].idW);
		}
		ids = ids.join(",");

		return ids;
	}

	function job_add() {
		$.get("job/add_judge", '', function(data) {
			if (data.msg != null) {
				$.messager.alert('提示', data.msg);
			} else {
				$("#jobAddWindow").window("open");
			}
		});
	}
	  function job_edit(){
	    	$.get("job/edit_judge",'',function(data){
	       		if(data.msg != null){
	       			$.messager.alert('提示', data.msg);
	       		}else{
	       			var ids = getjobSelectionsIds();
	               	
	               	if(ids.length == 0){
	               		$.messager.alert('提示','必须选择一个绩效哦才能编辑!');
	               		return ;
	               	}
	               	if(ids.indexOf(',') > 0){
	               		$.messager.alert('提示','只能选择一个绩效!');
	               		return ;
	               	}
	               	
	               	$("#jobEditWindow").window({
	               		onLoad :function(){
	               			//回显数据
	               			var data = $("#jobList").datagrid("getSelections")[0];
	               			
	               			$("#jobEditForm").form("load", data);
	               			/* jobEditEditor.html(data.note); */
	               			
	               			TAOTAO.init({
	               				"pics" : data.image,
	               			});
	               			
	        
	               		}
	               	}).window("open");
	       		}
	       	});
	    }
	    
	    function job_delete(){
	    	$.get("job/delete_judge",'',function(data){
	      		if(data.msg != null){
	      			$.messager.alert('提示', data.msg);
	      		}else{
	      			var ids = getjobSelectionsIds();
	              	if(ids.length == 0){   
	              		$.messager.alert('提示','未选中绩效!');
	              		return ;
	              	}
	              	$.messager.confirm('确认','确定删除ID为 '+ids+' 的绩效吗？',function(r){
	              	    if (r){
	              	    	var params = {"ids":ids};
	                      	$.post("job/delete_batch",params, function(data){
	                  			if(data.status == 200){
	                  				$.messager.alert('提示','删除绩效成功!',undefined,function(){
	                  					$("#jobList").datagrid("reload");
	                  				});
	                  			}
	                  		});
	              	    }
	              	});
	      		}
	      	});
	    }
	    
	function job_reload() {
		$("#jobList").datagrid("reload");
	}
</script>