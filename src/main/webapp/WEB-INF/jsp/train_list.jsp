<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="trainList" title="培训列表" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'train/list', ethod:'get',pageSize:20,
		fitColumns:true,toolbar:toolbar_train">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">培训编号</th>
			<th data-options="field:'name',align:'center',width:100">培训名称</th>
			<th data-options="field:'mode',align:'center',width:100">培训方式</th>
			<th data-options="field:'teacher',align:'center',width:100">培训老师</th>
			<th data-options="field:'start_time',width:130,align:'center',formatter:TAOTAO.formatDateTime">开始时间</th>
			<th data-options="field:'end_time',width:130,align:'center',formatter:TAOTAO.formatDateTime">结束时间</th>
			<th data-options="field:'address',align:'center',width:100">培训地点</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_train" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='train:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="train_add()">新增</a>  
		    </div>  
		</c:if>
		
		<c:if test="${per=='train:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" 
		        	onclick="train_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="train_reload()">刷新</a>  
	</div>  
	
    <div id="search_train" style="float: right;">
        <input id="search_text_train" class="easyui-searchbox"  
            data-options="searcher:doSearch_train,prompt:'请输入...',menu:'#menu_train'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_train" style="width:120px"> 
			<div data-options="name:'trainId'">培训编号</div> 
			<div data-options="name:'trainName'">培训名称</div>
			<div data-options="name:'trainMode'">培训方式</div>
		</div>     
    </div>  

</div>  



<div id="trainAddWindow" class="easyui-window" title="新建" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'train/add'" 
	style="width:65%;height:65%;padding:10px;">
</div>




<script>
function doSearch_train(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		
		$("#trainList").datagrid({
			title:'培训列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_train", url:'train/list', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	             	{field : 'ck', checkbox:true }, 
	             	{field : 'id', width : 150, align:'center', title : '培训编号'},
	             	{field : 'name', width : 150, align : 'center', title : '培训名称'},
	             	{field : 'mode', width : 150, align : 'center', title : '培训方式'},
	             	{field : 'teacher', width : 150, align : 'center', title : '培训老师'},
	             	{field : 'start_time', width : 130, title : '开始时间', align:'center', formatter:TAOTAO.formatDateTime},
	             	{field : 'end_time', width : 130, title : '结束时间', align:'center', formatter:TAOTAO.formatDateTime},
	             	{field : 'address', width : 150, align : 'center', title : '培训地址'},
	        ] ],  
	    });
	}else{
		$("#trainList").datagrid({  
			 title:'培训列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
				nowrap:true, toolbar:"toolbar_train", url:'train/search_train_by_'+name+'?searchValue='+value,
				loadMsg:'数据加载中......', fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	                 	{field : 'ck', checkbox:true }, 
		             	{field : 'id', width : 150, align:'center', title : '培训编号'},
		             	{field : 'name', width : 150, align : 'center', title : '培训名称'},
		             	{field : 'mode', width : 150, align : 'center', title : '培训方式'},
		             	{field : 'teacher', width : 150, align : 'center', title : '培训老师'},
		             	{field : 'start_time', width : 130, title : '开始时间', align:'center', formatter:TAOTAO.formatDateTime},
		             	{field : 'end_time', width : 130, title : '结束时间', align:'center', formatter:TAOTAO.formatDateTime},
		             	{field : 'address', width : 150, align : 'center', title : '培训地址'},
	        ] ],  
	    });
	}
} 

	
	
	

	//根据index拿到该行值
	function onTrainClickRow(index) {
		var rows = $('#trainList').datagrid('getRows');
		return rows[index];
		
	}
	

	

    function getTrainSelectionsIds(){
    	var trainList = $("#trainList");
    	var sels = trainList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function train_add(){
    	$.get("train/add_judge",'',function(data){
    		console.log(data);
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			$("#trainAddWindow").window("open");
       		}
       	});
    }
    
    function train_edit(){
    	$.get("train/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getTrainSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个培训才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个培训!');
            		return ;
            	}
            	
            	$("#trainEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#trainList").datagrid("getSelections")[0];
            			$("#trainEditForm").form("load", data);
            			
            			TAOTAO.init({
            				"pics" : data.image,
            			});
            		}
            	}).window("open");
       		}
       	});
    }
    
    function train_delete(){
    	$.get("train/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getTrainSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中培训!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的培训吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("train/delete_batch",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除培训成功!',undefined,function(){
                					$("#trainList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		}
      	});
    }
    
    function train_reload(){
    	$("#trainList").datagrid("reload");
    }
</script>