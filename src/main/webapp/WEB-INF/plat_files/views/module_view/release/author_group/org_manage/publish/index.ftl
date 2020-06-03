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
<div id="splitter_f802aaf9" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_566b3da1" showCollapseButton="true" style="border-width:1px;" size="220">
<!--Tree-->
<div id="tree_panel_95445de9" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_9b6149d7" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_2942bb4b" style="white-space:nowrap;" tagname="toolbar">
<a id="button_5355bb79" class="mini-button" iconCls="icon-add">添加组织机构</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<ul onnodeclick="onNodeSelect" resultAsTree="false" contextMenu="#treemenus_6336e4c5" idField="id" showTreeIcon="true" textField="name" class="mini-tree" ondrawnode="changeIcons" id="tree1" eventNo="e_query_orgtree" style="width:100%;height:90%;" inputs="id:''" showLoading="true" parentField="pid"></ul>
<ul id="treemenus_6336e4c5" onbeforeopen="onBeforeOpen" style="display:none" class="mini-contextmenu">
<li id="treemenu_9a33e9ae" name="addOrg" onclick="tree1_rightClick" iconCls="icon-add">添加组织机构</li>
<li id="treemenu_0d71e6e2" name="addPost" onclick="tree1_rightClick" iconCls="icon-add">增加岗位</li>
<li id="treemenu_c2f7d90b" name="editOrg" onclick="tree1_rightClick" iconCls="icon-edit">修改组织机构</li>
<li id="treemenu_1ab893a3" name="moveOrg" onclick="tree1_rightClick" iconCls="icon-edit">移动组织机构</li>
<li id="treemenu_dc48afab" name="deleteOrg" onclick="tree1_rightClick" iconCls="icon-remove">删除</li>
<li id="treemenu_cadd4523" onclick="tree1_rightClick" iconCls="icon-reload">刷新</li>
<li id="treemenu_d937013b" onclick="tree1_rightClick" iconCls="icon-upload">导入组织机构信息</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_95445de9",{"onnodeclick":"onNodeSelect","toolbar":[{"templateNo":"add_org","title":"添加组织机构","height":"250","refreshMode":"0","width":"400","tagId":"button_5355bb79","function":"popWindow"}],"resultAsTree":"false","contextMenu":"#treemenus_6336e4c5","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","ondrawnode":"changeIcons","id":"tree1","eventNo":"e_query_orgtree","inputs":"id:''","style":"width:100%;height:90%;","showLoading":"true","clicks":[{"templateNo":"add_org","title":"添加组织机构","height":"250","refreshMode":"1","paramFunc":"getAddOrgParam","width":"400","type":"right","tagId":"treemenu_9a33e9ae","isRefreshRoot":"true","function":"popWindow"},{"templateNo":"add_post","title":"添加岗位","height":"700","refreshMode":"1","paramFunc":"getAddPostParam","width":"800","type":"right","tagId":"treemenu_0d71e6e2","isRefreshRoot":"true","function":"popWindow"},{"templateNo":"edit_org","title":"修改组织机构","height":"280","inputs":"id:''","refreshMode":"2","width":"350","type":"right","tagId":"treemenu_c2f7d90b","isRefreshRoot":"true","function":"popWindow"},{"templateNo":"m_move_org","title":"移动组织机构","height":"500","inputs":"id:''","refreshMode":"0","width":"350","type":"right","tagId":"treemenu_1ab893a3","isRefreshRoot":"true","function":"popWindow"},{"eventNo":"e_delete_org","title":"删除","inputs":"id:'',type:'',pid:'',post_id:''","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_dc48afab","function":"delete"},{"isReLoad":"true","type":"right","tagId":"treemenu_cadd4523","function":"refresh"},{"templateNo":"m_import_org","title":"导入组织机构信息","height":"200","width":"400","tagId":"treemenu_d937013b","function":"popWindow"}],"parentField":"pid"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_b82f75fe" showCollapseButton="true" style="border:0px;">
<div id="mainTabs" style="height:100%;" activeIndex="0" class="mini-tabs" plain="false">
<div id="tabtitle" title="首页" style="border-width:1px;">
<p style="text-align:center;padding-top:80px;" nodeIndex="0">
<img src="${ctxPath}/framework/image/pic17.jpg" nodeIndex="0"></img>
</p>
</div>
</div>
<div tagName="javascript" style="display:none;">
var tab = $.tkui["mainTabs"];
if(!tab){
require.async("tab",function(Tab){
tab = new Tab("mainTabs",{"id":"mainTabs","style":"height:100%;","activeIndex":"0","class":"mini-tabs","plain":"false"});
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
var tree = mini.get("tree1");
//单击栏目树加载右侧数据列表界面
function onNodeSelect(e)
{
var node = e.node;
var param = new Object();
if(node.type=='D'){
param.post_id = "-1";
param.dept_id = "-1";
//e.isLeaf = false;
var frameService = FrameService.getInstance();
frameService.loadWindow("mainTabs", "用户列表", "user_list", param,"true","");
}else{
param.post_id = node.post_id;
param.dept_id = node.pid;
var frameService = FrameService.getInstance();
frameService.loadWindow("mainTabs", "用户列表", "user_list", param,"true","");
}
}
//添加岗位获取参数
function getAddPostParam()
{
var node = tree.getSelectedNode();
var param = new Object();
if(node.type=='P')
param.id=node.post_id;
else
param.id=node.id;
return param;
}
function getAddOrgParam(){
var node = tree.getSelectedNode();
var param = new Object();
param.dept_id = node.id;
return param;
}
function changeIcons(e){
var node = e.node;
var type = node.type;
if(type == "P"){
e.iconCls = "icon-user";
}
}
function onBeforeOpen(e){
var menu = e.sender;
var tree = mini.get("tree1");
var node = tree.getSelectedNode();
var addOrg = mini.getbyName("addOrg", menu);
var addPost = mini.getbyName("addPost", menu);
var moveOrg = mini.getbyName("moveOrg", menu);
var editOrg = mini.getbyName("editOrg", menu);
var deleteOrg = mini.getbyName("deleteOrg", menu);
addOrg.show();
addPost.show();
editOrg.show();
moveOrg.hide();
debugger;
if(node.type=='P'){
addOrg.hide();
addPost.hide();
editOrg.hide();
moveOrg.hide();
}
if(node.type=='D' && node.pidchird =='0'){
moveOrg.show();
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>