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
<div style="height:370px" nodeIndex="0">
<div id="tree_panel_4be21daf" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_e574f9fc" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_0c29d02c" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:70%;" name="key" class="mini-textbox" emptyText="请输入岗位名称"/>
<a id="button_480f3b15" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_tree_dept" style="height:80%" inputs="id:'$id$'" showLoading="true" onDrawnode="onBeforeNodeSelect" parentField="pid"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_4be21daf",{"resultAsTree":"false","toolbar":[{"inputs":"key:'$key$'","tagId":"button_480f3b15","function":"query"}],"idField":"id","showTreeIcon":"true","textField":"name","class":"mini-tree","id":"tree1","eventNo":"e_tree_dept","style":"height:80%","inputs":"id:'$id$'","showLoading":"true","onDrawnode":"onBeforeNodeSelect","parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="form2" style="width:100%;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_9934f11e" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_bc7dd196" style="border-width:1px;">
<td align="center" nodeIndex="0">
<a id="button_7384772b" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
<a id="button_3e4b28f7" style="width:60px;" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form2"];
if(!form){
require.async("form",function(Form){
form = new Form("form2",{"id":"form2","toolbar":[{"tagId":"button_7384772b","function":"add_dept"},{"tagId":"button_3e4b28f7","isClose":"true"}],"style":"width:100%;"});
$.tkui["form2"] = form;
form.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript">
<!--

mini.parse();
var tree = mini.get("tree1");
function add_dept() {
var node = tree.getCheckedNodes();
if (node) {
onOk();
}
}
function onOk()
{
var frameService = FrameService.getInstance();
frameService.closeWindow("ok");
}
function getData()
{
var node = tree.getCheckedNodes(false);
if(node)
{
return node;
}
}
function onBeforeNodeSelect(e)
{
var tree = e.sender;
var node = e.node;
if (node.type=='P') {
//e.showRadioButton='true';
e.showCheckBox='true';
e.iconCls = "icon-user";
}else{
e.iconCls = "icon-node";
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>