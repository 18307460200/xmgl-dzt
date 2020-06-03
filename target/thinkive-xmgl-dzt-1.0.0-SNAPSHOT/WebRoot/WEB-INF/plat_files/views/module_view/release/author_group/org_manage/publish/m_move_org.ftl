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
<div style="height:400px" nodeIndex="0">
<div id="tree_panel_54062396" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="false" idField="id" showTreeIcon="true" textField="name" class="mini-tree" showRadioButton="true" id="tree1" eventNo="e_tree_dept" multiSelect="false" style="height:95%" inputs="id:'$id$'" showLoading="true" parentField="pid"></ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_54062396",{"resultAsTree":"false","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","showRadioButton":"true","id":"tree1","eventNo":"e_tree_dept","multiSelect":"false","inputs":"id:'$id$'","style":"height:95%","showLoading":"true","parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="form2" style="width:100%;">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<table id="table_3fc84557" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_71122f46" style="border-width:1px;">
<td align="center" nodeIndex="0">
<a id="button_2fb21064" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
<a id="button_6b1291ce" style="width:60px;" class="mini-button" iconCls="icon-cancel">关闭</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form2"];
if(!form){
require.async("form",function(Form){
form = new Form("form2",{"id":"form2","toolbar":[{"tagId":"button_2fb21064","function":"add_dept"},{"tagId":"button_6b1291ce","isClose":"true"}],"style":"width:100%;"});
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
var params = mini.getParams();
var node = tree.getSelectedNode();
var param = new Object();
param.dept_id = params.id;
param.deptId_id = node.id;
FrameService.getInstance().processSubmit(callFunction, "e_edit_deptorg", param,null, null,false,null);
function callFunction(resultVo){
if (resultVo.getErrorNo() == 0) {
var frameService = FrameService.getInstance();
frameService.closeWindow("ok");
}
var errorInfo = resultVo.getErrorInfo();
if ($.string.isNotEmpty(errorInfo)) {
window.top.mini.alert(errorInfo);
}
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>