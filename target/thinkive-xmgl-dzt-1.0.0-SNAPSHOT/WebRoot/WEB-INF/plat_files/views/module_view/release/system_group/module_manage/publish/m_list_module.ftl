<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit">
<title></title>
<script src="${ctxPath}/plugins/miniui/jquery.min.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/scripts/miniui/miniui.js" type="text/javascript"></script>
<script src="${ctxPath}/plugins/miniui/template/index/navtree.js" type="text/javascript"></script>
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/scripts/miniui/themes/thinkive/skin.css" rel="stylesheet" type="text/css" />
<link href="${ctxPath}/plugins/miniui/template/core.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body{
margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
</head>
<body id="bodyContent">
<div id="layout1" class="mini-layout" style="width:100%;height:100%;" nodeIndex="0">
<div title="center" region="center" bodyStyle="overflow:hidden;" style="border:0;" nodeIndex="0">
<!--Splitter-->
<div class="mini-splitter" style="width:100%;height:100%;" nodeIndex="0">
<div size="240" showCollapseButton="true" nodeIndex="0">
<div class="mini-fit" nodeIndex="0">
<div id="tree_panel_c5e535a9" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_ff795f84" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_07d72f6c" style="white-space:nowrap;" tagname="toolbar">
<a id="button_bb1d2f9b" class="mini-button" iconCls="icon-add">添加模块类型</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="false" contextMenu="#treemenus_b7eb300a" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_query_moudletypetree" style="width:100%;height:90%;" inputs="id:'$id$'" showLoading="true" loadDataCallBackFunc="loadDataCallBackFunc" parentField="pid"></ul>
<ul id="treemenus_b7eb300a" style="display:none" class="mini-contextmenu">
<li id="treemenu_c9add3aa" name="addOrg" onclick="tree1_rightClick" iconCls="icon-add">添加模块类型</li>
<li id="treemenu_6486dd03" name="addPost" onclick="tree1_rightClick" iconCls="icon-edit">修改模块类型</li>
<li id="treemenu_383b9daa" name="edit" onclick="tree1_rightClick" iconCls="icon-remove">删除模块</li>
<li id="treemenu_ad3a39c5" name="edit" onclick="tree1_rightClick" iconCls="icon-save">备份模板下所有模块</li>
<li id="treemenu_98d76783" name="edit" onclick="tree1_rightClick" iconCls="icon-save">备份所有模块</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_c5e535a9",{"toolbar":[{"templateNo":"m_add_module_type","title":"添加模块类型","height":"150","refreshMode":"0","width":"400","tagId":"button_bb1d2f9b","function":"popWindow"}],"resultAsTree":"false","contextMenu":"#treemenus_b7eb300a","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"tree1","eventNo":"e_query_moudletypetree","inputs":"id:'$id$'","style":"width:100%;height:90%;","showLoading":"true","loadDataCallBackFunc":"loadDataCallBackFunc","clicks":[{"input":"id:'$id$'","type":"left","tagId":"tree1","function":"loadFunc"},{"templateNo":"m_add_module_type","title":"添加模块类型","height":"150","inputs":"parent_id:'$id$',id:'$id$'","refreshMode":"1","width":"400","type":"right","tagId":"treemenu_c9add3aa","function":"popWindow"},{"templateNo":"m_edite_module_type","title":"修改模块类型","height":"200","inputs":"module_type_id:'$id$',id:'$id$'","refreshMode":"2","width":"400","type":"right","tagId":"treemenu_6486dd03","function":"popWindow"},{"eventNo":"e_delete_moudletype","title":"删除模块","inputs":"module_type_id:'$id$',id:'$id$'","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_383b9daa","function":"delete"},{"eventNo":"e_back_moduletype","title":"备份模板下所有模块","inputs":"id:'$id$'","isAlert":"true","alertMsg":"是否备份？","callbackFunc":"backFunc","type":"right","tagId":"treemenu_ad3a39c5","isAlertResultInfo":"false","function":"submit"},{"eventNo":"e_backup_module","title":"备份所有模块","isAlert":"true","alertMsg":"是否备份？","callbackFunc":"backFunc","type":"right","tagId":"treemenu_98d76783","isAlertResultInfo":"false","function":"submit"}],"parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<div showCollapseButton="true" nodeIndex="1">
<div id="datarid_panel_a7164932" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_984ece32" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_17e9eec5" style="width:100%;" tagname="toolbar">
<input id="hidden_c0704067" name="module_type_id" class="mini-hidden"/>
<a id="button_015a8c7b" class="mini-button" plain="true" iconCls="icon-add">新增</a>
<a id="button_33fe7ecf" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_moudletypeinfo"><a id="button_09014844" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
<a id="button_4235158d" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
<@permission eventNo="e_exp_moudule"><a id="button_c83e0632" class="mini-button" plain="true" iconCls="icon-save">导出模块</a>
</@permission>
<@permission eventNo="e_exp_module_dicts"><a id="button_9fb5b811" class="mini-button" plain="true" iconCls="icon-save">导出字典</a>
</@permission>
<@permission eventNo="e_imp_moudule"><a id="button_cf482937" class="mini-button" plain="true" iconCls="icon-upload">导入模块</a>
</@permission>
<a id="button_0924d837" class="mini-button" plain="true" iconCls="icon-edit">发布版本</a>
</td>
<td id="group_39407902" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_655856e9" style="width:120px;" name="name" class="mini-textbox" emptyText="模块名称："/>
<a id="button_3b63ba47" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" isLoad="false" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_moudletypeinfo" allowSortColumn="true" isMulPageSelect="true" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_344ea8da" property="columns">
<div field="field_26925532" id="field_26925532" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_12f30ba5" field="name" allowSort="true" width="120" headerAlign="center">
模块名称
</div>
<div id="field_0151f6ff" field="version" allowSort="true" width="120" headerAlign="center">
模块版本
</div>
<div id="field_84e2c78b" field="catalog_name" allowSort="true" width="120" headerAlign="center">
关联栏目名称
</div>
<div id="field_d25f1f34" field="create_date" allowSort="true" width="120" headerAlign="center">
创建时间
</div>
<div id="field_e3bb60de" field="modified_date" allowSort="true" width="120" headerAlign="center">
最后修改时间
</div>
<div field="field_a2970593" id="field_a2970593" dataType="javascript" allowSort="false" headerAlign="center">
操作
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_a7164932",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"height":"180","width":"600","isReLoad":"true","tagId":"button_015a8c7b","function":"add_module"},{"templateNo":"m_edit_module","title":"修改模块","isSelect":"true","height":"180","inputs":"module_type_id:'',module_id:''","width":"600","tagId":"button_33fe7ecf","function":"popWindow"},{"eventNo":"e_delete_moudletypeinfo","isMulSelect":"true","inputs":"module_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_09014844","function":"submit"},{"tagId":"button_4235158d","function":"refresh"},{"eventNo":"e_exp_moudule","isMulSelect":"true","isSign":"true","inputs":"module_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认导出?","isEncodeURI":"false","tagId":"button_c83e0632","url":"${ctxPath}/servlet/ModuleEvent","function":"link"},{"eventNo":"e_exp_module_dicts","isMulSelect":"true","isSign":"true","inputs":"module_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认导出?","isEncodeURI":"false","tagId":"button_9fb5b811","url":"${ctxPath}/servlet/ModuleEvent","function":"link"},{"eventNo":"e_imp_moudule","height":"400","inputs":"","bcode":"module_import","width":"600","tagId":"button_cf482937","function":"upload"},{"isMulSelect":"true","templateNo":"m_publish_module","title":"发布模块","height":"250","inputs":"module_id:''","isAlert":"true","width":"600","alertMsg":"确定发布选中模块？","tagId":"button_0924d837","function":"popWindow"},{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_3b63ba47","function":"query"}],"allowResize":"false","allowUnselect":"false","idField":"id","pageSize":"20","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_moudletypeinfo","frozenStartColumn":"-1","multiSelect":"true","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"true","isLoad":"false","fields":[{"id":"field_26925532","field":"field_26925532","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"name","id":"field_12f30ba5","allowSort":"true","headerAlign":"center","width":"120"},{"field":"version","id":"field_0151f6ff","allowSort":"true","headerAlign":"center","width":"120"},{"field":"catalog_name","id":"field_84e2c78b","allowSort":"true","headerAlign":"center","width":"120"},{"field":"create_date","id":"field_d25f1f34","allowSort":"true","headerAlign":"center","width":"120"},{"field":"modified_date","id":"field_e3bb60de","allowSort":"true","headerAlign":"center","width":"120"},{"id":"field_a2970593","field":"field_a2970593","dataType":"javascript","items":[{"isMax":"false","templateNo":"m_list_template","title":"查看模板","height":"600","inputs":"module_id:'',module_no:'',_catalog_id:'$catalog_id$'","width":"1000","displayName":"查看模板","tagId":"field_a2970593","function":"popWindow"},{"inputs":"_module_id:'$module_id$',_catalog_id:'$catalog_id$',_version_type:'0'","displayName":"预览","tagId":"field_a2970593","url":"${ctxPath}/servlet/ModuleView","function":"link"}],"allowSort":"false","headerAlign":"center"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
<!--

function loadDataCallBackFunc(e) {
var tree = mini.get("tree1");
var firstNode= tree.getNode(0);
tree.selectNode(firstNode);
if(firstNode){
var grid = mini.get("datagrid1");
grid.load({module_type_id:firstNode.id});
var moduleObj = mini.getbyName("module_type_id");
moduleObj.setValue(firstNode.id);
}
}
function loadFunc(){
var node = mini.get("tree1").getSelectedNode();
if(node){
var grid = mini.get("datagrid1");
grid.load({module_type_id:node.id});
var moduleObj = mini.getbyName("module_type_id");
moduleObj.setValue(node.id);
}
}
function add_module(){
var node = mini.get("tree1").getSelectedNode();
var param = new Object();
if(node.childrennum > 0){
mini.alert("请选择子节点添加模块！");
}else{
param.module_type_id = node.id;
var frameService = FrameService.getInstance();
frameService.popWindow("添加模块","m_add_module", param,"600","180",null,"",function onloadCallBack(){
var grid = mini.get("datagrid1");
param.module_type_id = node.id;
grid.load({module_type_id:node.id});
});
}
}
function backFunc(e){
var messageid = mini.alert(e.error_info,"提醒");
setTimeout(function(){
mini.hideMessageBox(messageid);
}, 2000);
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>