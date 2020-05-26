<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="salaryList" title="机构列表" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'salary/list', ethod:'get',pageSize:20,
		fitColumns:true,toolbar:toolbar_salary">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',align:'center',width:150">编号</th>
            <th data-options="field:'topic',align:'center',width:150">主题</th>
            <th data-options="field:'month',align:'center',width:150">月份</th>
            <th data-options="field:'start_date',align:'center',width:150,formatter:TAOTAO.formatDateTime">开始时间</th>
            <th data-options="field:'end_date',align:'center',width:150,formatter:TAOTAO.formatDateTime">结束时间</th>
            <th data-options="field:'user',align:'center',width:150">编制人</th>
            <th data-options="field:'date',align:'center',width:150,formatter:TAOTAO.formatDateTime">编制日期</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_salary" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='salary:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="salary_add()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='salary:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" 
		        	onclick="salary_edit()">编辑</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='salary:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" 
		        	onclick="salary_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="salary_reload()">刷新</a>  
	</div>  
	
    <div id="search_salary" style="float: right;">
        <input id="search_text_salary" class="easyui-searchbox"  
            data-options="searcher:doSearch_salary,prompt:'请输入...',menu:'#menu_salary'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_salary" style="width:120px"> 
			<div data-options="name:'id'">薪资编号</div> 
			<div data-options="name:'topic'">薪资描述</div>
		</div>     
    </div>  

</div>  


<div id="salaryAddWindow" class="easyui-window" title="添加部门" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'salary/add'" 
	style="width:65%;height:65%;padding:10px;">
</div>




<script>
function doSearch_salary(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		
		$("#salaryList").datagrid({
	        title:'机构列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, 
	        	method:'get', nowrap:true,  
	        toolbar:"toolbar_salary", url:'salary/list', method:'get', loadMsg:'数据加载中......', 
	        	fitColumns:true,//允许表格自动缩放,以适应父容器  
	        columns : [ [ 
	             	{field : 'ck', checkbox:true }, 
	             	{field : 'id', width : 150, align:'center', title : '机构编号'},
	             	{field : 'topic', width : 150, align : 'center', title : '机构名称'},
	        ] ],  
	    });
	}else{
		$("#salaryList").datagrid({  
	        title:'机构列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, 
	        	method:'get', nowrap:true,  
	        toolbar:"toolbar_salary", url:'salary/search_salary_by_'+name+'?searchValue='+value, 
	        	loadMsg:'数据加载中......', fitColumns:true,//允许表格自动缩放,以适应父容器  
	        columns : [ [ 
	                 	{field : 'ck', checkbox:true }, 
		             	{field : 'id', width : 150, align:'center', title : '机构编号'},
		             	{field : 'topic', width : 150, align : 'center', title : '机构名称'},
	        ] ],  
	    });
	}
} 

	
	
	

	//根据index拿到该行值
	function onsalaryClickRow(index) {
		var rows = $('#salaryList').datagrid('getRows');
		return rows[index];
		
	}
	

	

    function getsalarySelectionsIds(){
    	var salaryList = $("#salaryList");
    	var sels = salaryList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function salary_add(){
    	$.get("salary/add_judge",'',function(data){
    		console.log(data);
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			$("#salaryAddWindow").window("open");
       		}
       	});
    }
    
    function salary_edit(){
    	$.get("salary/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getsalarySelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个机构才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个机构!');
            		return ;
            	}
            	
            	$("#salaryEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#salaryList").datagrid("getSelections")[0];
            			$("#salaryEditForm").form("load", data);
            			
            			TAOTAO.init({
            				"pics" : data.image,
            			});
            		}
            	}).window("open");
       		}
       	});
    }
    
    function salary_delete(){
    	$.get("salary/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getsalarySelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中机构!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的薪酬信息吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("salary/delete_batch",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除机构成功!',undefined,function(){
                					$("#salaryList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		}
      	});
    }
    
    function salary_reload(){
    	$("#salaryList").datagrid("reload");
    }
</script>