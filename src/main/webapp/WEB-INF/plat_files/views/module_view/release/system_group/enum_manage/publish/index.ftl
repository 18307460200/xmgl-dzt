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
<div id="splitter_55337503" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_e66091ee" showCollapseButton="true" style="border-width:1px;" size="240">
<!--Tree-->
<div id="tree_panel_9965d8d7" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_7b064346" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_ecafec08" style="white-space:nowrap;" tagname="toolbar">
<input id="typeKey" style="width:70%;" name="typeKey" class="mini-textbox" emptyText="请输入类型或名称"/>
<a id="button_e5c053d0" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul onnodeclick="onNodeSelect" resultAsTree="false" contextMenu="#treemenus_14179851" idField="id" showTreeIcon="true" textField="name" class="mini-tree" ondrawnode="changeIcons" id="tree1" eventNo="e_query_enumtree" inputs="id:''" style="width:100%;height:95%;" showLoading="true" parentField="pid"></ul>
<ul id="treemenus_14179851" onbeforeopen="onBeforeOpen" style="display:none" class="mini-contextmenu">
<li id="treemenu_e9ab9605" name="addSort" onclick="tree1_rightClick" iconCls="icon-add">添加字典类型</li>
<li id="treemenu_ca813ab7" name="addType" onclick="tree1_rightClick" iconCls="icon-add">增加数据字典</li>
<li id="treemenu_e14d6142" name="editType" onclick="tree1_rightClick" iconCls="icon-edit">修改数据字典</li>
<li id="treemenu_470bf0d3" name="deleteSort" onclick="tree1_rightClick" iconCls="icon-remove">删除字典分类</li>
<li id="treemenu_cf296d20" name="deletetype" onclick="tree1_rightClick" iconCls="icon-remove">删除数据字典类型</li>
<li id="treemenu_883ea616" name="exportDictType" onclick="tree1_rightClick" iconCls="icon-save">导出当前数据字典分类</li>
<li id="treemenu_d5e40a6f" name="exportDict" onclick="tree1_rightClick" iconCls="icon-save">导出当前数据字典</li>
<li id="treemenu_be792bd8" name="backupDict" onclick="tree1_rightClick" iconCls="icon-downgrade">备份所有数据字典</li>
<li id="treemenu_2dd4dcbe" name="importDict" onclick="tree1_rightClick" plain="true" iconCls="icon-upload">导入字典</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_9965d8d7",{"onnodeclick":"onNodeSelect","toolbar":[{"isMulSelect":"false","isSelect":"false","inputs":"typeKey:''","tagId":"button_e5c053d0","function":"query"}],"resultAsTree":"false","contextMenu":"#treemenus_14179851","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","ondrawnode":"changeIcons","id":"tree1","eventNo":"e_query_enumtree","style":"width:100%;height:95%;","inputs":"id:''","showLoading":"true","clicks":[{"templateNo":"add_sort","title":"添加数据字典分类","height":"250","refreshMode":"0","width":"350","type":"right","tagId":"treemenu_e9ab9605","isRefreshRoot":"true","function":"popWindow"},{"templateNo":"add_type","title":"添加数据字典类型","height":"400","inputs":"id:'$id$'","refreshMode":"1","paramFunc":"getAddTypeParam","width":"500","type":"right","tagId":"treemenu_ca813ab7","isRefreshRoot":"true","function":"popWindow"},{"templateNo":"edit_type","title":"修改数据字典类型","height":"400","inputs":"id:'$id$'","refreshMode":"2","width":"500","type":"right","tagId":"treemenu_e14d6142","isRefreshRoot":"true","function":"popWindow"},{"eventNo":"e_delete_enumsort","title":"删除字典分类","inputs":"id:''","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_470bf0d3","function":"delete"},{"eventNo":"e_delete_enumtype","title":"删除数据字典类型","inputs":"id:''","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_cf296d20","function":"delete"},{"eventNo":"e_export_dict","isSign":"true","inputs":"sort_id:'$id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认导出?","tagId":"treemenu_883ea616","url":"${ctxPath}/servlet/ModuleEvent","function":"link"},{"eventNo":"e_export_dict","isSign":"true","inputs":"id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认导出?","tagId":"treemenu_d5e40a6f","url":"${ctxPath}/servlet/ModuleEvent","function":"link"},{"eventNo":"e_backup_dict","isSign":"true","inputs":"id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认备份?","tagId":"treemenu_be792bd8","url":"${ctxPath}/servlet/ModuleEvent","function":"link"},{"templateNo":"m_import_dict","title":"导入数据字典","height":"400","inputs":"id:'$id$',type:'$type$'","refreshMode":"2","width":"500","type":"right","tagId":"treemenu_2dd4dcbe","isRefreshRoot":"true","function":"popWindow"}],"parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_95669a4c" showCollapseButton="true" style="border:0;">
<div id="mainTabs" style="width: 100%; height: 100%;" activeIndex="0" class="mini-tabs" plain="false">
<div id="tabtitle" title="欢迎" style="border-width:1px;">
<p style="text-align:center; padding-top:80px;" nodeIndex="0">
<img src="${ctxPath}/framework/image/pic17.jpg" nodeIndex="0"></img>
</p>
</div>
</div>
<div tagName="javascript" style="display:none;">
var tab = $.tkui["mainTabs"];
if(!tab){
require.async("tab",function(Tab){
tab = new Tab("mainTabs",{"id":"mainTabs","style":"width: 100%; height: 100%;","activeIndex":"0","class":"mini-tabs","plain":"false"});
$.tkui["mainTabs"] = tab;
tab.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var sort_no;
var grid = mini.get("datagrid1");
var tree = mini.get("tree1");
function getParam()
{
var node = tree.getSelectedNode();
var paraMap = {};
if(typeof(node)!='undefined'){
paraMap["id"] = node.id;
}
return paraMap;
}
//单击栏目树出来右侧数据列表界面
function onNodeSelect(e)
{
var node = e.node;
var param = new Object();
param.sort_no = node.sort_no;
if(node.type=='T'){
if(node.is_dynamic =="1"){
param.dictId = node.id;
var frameService = FrameService.getInstance();
frameService.loadWindow("mainTabs", "动态数据字典列表", "e_datagrid_dynameic", param,"true","");
}else{
param.id = node.id;
var frameService = FrameService.getInstance();
frameService.loadWindow("mainTabs", "静态数据字典列表", "e_datagrid_list", param,"true","");
}
}
}
//添加数据字典类型
function getAddTypeParam()
{
var node = tree.getSelectedNode();
var param = new Object();
param.id=node.id;
return param;
}
//模糊查询
function getSearchParam() {
var param = new Object();
param.sort_no=sort_no;
return param;
}
function changeIcons(e){
var node = e.node;
var type = node.is_dynamic;
if(type == "0"){
e.iconCls = "icon-user";
}else if(type == "1"){
e.iconCls = "icon-goto";
}else{
e.iconCls = "icon-find";
}
}
function onBeforeOpen(e){
var menu = e.sender;
var tree = mini.get("tree1");
var node = tree.getSelectedNode();
var addSort = mini.getbyName("addSort", menu);
var addType = mini.getbyName("addType", menu);
var editType = mini.getbyName("editType", menu);
var deleteSort = mini.getbyName("deleteSort", menu);
var deletetype = mini.getbyName("deletetype", menu);
var exportDictType = mini.getbyName("exportDictType",menu);
var exportDict = mini.getbyName("exportDict",menu);
var backupDict = mini.getbyName("backupDict",menu);
var importDict = mini.getbyName("importDict",menu);
if(node.type=='S'){
addType.show();
editType.hide();
exportDict.hide();
exportDictType.show();
backupDict.show();
deletetype.hide();
addSort.show();
deleteSort.show();
importDict.show();
}else{
addSort.hide();
deleteSort.hide();
addType.hide();
editType.show();
exportDict.show();
exportDictType.hide();
backupDict.show();
deletetype.show();
importDict.show();
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>