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
<div id="tree_panel_bd069c20" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_11620645" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_61f310a7" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:70%;" name="key" class="mini-textbox" emptyText="请输入岗位名称"/>
<a id="button_191fccd7" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_tree_dept" style="height:80%" inputs="source_id:'$source_id$',id:'$dept_id$'" showLoading="true" onDrawnode="onBeforeNodeSelect" parentField="pid"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_bd069c20",{"resultAsTree":"false","toolbar":[{"inputs":"key:'$key$'","tagId":"button_191fccd7","function":"query"}],"idField":"id","showTreeIcon":"true","textField":"name","class":"mini-tree","id":"tree1","eventNo":"e_tree_dept","style":"height:80%","inputs":"source_id:'$source_id$',id:'$dept_id$'","showLoading":"true","onDrawnode":"onBeforeNodeSelect","parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="form2" style="width:100%;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_b67a9ef1" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_21f6b5d4" style="border-width:1px;">
<td align="center" nodeIndex="0">
<@permission eventNo="e_add_rights_copy"><a id="button_54c3e479" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_e7110162" style="width:60px;" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form2"];
if(!form){
require.async("form",function(Form){
form = new Form("form2",{"id":"form2","toolbar":[{"eventNo":"e_add_rights_copy","inputs":"source_id:'$source_id$'","paramFunc":"getParam","tagId":"button_54c3e479","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_e7110162","isClose":"true"}],"style":"width:100%;"});
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
function getParam() {
var node = tree.getCheckedNodes(false);
if (node.length > 0) {
var id ="";
var pid ="";
for(var i=0;i < node.length;i++){
if (node[i].type=='P') {
id += node[i].id+",";
pid += node[i].pid+",";
}
}
id = id.substring(0,id.length-1);
pid = pid.substring(0,pid.length-1);
return {"id":id,"pid":pid};
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