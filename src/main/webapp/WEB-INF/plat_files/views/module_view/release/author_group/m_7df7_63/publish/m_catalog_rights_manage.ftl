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
<style type="text/css" nodeIndex="0">
.mini-panel-body
{
position:relative;
text-align:left;
padding:0px;
width:auto;
overflow:auto;
clear:both;
}
</style>
<div id="splitter_e613ed7a" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_e1fd5a56" showCollapseButton="true" style="border-width:1px;" size="20%">
<div bodyStyle="padding:0;border:0;" id="leftTabs" style="width:100%;height:100%;" activeIndex="1" class="mini-tabs" onactivechanged="changeLeftTabs">
<div id="group_378e7726" title="用户" style="border-width:1px;" name="user" showCloseButton="false">
<div id="tree_panel_f524b1cc" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="userTree" eventNo="e_query_user_tree" style="width:100%;padding:5px;height:95%" inputs="id:'',nameRoute:''" showLoading="true" onDrawnode="changeIcons" parentField="pid"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["userTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_f524b1cc",{"resultAsTree":"false","idField":"id","showTreeIcon":"true","textField":"name","class":"mini-tree","id":"userTree","eventNo":"e_query_user_tree","style":"width:100%;padding:5px;height:95%","inputs":"id:'',nameRoute:''","showLoading":"true","onDrawnode":"changeIcons","clicks":[{"type":"left","tagId":"userTree","function":"userTreeLoadFunc"}],"parentField":"pid"});
$.tkui["userTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_db9eb905" title="角色" style="border-width:1px;" name="role" showCloseButton="false">
<div id="tree_panel_1aba1a3f" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="roleTree" eventNo="e_query_role_sort_tree" style="width:100%;padding:5px;height:95%" showLoading="true" onDrawnode="ondrawnode" loadDataCallBackFunc="loadDataCallBackFunc" parentField="pid" expandOnLoad="true"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["roleTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_1aba1a3f",{"resultAsTree":"false","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"roleTree","eventNo":"e_query_role_sort_tree","style":"width:100%;padding:5px;height:95%","onDrawnode":"ondrawnode","showLoading":"true","loadDataCallBackFunc":"loadDataCallBackFunc","clicks":[{"type":"left","tagId":"roleTree","function":"roleTreeLoadFunc"}],"expandOnLoad":"true","parentField":"pid"});
$.tkui["roleTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_ca20d646" title="组织" style="border-width:1px;" name="org" showCloseButton="false">
<div id="tree_panel_3d3325ac" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="false" contextMenu="#rights_copy" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="orgTree" eventNo="e_org_tree" style="width:100%;padding:5px;height:95%" inputs="id:'',nameRoute:''" showLoading="true" onDrawnode="changeIcons" parentField="pid"></ul>
<ul id="rights_copy" onbeforeopen="onBeforeOpen" style="display:none" class="mini-contextmenu">
<li id="treemenu_2d788c70" name="rightscopy" onclick="orgTree_rightClick" iconCls="icon-add">权限复制</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["orgTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_3d3325ac",{"resultAsTree":"false","contextMenu":"#rights_copy","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"orgTree","eventNo":"e_org_tree","inputs":"id:'',nameRoute:''","style":"width:100%;padding:5px;height:95%","onDrawnode":"changeIcons","showLoading":"true","clicks":[{"type":"left","tagId":"orgTree","function":"orgTreeLoadFunc"},{"templateNo":"m_rights_copy","title":"岗位权限复制","height":"450","refreshMode":"1 ","paramFunc":"rightsCopy","width":"350","type":"right","tagId":"treemenu_2d788c70","isRefreshRoot":"true","function":"popWindow"}],"parentField":"pid"});
$.tkui["orgTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var tab = $.tkui["leftTabs"];
if(!tab){
require.async("tab",function(Tab){
tab = new Tab("leftTabs",{"id":"leftTabs","bodyStyle":"padding:0;border:0;","style":"width:100%;height:100%;","activeIndex":"1","class":"mini-tabs","onactivechanged":"changeLeftTabs"});
$.tkui["leftTabs"] = tab;
tab.loadViewConfig();
});
}
</div>
</div>
<div id="group_d1547e96" showCollapseButton="true" style="border-width:1px;">
<div bodyStyle="padding:0;border:0;" id="rightsTabs" style="height:100%;" activeIndex="1" class="mini-tabs" callBackFunc="changeRightTab">
<div id="group_d38c9165" title="隶属角色" visible="false" style="border-width:1px;" name="roleRight" showCloseButton="false">
</div>
<div id="group_d20756da" title="功能权限" style="border-width:1px;" name="funcRight" showCloseButton="false">
<div class="mini-panel" id="panel2" style="height:98%;width:99.5%;margin-top:0.5%;margin-left:0.5%;" nodeIndex="0">
<div id="tree_panel_b2992c54" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_8b340ff2" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_51b88397" style="border-width:1px;" tagname="toolbar">
<@permission eventNo="e_add_catalog_rights"><a id="button_a424b364" class="mini-button" iconCls="icon-edit">更新权限</a>
</@permission>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="true" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="catalogRightsTree" eventNo="e_tree_catalog" inputs="id:''" style="height:92%;width:100%;" showLoading="true" showCheckBox="true" paramFunc="roleTreeParam" parentField="pid" expandOnLoad="0" autoCheckParent="true"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["catalogRightsTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_b2992c54",{"toolbar":[{"filterFunc":"conditionFilter","eventNo":"e_add_catalog_rights","refreshMode":"0","paramFunc":"uploadRights","isReLoad":"true","tagId":"button_a424b364","function":"submit"}],"resultAsTree":"true","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"catalogRightsTree","eventNo":"e_tree_catalog","style":"height:92%;width:100%;","inputs":"id:''","showLoading":"true","paramFunc":"roleTreeParam","showCheckBox":"true","expandOnLoad":"0","parentField":"pid","autoCheckParent":"true"});
$.tkui["catalogRightsTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<div id="group_e230dd7e" title="数据权限" style="border-width:1px;" name="dataRight" showCloseButton="false">
<div class="mini-panel" id="panel3" style="height:99%;width:99.5%;margin-top:0.5%;margin-left:0.5%;" nodeIndex="0">
<div id="tree_panel_92481a97" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_3cffdca4" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_04014daf" style="border-width:1px;" tagname="toolbar">
<@permission eventNo="e_add_data_rights"><a id="button_8f97b10c" class="mini-button" iconCls="icon-edit">更新权限</a>
</@permission>
</td>
<td id="group_61ea95ee" style="border-width:1px;" tagname="toolbar">
<div id="form_0a1fcae4" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input textField="item_name" class="mini-combobox" emptyText="请选择权限要素" id="combobox_7029b359" allowInput="true" style="width:30%;float:right;" showNullItem="false" name="right_type" valueField="item_value" value="branch_data" onvaluechanged="dataTypeChanged" required="true"/>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form_0a1fcae4"];
if(!form){
require.async("form",function(Form){
form = new Form("form_0a1fcae4",{"id":"form_0a1fcae4","style":"margin-top:5px","formitem":[{"dataType":"select","format":"data_type","tagId":"combobox_7029b359"}]});
$.tkui["form_0a1fcae4"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="true" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="dataRightsTree" eventNo="e_data_right_tree" inputs="id:''" style="height:92%;width:100%;" showLoading="true" showCheckBox="true" loadDataCallBackFunc="dataTreeCallBack" paramFunc="roleDataRightsParam" expandOnLoad="0" parentField="pid" autoCheckParent="false"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["dataRightsTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_92481a97",{"toolbar":[{"filterFunc":"conditionFilter","eventNo":"e_add_data_rights","refreshMode":"0","paramFunc":"uploadDataRights","isReLoad":"true","tagId":"button_8f97b10c","function":"submit"}],"resultAsTree":"true","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"dataRightsTree","eventNo":"e_data_right_tree","style":"height:92%;width:100%;","inputs":"id:''","showLoading":"true","paramFunc":"roleDataRightsParam","loadDataCallBackFunc":"dataTreeCallBack","showCheckBox":"true","parentField":"pid","expandOnLoad":"0","autoCheckParent":"false"});
$.tkui["dataRightsTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var tab = $.tkui["rightsTabs"];
if(!tab){
require.async("tab",function(Tab){
tab = new Tab("rightsTabs",{"id":"rightsTabs","bodyStyle":"padding:0;border:0;","style":"height:100%;","activeIndex":"1","class":"mini-tabs","callBackFunc":"changeRightTab"});
$.tkui["rightsTabs"] = tab;
tab.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript">
<!--
var sourceType=0,sourceId;
var flag=false;
var rightIndex=1;//右侧tab页标
var title='按角色：';
//左侧tab切换事件
function changeLeftTabs()
{
var tab = mini.get("leftTabs").getActiveTab();
if(tab.name=='user')
{
sourceType=2;
}
else if(tab.name=='role')
{
sourceType=0;
}
else
{
sourceType=1;
}
title="按"+tab.title+":";
}
function onBeforeOpen(e){
var menu = e.sender;
var tree = mini.get("orgTree");
var node = tree.getSelectedNode();
var rightscopy = mini.getbyName("rightscopy", menu);
if(node.type=='D'){
rightscopy.hide();
document.getElementById('rights_copy').style.display ="none";
//$("#rights_copy").style.display = "none";
$("#rights_copy").hide();
}else if(node.type=='P'){
rightscopy.show();
}
mini.parse();
}
//右侧tab切换事件
function changeRightTab()
{
var tab = mini.get("rightsTabs").getActiveTab();
if(tab.name=='roleRight')
{
rightIndex=0;
}
else if(tab.name=='funcRight')
{
rightIndex=1;
//$.tkui['catalogRightsTree'].loadData();
}
else
{
rightIndex=2;
//$.tkui['dataRightsTree'].loadData();
}
if(sourceType == "2")
{
userTreeLoadFunc();
}
else if(sourceType == "0")
{
roleTreeLoadFunc();
}
else if(sourceType == "1")
{
orgTreeLoadFunc();
}
}
//左侧树加载后回调函数
function loadDataCallBackFunc()
{
var tree = mini.get("roleTree");//默认是角色树
if(sourceType==1)
{//机构
tree = mini.get("orgTree");
}
else if(sourceType==2)
{//用户
tree = mini.get("userTree");
}
}
//权限复制获取参数
function rightsCopy(){
var tree = mini.get("orgTree");
var node = tree.getSelectedNode();
var source_id = node.id;
return {'source_id':source_id,'id':''};
}
//栏目权限提交获取的参数
function uploadRights()
{
var tree = mini.get("catalogRightsTree");
var rightsData = tree.getValue(true);
return {"rightsData":rightsData,'source_id':sourceId,'source_type':sourceType};
}
//数据权限查询获取的参数
function roleDataRightsParam(){
var dataType = mini.getbyName("right_type").getValue();
return {'source_id':sourceId,'source_type':sourceType,'data_type':dataType};
}
//数据权限提交获取的参数
function uploadDataRights()
{
var tree = mini.get("dataRightsTree");
var rightsData = tree.getValue(false);
var dataType = mini.getbyName("right_type").getValue();
return {"rightsData":rightsData,'source_id':sourceId,'source_type':sourceType,'data_type':dataType};
}
//角色--功能权限入参
function roleTreeParam()
{
return {'source_id':sourceId,'source_type':sourceType};
}
//角色权限树左键点击事件
function roleTreeLoadFunc()
{
var node = mini.get("roleTree").getSelectedNode();
if(node){
sourceId = node.id;
flag=(node.type=='P')?true:false;
if(flag)
{
if(rightIndex==1)
{
mini.get("panel2").setTitle(title+node.name);
$.tkui['catalogRightsTree'].loadData();
}
else if(rightIndex==2)
{
mini.get("panel3").setTitle(title+node.name);
$.tkui['dataRightsTree'].loadData();
}
}
}
}
//用户权限树左键点击事件
function userTreeLoadFunc()
{
var node = mini.get("userTree").getSelectedNode();
if(node){
sourceId = node.id;
flag=(node.type=='P')?true:false;
if(flag)
{
if(rightIndex==1)
{
mini.get("panel2").setTitle(title+node.nameRoute);
$.tkui['catalogRightsTree'].loadData();
}
else if(rightIndex==2)
{
mini.get("panel3").setTitle(title+node.nameRoute);
$.tkui['dataRightsTree'].loadData();
}
}
}
}
//组织权限树左键点击事件
function orgTreeLoadFunc()
{
var node = mini.get("orgTree").getSelectedNode();
if(node){
sourceId = node.id;
flag=(node.type=='P')?true:false;
if(flag)
{
if(rightIndex==1)
{
mini.get("panel2").setTitle(title+node.nameRoute);
$.tkui['catalogRightsTree'].loadData();
}
else if(rightIndex==2)
{
mini.get("panel3").setTitle(title+node.nameRoute);
$.tkui['dataRightsTree'].loadData();
}
}
}
}
function dataTreeCallBack()
{
var dataTree = mini.get('dataRightsTree');
var firstNode = dataTree.getNode(0);
if(firstNode)
dataTree.expandNode(firstNode);
}
//权限要素更改
function dataTypeChanged(e)
{
$.tkui['dataRightsTree'].loadData();
}
function conditionFilter()
{
var tree = mini.get("roleTree");//默认是角色树
var mesg='请选择角色!';
if(sourceType==1)
{//机构
tree = mini.get("orgTree");
mesg='请选择岗位!';
}
else if(sourceType==2)
{//用户
tree = mini.get("userTree");
mesg='请选择用户!';
}
var node = tree.getSelectedNode();
if($.string.isEmpty(node) || node.type=='D')
{
mini.alert(mesg,"温馨提示");
return false;
}
else
return true;
}
//绘制图标
function changeIcons(e){
var node = e.node;
var type = node.type;
if(type == "D"){
e.iconCls = "icon-node";
}else if(type == "P"){
e.iconCls = "icon-user";
}else{
e.iconCls = "icon-folder";
}
}
//绘制图标
function ondrawnode(e){
var node = e.node;
var type = node.type;
if(type == "P"){
e.iconCls = "icon-find";
}
}
-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>