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
<div id="splitter_82ad9c2a" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_c8b88abc" showCollapseButton="true" style="border-width:1px;" size="180">
<div id="tree_panel_bb48d380" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_16dc713a" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_8dddf042" style="white-space:nowrap;" tagname="toolbar">
<a id="button_25212d2d" class="mini-button" iconCls="icon-add">新增角色分类</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul resultAsTree="false" contextMenu="#treemenus_d8b0d05f" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_query_sorttree" style="width:100%;height:95%;" inputs="id:''" showLoading="true" loadDataCallBackFunc="loadDataCallBackFunc" parentField="pid"></ul>
<ul id="treemenus_d8b0d05f" style="display:none" class="mini-contextmenu">
<li id="treemenu_544b58ee" name="edit" onclick="tree1_rightClick" iconCls="icon-edit">修改角色分类</li>
<li id="treemenu_9483b181" name="delete" onclick="tree1_rightClick" iconCls="icon-remove">删除角色分类</li>
<li id="treemenu_6476fc70" name="addPost" onclick="tree1_rightClick" iconCls="icon-add">刷新节点</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_bb48d380",{"toolbar":[{"templateNo":"m_add_role_sort","title":"新增角色分类","height":"200","inputs":"","refreshMode":"0","width":"300","tagId":"button_25212d2d","function":"popWindow"}],"resultAsTree":"false","contextMenu":"#treemenus_d8b0d05f","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"tree1","eventNo":"e_query_sorttree","inputs":"id:''","style":"width:100%;height:95%;","showLoading":"true","loadDataCallBackFunc":"loadDataCallBackFunc","clicks":[{"type":"left","tagId":"tree1","function":"onLoad"},{"templateNo":"m_edit_role_sort","title":"修改角色分类","height":"200","inputs":"sort_id:'$id$'","refreshMode":"0","width":"300","type":"right","tagId":"treemenu_544b58ee","function":"popWindow"},{"eventNo":"e_delete_role_sort","title":"删除角色分类","inputs":"sort_id:'$id$'","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_9483b181","function":"delete"},{"type":"right","tagId":"treemenu_6476fc70","function":"refresh"}],"parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_051614f9" showCollapseButton="true" style="border:0;">
<div id="datarid_panel_e177b0e6" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbutton" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_043f466b" style="width:100%;" tagname="toolbar">
<a id="button_a5fbfa4e" class="mini-button" plain="true" iconCls="icon-add">增加</a>
<a id="button_12f3be81" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_role"><a id="button_6cd5c950" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
</td>
<td id="group_21104efd" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_fc78a9f6" style="width:150px;" name="key" class="mini-textbox" emptyText="请输入角色名称"/>
<a id="button_ce94ecb2" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_rolelist" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" isLoad="false" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_25962298" property="columns">
<div field="field_b7351577" id="field_b7351577" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_750665fc" field="name" allowSort="true" width="110" headerAlign="center">
角色名称
</div>
<div id="field_4f6664f7" field="role_no" allowSort="true" width="110" headerAlign="center">
角色英文名
</div>
<div id="field_1f0f307b" field="is_system" dataType="select" allowSort="true" width="110" headerAlign="center" format="is_system">
系统角色标志
</div>
<div field="is_temp" id="is_temp" dataType="select" allowSort="true" width="60" headerAlign="center" format="is_temp">
是否角色用户
</div>
<div id="field_3a56e16a" field="create_date" allowSort="true" width="110" headerAlign="center">
创建时间
</div>
<div field="field_85b32f4c" id="pop_window" dataType="javascript" allowSort="false" width="110" align="center" headerAlign="center">
用户管理
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_e177b0e6",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"tagId":"button_a5fbfa4e","function":"add"},{"templateNo":"m_edit_role","title":"修改角色信息","isSelect":"true","height":"500","inputs":"role_id:'$role_id$'","width":"400","tagId":"button_12f3be81","function":"popWindow"},{"eventNo":"e_delete_role","isMulSelect":"true","inputs":"role_id:'$role_id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_6cd5c950","function":"submit"},{"isMulSelect":"false","isSelect":"false","inputs":"","paramFunc":"getSearchParam","tagId":"button_ce94ecb2","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_rolelist","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","isPage":"true","isLoad":"false","fields":[{"id":"field_b7351577","field":"field_b7351577","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"name","id":"field_750665fc","allowSort":"true","headerAlign":"center","width":"110"},{"field":"role_no","id":"field_4f6664f7","allowSort":"true","headerAlign":"center","width":"110"},{"field":"is_system","id":"field_1f0f307b","dataType":"select","allowSort":"true","headerAlign":"center","width":"110","format":"is_system"},{"id":"is_temp","field":"is_temp","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"is_temp"},{"field":"create_date","id":"field_3a56e16a","allowSort":"true","headerAlign":"center","width":"110"},{"id":"pop_window","field":"field_85b32f4c","dataType":"javascript","items":[{"templateNo":"m_query_user_role","title":"用户管理","height":"500","inputs":"role_id:'$role_id$'","width":"900","displayName":"用户管理","tagId":"pop_window","function":"popWindow"}],"allowSort":"false","headerAlign":"center","align":"center","width":"110"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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
var tree = mini.get("tree1");
function getSearchParam() {
var node = tree.getSelectedNode();
if (node) {
var param = new Object();
param.sort_id = node.id;
return param;
} else {
mini.alert("请选择角色分类");
}
}
function onLoad() {
var node = tree.getSelectedNode();
$.tkui["datagrid1"].loadData({sort_id: node.id});
}
function add() {
var node = tree.getSelectedNode();
if (node) {
var param = new Object();
param.sort_id = node.id;
var frameService = FrameService.getInstance();
frameService.popWindow("添加角色信息", "m_add_role", param, 400, 500, null, function () {
}, function (action) {
$.tkui["datagrid1"].loadData({sort_id: node.id});
});
} else {
mini.alert("请选择角色分类");
}
}
function loadDataCallBackFunc() {
var firstNode = tree.getNode(0);
if (firstNode) {
tree.selectNode(firstNode);
$.tkui["datagrid1"].loadData({sort_id: firstNode.id});
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>