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
<!--Splitter-->
<div id="splitter_3c271133" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_44fceea0" showCollapseButton="true" style="border-width:1px;" size="200">
<!--Tree-->
<div id="tree_panel_751821d4" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_ce284247" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_42690c55" style="white-space:nowrap;" tagname="toolbar">
<input id="typeKey" style="width:70%;" name="typeKey" class="mini-textbox" emptyText="请输入模块类型名称"/>
<a id="button_8687dec7" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_tree_module" style="height:92%" inputs="id:'$id$'" showLoading="true" loadDataCallBackFunc="loadDataCallBackFunc" parentField="pid" expandOnLoad="true" dataField="data"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_751821d4",{"toolbar":[{"isMulSelect":"false","isSelect":"false","inputs":"typeKey:''","tagId":"button_8687dec7","function":"query"}],"resultAsTree":"false","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"tree1","eventNo":"e_tree_module","inputs":"id:'$id$'","style":"height:92%","showLoading":"true","loadDataCallBackFunc":"loadDataCallBackFunc","clicks":[{"type":"left","tagId":"tree1","function":"onNodeSelect"}],"expandOnLoad":"true","parentField":"pid","dataField":"data"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_d4ff4b7f" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_c33f4a65" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_d3e09039" style="width:100%;" tagname="toolbar">
<a id="button_7c5ff3af" class="mini-button" plain="true" iconCls="icon-add">选择模块</a>
<a id="button_182ecce9" class="mini-button" plain="true" iconCls="icon-upload">导入模块</a>
</td>
<td id="group_fadd283f" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" name="key" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_5ae414aa" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" isLoad="false" allowResize="false" onrowdblclick="onRowDblClick" pageSize="20" class="mini-datagrid" eventNo="e_query_module" allowSortColumn="true" isMulPageSelect="true" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_6206bf6a" property="columns">
<div field="field_f70586a3" id="field_f70586a3" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_1f77ba94" field="name" allowSort="true" width="110" headerAlign="center">
模块名称
</div>
<div id="field_e03ba7d5" field="module_no" allowSort="true" width="110" headerAlign="center">
模块编号
</div>
<div id="field_197e8a05" field="description" allowSort="true" width="110" headerAlign="center">
模块描述
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_c33f4a65",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"tagId":"button_7c5ff3af","function":"addModule"},{"height":"400","inputs":"","bcode":"module_import","width":"600","tagId":"button_182ecce9","url":"${ctxPath}/servlet/Import","function":"upload"},{"paramFunc":"getModuleParam","tagId":"button_5ae414aa","function":"query"}],"idField":"id","allowUnselect":"false","showPager":"true","emptyText":"暂无数据","id":"datagrid1","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowAlternating":"true","isPage":"true","isLoad":"false","fields":[{"id":"field_f70586a3","field":"field_f70586a3","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"name","id":"field_1f77ba94","allowSort":"true","headerAlign":"center","width":"110"},{"field":"module_no","id":"field_e03ba7d5","allowSort":"true","headerAlign":"center","width":"110"},{"field":"description","id":"field_197e8a05","allowSort":"true","headerAlign":"center","width":"110"}],"allowResize":"false","onrowdblclick":"onRowDblClick","pageSize":"20","class":"mini-datagrid","eventNo":"e_query_module","allowSortColumn":"true","isMulPageSelect":"true","showEmptyText":"true","showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var grid = mini.get("datagrid1");
var tree = mini.get("tree1");
//加载完树之后执行的回调方法
function loadDataCallBackFunc(e) {
var firstNode= tree.getNode(0);
tree.selectNode(firstNode);
if(firstNode){
$.tkui["datagrid1"].loadData({module_type_id:firstNode.id });
}
}
//单击栏目树出来右侧数据列表界面
function onNodeSelect()
{
var node = tree.getSelectedNode();
if(node.childrennum == 0)
{
var el=mini.get("toolbar").getEl();
if(el.style.display=="none"){
el.style.display="block";
}
grid.setVisible(true);
$("#bakImg").hide();
$.tkui["datagrid1"].loadData({module_type_id:node.id });
}else{
//mini.alert("请选择该类型下具体的模块进行操作！", "提醒");
}
}
function getModuleParam(){
var key = mini.get("key").getValue();
var node = tree.getSelectedNode();
var param = new Object();
param.key =key ;
param.module_type_id=node.id ;
return param;
}
function onRowDblClick(e) {
onOk();
}
function addModule(){
var row = grid.getSelected();
if(row)
{
onOk();
}else{
mini.alert("请选择一条记录!", "提醒");
}
}
function onOk() {
var frameService = FrameService.getInstance();
frameService.closeWindow("ok");
}
function GetData() {
var row = grid.getSelected();
var node = tree.getSelectedNode();
row.module_type_name=node.name;
return row;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>