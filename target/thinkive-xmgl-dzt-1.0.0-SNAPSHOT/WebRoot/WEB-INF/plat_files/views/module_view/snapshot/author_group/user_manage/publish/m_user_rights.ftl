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
<div bodyStyle="padding:0;border:0;" id="Tabs" tabAlign="fit" style="height:100%;" class="mini-tabs">
<div id="group_2bc15180" title="功能权限" style="border-width:1px;" name="funcRight" showCloseButton="false">
<div id="tree_panel_4512bf7a" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="true" idField="id" showTreeIcon="true" textField="name" class="mini-tree" ondrawnode="onDrawNode" id="catalogRightsTree" eventNo="e_catalogrights_tree" style="height:92%;width:100%;" inputs="user_id:'$user_id$'" showLoading="true" showCheckBox="true" expandOnLoad="0" parentField="pid" autoCheckParent="true"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["catalogRightsTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_4512bf7a",{"resultAsTree":"true","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","ondrawnode":"onDrawNode","id":"catalogRightsTree","eventNo":"e_catalogrights_tree","inputs":"user_id:'$user_id$'","style":"height:92%;width:100%;","showLoading":"true","showCheckBox":"true","parentField":"pid","expandOnLoad":"0","autoCheckParent":"true"});
$.tkui["catalogRightsTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_733a250d" title="数据权限" style="border-width:1px;" name="dataRight" showCloseButton="false">
<div id="tree_panel_3051f799" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_b01e1270" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_60f9b5f1" style="border-width:1px;" tagname="toolbar">
<div id="form_cf0f6d27" style="margin-top:5px">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input textField="item_name" class="mini-combobox" emptyText="请选择权限要素" id="combobox_7528e718" allowInput="true" style="width:30%;float:right;" showNullItem="false" name="right_type" valueField="item_value" value="branch_data" onvaluechanged="dataTypeChanged" required="true"/>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form_cf0f6d27"];
if(!form){
require.async("form",function(Form){
form = new Form("form_cf0f6d27",{"id":"form_cf0f6d27","style":"margin-top:5px","formitem":[{"dataType":"select","format":"data_type","tagId":"combobox_7528e718"}]});
$.tkui["form_cf0f6d27"] = form;
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
<ul resultAsTree="true" idField="id" showTreeIcon="true" textField="name" class="mini-tree" ondrawnode="onDrawNode" id="dataRightsTree" eventNo="e_dataright_tree" inputs="user_id:'$user_id$'" style="height:92%;width:100%;" showLoading="true" showCheckBox="true" paramFunc="getParam" parentField="pid" expandOnLoad="0" autoCheckParent="true"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["dataRightsTree"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_3051f799",{"resultAsTree":"true","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","ondrawnode":"onDrawNode","id":"dataRightsTree","eventNo":"e_dataright_tree","style":"height:92%;width:100%;","inputs":"user_id:'$user_id$'","showLoading":"true","paramFunc":"getParam","showCheckBox":"true","expandOnLoad":"0","parentField":"pid","autoCheckParent":"true"});
$.tkui["dataRightsTree"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var tab = $.tkui["Tabs"];
if(!tab){
require.async("tab",function(Tab){
tab = new Tab("Tabs",{"id":"Tabs","bodyStyle":"padding:0;border:0;","tabAlign":"fit","style":"height:100%;","class":"mini-tabs"});
$.tkui["Tabs"] = tab;
tab.loadViewConfig();
});
}
</div>
<script type="text/javascript">
<!--

function onDrawNode(e) {
var tree = e.sender;
var node = e.node;
var isLeaf = tree.isLeaf(node);
//所有子节点加上超链接
if (isLeaf == true) {
e.nodeHtml = '<a class="showTip" id =" '+node.title + '">' + node.name + '</a>';
}
}
var tip = new mini.ToolTip();
tip.set({
target: document,
selector: '.showTip',
placement:'',
onbeforeopen: function (e) {
e.cancel = false;
},
onopen: function (e) {
var el = e.element;
var title = el.id;
if ($.string.isNotEmpty(title) && title.indexOf("undefined")<0) {
tip.setContent('<div style="text-align:left;margin-top:2px;margin-bottom:3px;"><div align="center">权限归属</div><hr>'+title.replace(/\,/g,'')+'</div>');
}
else
tip.setContent('');
}
});
function getParam()
{
return {'data_type':mini.getbyName('right_type').value};
}
function dataTypeChanged()
{
$.tkui['dataRightsTree'].loadData();
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>