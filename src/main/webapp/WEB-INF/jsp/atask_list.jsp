<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="ataskList" title="考核任务列表" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'atask/list', ethod:'get',pageSize:20,
		fitColumns:true,toolbar:toolbar_atask">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">任务编号</th>
			<th data-options="field:'theme',align:'center',width:100">任务主题</th>
			<th data-options="field:'type',align:'center',width:100">考核期间类型</th>
			<th data-options="field:'cycle',align:'center',width:100">考核周期</th>
			<th data-options="field:'start_time',width:130,align:'center',formatter:TAOTAO.formatDate">开始日期</th>
			<th data-options="field:'end_time',width:130,align:'center',formatter:TAOTAO.formatDate">结束日期</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_atask" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='atask:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="atask_add()">新增</a>  
		    </div>  
		</c:if>
		
		<c:if test="${per=='atask:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" 
		        	onclick="atask_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="atask_reload()">刷新</a>  
	</div>  
	
    <div id="search_atask" style="float: right;">
        <input id="search_text_atask" class="easyui-searchbox"  
            data-options="searcher:doSearch_atask,prompt:'请输入...',menu:'#menu_atask'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_atask" style="width:120px"> 
			<div data-options="name:'ataskId'">任务编号</div> 
			<div data-options="name:'ataskTheme'">任务主题</div>
			<div data-options="name:'ataskType'">考核期间类型</div>
		</div>     
    </div>  

</div>  



<div id="ataskAddWindow" class="easyui-window" title="新建" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'atask/add'" 
	style="width:65%;height:65%;padding:10px;">
</div>




<script>
function doSearch_atask(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		
		$("#ataskList").datagrid({
			title:'考核列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_atask", url:'atask/list', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	             	{field : 'ck', checkbox:true }, 
	             	{field : 'id', width : 150, align:'center', title : '任务编号'},
	             	{field : 'theme', width : 150, align:'center', title : '人物主题'},
	             	{field : 'type', width : 150, align:'center', title : '考核期间类型'},
	             	{field : 'cycle', width : 150, align : 'center', title : '考核周期'},
	             	{field : 'start_time', width : 130, title : '开始日期', align:'center', formatter:TAOTAO.formatDate},
	             	{field : 'end_time', width : 130, title : '结束日期', align:'center', formatter:TAOTAO.formatDate},	             	
	        ] ],

	    });
	}else{
		$("#ataskList").datagrid({  
			 title:'培训列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
				nowrap:true, toolbar:"toolbar_atask", url:'atask/search_atask_by_'+name+'?searchValue='+value,
				loadMsg:'数据加载中......', fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	                 	{field : 'ck', checkbox:true }, 
		             	{field : 'id', width : 150, align:'center', title : '任务编号'},
		             	{field : 'theme', width : 150, align:'center', title : '人物主题'},
		             	{field : 'type', width : 150, align:'center', title : '考核期间类型'},
		             	{field : 'cycle', width : 150, align : 'center', title : '考核周期'},
		             	{field : 'start_time', width : 130, title : '开始日期', align:'center', formatter:TAOTAO.formatDate},
		             	{field : 'end_time', width : 130, title : '结束日期', align:'center', formatter:TAOTAO.formatDate},	             	
	        ] ],  
	    });
	}
} 


	
	

	//根据index拿到该行值
	function onAtaskClickRow(index) {
		var rows = $('#ataskList').datagrid('getRows');
		return rows[index];
		
	}
	

	

    function getAtaskSelectionsIds(){
    	var ataskList = $("#ataskList");
    	var sels = ataskList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function atask_add(){
    	$.get("atask/add_judge",'',function(data){
    		console.log(data);
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			$("#ataskAddWindow").window("open");
       		}
       	});
    }
    
    function atask_edit(){
    	$.get("atask/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getAtaskSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个培训才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个培训!');
            		return ;
            	}
            	
            	$("#ataskEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#ataskList").datagrid("getSelections")[0];
            			$("#ataskEditForm").form("load", data);
            			
            			TAOTAO.init({
            				"pics" : data.image,
            			});
            		}
            	}).window("open");
       		}
       	});
    }
    
    function atask_delete(){
    	$.get("atask/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getAtaskSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中培训!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的培训吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("atask/delete_batch",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除培训成功!',undefined,function(){
                					$("#ataskList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		}
      	});
    }
    
    function atask_reload(){
    	$("#ataskList").datagrid("reload");
    }
</script>