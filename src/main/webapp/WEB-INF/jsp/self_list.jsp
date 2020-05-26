<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<h3>自我鉴定</h3>
<form method="POST" action="">
	<table class="easyui-datagrid" id="selfList" title="部门列表"
		data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'self/list', ethod:'get',pageSize:20,
		fitColumns:true,toolbar:toolbar_self">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'self_id',align:'center',width:150">自我鉴定编号</th>
				<th data-options="field:'title',align:'center',width:150">主题</th>
				<th data-options="field:'start_date',align:'center',width:150,formatter:TAOTAO.formatDateTime">开始时间</th>
				<th data-options="field:'end_date',align:'center',width:150,formatter:TAOTAO.formatDateTime">结束时间</th>
				<th data-options="field:'evaluation_type',align:'center',width:150">鉴定周期分类</th>
				<th data-options="field:'examination_date',align:'center',width:150">考核周期</th>
				<th data-options="field:'title',align:'center',width:150">鉴定状态</th>
				<th data-options="field:'now_time',align:'center',width:150">创建时间</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar_self"
		style="height: 22px; padding: 3px 11px; background: #fafafa;">

		<c:forEach items="${sessionScope.sysPermissionList}" var="per">
			<c:if test="${per=='self:add' }">
				<div style="float: left;">
					<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add"
						onclick="self_add()">新增</a>
				</div>
			</c:if>
			<c:if test="${per=='self:edit' }">
				<div style="float: left;">
					<a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit"
						onclick="self_edit()">编辑</a>
				</div>
			</c:if>
			<c:if test="${per=='self:delete' }">
				<div style="float: left;">
					<a href="#" class="easyui-linkbutton" plain="true"
						icon="icon-cancel" onclick="self_delete()">删除</a>
				</div>
			</c:if>
		</c:forEach>

		<div class="datagrid-btn-separator"></div>

		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload"
				onclick="self_reload()">刷新</a>
		</div>

		<div id="search_self" style="float: right;">
			<input id="search_text_self" class="easyui-searchbox"
				data-options="searcher:doSearch_self,prompt:'请输入...',menu:'#menu_self'"
				style="width: 250px; vertical-align: middle;"> </input>
			<div id="menu_self" style="width: 120px">
				<div data-options="name:'selfId'">部门编号</div>
				<div data-options="name:'selfName'">部门名称</div>
			</div>
		</div>

	</div>

	<div id="selfEditWindow" class="easyui-window" title="编辑部门"
		data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'self/edit'"
		style="width: 65%; height: 65%; padding: 10px;"></div>

	<div id="selfAddWindow" class="easyui-window" title="添加部门"
		data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'self/add'"
		style="width: 65%; height: 65%; padding: 10px;"></div>

	<div id="selfNoteDialog" class="easyui-dialog" title="部门职责"
		data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save'"
		style="width: 55%; height: 65%; padding: 10px">
		<form id="selfNoteForm" class="itemForm" method="post">
			<input type="hidden" name="selfId" />
			<table cellpadding="5">
				<tr>
					<td>备注:</td>
					<td><textarea
							style="width: 800px; height: 450px; visibility: hidden;"
							name="note"></textarea></td>
				</tr>
			</table>
		</form>
		<div style="padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="updateselfNote()">保存</a>
		</div>
	</div>
	<script>
		function doSearch_self(value, name) { //用户输入用户名,点击搜素,触发此函数  
			if (value == null || value == '') {

				$("#selfList").datagrid({
					title : '部门列表',
					singleSelect : false,
					collapsible : true,
					pagination : true,
					rownumbers : true,
					method : 'get',
					nowrap : true,
					toolbar : "toolbar_self",
					url : 'self/list',
					method : 'get',
					loadMsg : '数据加载中......',
					fitColumns : true,//允许表格自动缩放,以适应父容器  
					columns : [ [ {
						field : 'ck',
						checkbox : true
					}, {
						field : 'selfId',
						width : 150,
						align : 'center',
						title : '部门编号'
					}, {
						field : 'selfName',
						width : 150,
						align : 'center',
						title : '部门名称'
					}, {
						field : 'note',
						width : 150,
						align : 'center',
						title : '部门职责',
						formatter : formatselfNote
					}, ] ],
				});
			} else {
				$("#selfList").datagrid(
						{
							title : '部门列表',
							singleSelect : false,
							collapsible : true,
							pagination : true,
							rownumbers : true,
							method : 'get',
							nowrap : true,
							toolbar : "toolbar_self",
							url : 'self/search_self_by_' + name
									+ '?searchValue=' + value,
							loadMsg : '数据加载中......',
							fitColumns : true,//允许表格自动缩放,以适应父容器  
							columns : [ [ {
								field : 'ck',
								checkbox : true
							}, {
								field : 'selfId',
								width : 150,
								align : 'center',
								title : '部门编号'
							}, {
								field : 'selfName',
								width : 150,
								align : 'center',
								title : '部门名称'
							}, {
								field : 'note',
								width : 150,
								align : 'center',
								title : '部门职责',
								formatter : formatselfNote
							}, ] ],
						});
			}
		}

		var selfNoteEditor;

		//格式化部门职责
		function formatselfNote(value, row, index) {
			if (value != null && value != '') {
				return "<a href=javascript:openselfNote(" + index + ")>"
						+ "部门职责" + "</a>";
			} else {
				return "无";
			}
		}

		//根据index拿到该行值
		function onselfClickRow(index) {
			var rows = $('#selfList').datagrid('getRows');
			return rows[index];

		}

		//打开部门要求富文本编辑器对话框
		function openselfNote(index) {
			var row = onselfClickRow(index);
			$("#selfNoteDialog").dialog(
					{
						onOpen : function() {
							$("#selfNoteForm [name=selfId]").val(row.selfId);
							selfNoteEditor = TAOTAO
									.createEditor("#selfNoteForm [name=note]");
							selfNoteEditor.html(row.note);
						},

						onBeforeClose : function(event, ui) {
							// 关闭Dialog前移除编辑器
							KindEditor.remove("#selfNoteForm [name=note]");
						}
					}).dialog("open");

		};

		//更新部门要求
		function updateselfNote() {
			$.get("self/edit_judge", '', function(data) {
				if (data.msg != null) {
					$.messager.alert('提示', data.msg);
				} else {
					selfNoteEditor.sync();
					$.post("self/update_note", $("#selfNoteForm").serialize(),
							function(data) {
								if (data.status == 200) {
									$("#selfNoteDialog").dialog("close");
									$("#selfList").datagrid("reload");
									$.messager.alert("操作提示", "更新部门职责成功！");
								} else {
									$.messager.alert("操作提示", "更新部门职责失败！");
								}
							});
				}
			});
		}

		function getselfSelectionsIds() {
			var selfList = $("#selfList");
			var sels = selfList.datagrid("getSelections");
			var ids = [];
			for ( var i in sels) {
				ids.push(sels[i].selfId);
			}
			ids = ids.join(",");

			return ids;
		}

		function self_add() {
			$.get("self/add_judge", '', function(data) {
				if (data.msg != null) {
					$.messager.alert('提示', data.msg);
				} else {
					$("#selfAddWindow").window("open");
				}
			});
		}

		function self_edit() {
			$.get("self/edit_judge", '', function(data) {
				if (data.msg != null) {
					$.messager.alert('提示', data.msg);
				} else {
					var ids = getselfSelectionsIds();

					if (ids.length == 0) {
						$.messager.alert('提示', '必须选择一个部门才能编辑!');
						return;
					}
					if (ids.indexOf(',') > 0) {
						$.messager.alert('提示', '只能选择一个部门!');
						return;
					}

					$("#selfEditWindow").window(
							{
								onLoad : function() {
									//回显数据
									var data = $("#selfList").datagrid(
											"getSelections")[0];
									$("#selfEditForm").form("load", data);
									selfEditEditor.html(data.note);

									TAOTAO.init({
										"pics" : data.image,
									});
								}
							}).window("open");
				}
			});
		}

		function self_delete() {
			$
					.get(
							"self/delete_judge",
							'',
							function(data) {
								if (data.msg != null) {
									$.messager.alert('提示', data.msg);
								} else {
									var ids = getselfSelectionsIds();
									if (ids.length == 0) {
										$.messager.alert('提示', '未选中部门!');
										return;
									}
									$.messager
											.confirm(
													'确认',
													'确定删除ID为 ' + ids + ' 的部门吗？',
													function(r) {
														if (r) {
															var params = {
																"ids" : ids
															};
															$
																	.post(
																			"self/delete_batch",
																			params,
																			function(
																					data) {
																				if (data.status == 200) {
																					$.messager
																							.alert(
																									'提示',
																									'删除部门成功!',
																									undefined,
																									function() {
																										$(
																												"#selfList")
																												.datagrid(
																														"reload");
																									});
																				}
																			});
														}
													});
								}
							});
		}

		function self_reload() {
			$("#selfList").datagrid("reload");
		}
	</script>