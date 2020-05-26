<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="assessmentList" title="培训考核列表" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'assessment/list', ethod:'get',pageSize:20,
		fitColumns:true,toolbar:toolbar_assessment">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:100">考核编号</th>
			<th data-options="field:'trainId',align:'center',width:100,formatter:formatTrainId">培训编号</th>
			<th data-options="field:'trainName',align:'center',width:100,formatter:formatTrainName">培训名称</th>
			<th data-options="field:'trainMode',align:'center',width:100,formatter:formatTrainMode">培训方式</th>
			<th data-options="field:'trainTeacher',align:'center',width:100,formatter:formatTrainTeacher">培训老师</th>
			<th data-options="field:'teacher',align:'center',width:100">考评人</th>
			<th data-options="field:'mode',align:'center',width:100">考核方式</th>
			<th data-options="field:'time',width:130,align:'center',formatter:TAOTAO.formatDateTime">考核时间</th>
			
        </tr>
    </thead>
</table>

<div  id="toolbar_assessment" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='assessment:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="assessment_add()">新增</a>  
		    </div>  
		</c:if>
		
		<c:if test="${per=='assessment:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" 
		        	onclick="assessment_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="assessment_reload()">刷新</a>  
	</div>  
	
    <div id="search_assessment" style="float: right;">
        <input id="search_text_assessment" class="easyui-searchbox"  
            data-options="searcher:doSearch_assessment,prompt:'请输入...',menu:'#menu_assessment'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_assessment" style="width:120px"> 
			<div data-options="name:'assessmentId'">考核编号</div> 
			<div data-options="name:'assessmentName'">培训名称</div>
			<div data-options="name:'assessmentMode'">考核方式</div>
		</div>     
    </div>  

</div>  



<div id="assessmentAddWindow" class="easyui-window" title="新建" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'assessment/add'" 
	style="width:65%;height:65%;padding:10px;">
</div>




<script>
function doSearch_assessment(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		
		$("#assessmentList").datagrid({
			title:'考核列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_assessment", url:'assessment/list', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	             	{field : 'ck', checkbox:true }, 
	             	{field : 'id', width : 150, align:'center', title : '考核编号'},
	             	{field : 'trainId', width : 150, align:'center', title : '培训编号',formatter:formatTrainId},	             	
	             	{field : 'trainName', width : 150, align : 'center', title : '培训名称',formatter:formatTrainName},
	             	{field : 'trainMode', width : 150, align : 'center', title : '培训方式',formatter:formatTrainMode},
	             	{field : 'trainTeacher', width : 150, align : 'center', title : '培训老师',formatter:formatTrainTeacher},
	             	{field : 'teacher', width : 150, align : 'center', title : '考核人'},
	             	{field : 'mode', width : 150, align : 'center', title : '考核方式'},
	             	{field : 'time', width : 130, title : '考核时间', align:'center', formatter:TAOTAO.formatDateTime},
	             	
	        ] ],

	    });
	}else{
		$("#assessmentList").datagrid({  
			 title:'培训列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
				nowrap:true, toolbar:"toolbar_assessment", url:'assessment/search_assessment_by_'+name+'?searchValue='+value,
				loadMsg:'数据加载中......', fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
	                 	{field : 'ck', checkbox:true }, 
		             	{field : 'id', width : 150, align:'center', title : '考核编号'},
		             	{field : 'trainId', width : 150, align:'center', title : '培训编号',formatter:formatTrainId},	             	
		             	{field : 'trainName', width : 150, align : 'center', title : '培训名称',formatter:formatTrainName},
		             	{field : 'trainMode', width : 150, align : 'center', title : '培训方式',formatter:formatTrainMode},
		             	{field : 'trainTeacher', width : 150, align : 'center', title : '培训老师',formatter:formatTrainTeacher},
		             	{field : 'teacher', width : 150, align : 'center', title : '考核人'},
		             	{field : 'mode', width : 150, align : 'center', title : '考核方式'},
		             	{field : 'time', width : 130, title : '考核时间', align:'center', formatter:TAOTAO.formatDateTime},
	        ] ],  
	    });
	}
} 

//格式化id信息
function  formatTrainId(value, row, index){ 
	  if (row.train){
          if(row.train.id != '')
              return row.train.id;
          else{
              return '';
          }
      } else {
          return '';
      }
 };

function  formatTrainName(value, row, index){ 
	  if (row.train){
          if(row.train.name != '')
              return row.train.name;
          else{
              return '';
          }
      } else {
          return '';
      }
 };
 function  formatTrainMode(value, row, index){ 
	  if (row.train){
         if(row.train.mode != '')
             return row.train.mode;
         else{
             return '';
         }
     } else {
         return '';
     }
};
function  formatTrainTeacher(value, row, index){ 
	  if (row.train){
        if(row.train.teacher != '')
            return row.train.teacher;
        else{
            return '';
        }
    } else {
        return '';
    }
};
	
	

	//根据index拿到该行值
	function onAssessmentClickRow(index) {
		var rows = $('#assessmentList').datagrid('getRows');
		return rows[index];
		
	}
	

	

    function getAssessmentSelectionsIds(){
    	var assessmentList = $("#assessmentList");
    	var sels = assessmentList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function assessment_add(){
    	$.get("assessment/add_judge",'',function(data){
    		console.log(data);
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			$("#assessmentAddWindow").window("open");
       		}
       	});
    }
    
    function assessment_edit(){
    	$.get("assessment/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getAssessmentSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个培训才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个培训!');
            		return ;
            	}
            	
            	$("#assessmentEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#assessmentList").datagrid("getSelections")[0];
            			$("#assessmentEditForm").form("load", data);
            			
            			TAOTAO.init({
            				"pics" : data.image,
            			});
            		}
            	}).window("open");
       		}
       	});
    }
    
    function assessment_delete(){
    	$.get("assessment/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getAssessmentSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中培训!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的培训吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("assessment/delete_batch",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除培训成功!',undefined,function(){
                					$("#assessmentList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		}
      	});
    }
    
    function assessment_reload(){
    	$("#assessmentList").datagrid("reload");
    }
</script>