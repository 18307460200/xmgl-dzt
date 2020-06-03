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
<div id="splitter_8635d329" borderStyle="border:0;" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_11867dfe" showCollapseButton="true" style="border-width:1px;" size="220">
<div id="tree_panel_761daa9d" class="min-fit" style="width:100%;height:100%;">
<div style="width:100%;">
</div>
<ul resultAsTree="false" contextMenu="#treemenus_4f68f62f" idField="id" showTreeIcon="true" textField="name" class="mini-tree" id="tree1" eventNo="e_tree_catalog" style="height:95%" inputs="id:''" showLoading="true" parentField="pid" isOnlyLeaf="false"></ul>
<ul id="treemenus_4f68f62f" style="display:none" class="mini-contextmenu">
<li id="treemenu_9413c906" onclick="tree1_rightClick" iconCls="icon-add">添加子栏目</li>
<li id="treemenu_fa7bf897" onclick="tree1_rightClick" iconCls="icon-edit">修改本栏目</li>
<li id="treemenu_a1ef4555" onclick="tree1_rightClick" iconCls="icon-remove">删除本栏目</li>
<li id="treemenu_a04123d1" onclick="tree1_rightClick" iconCls="icon-redo">发布本栏目模板</li>
<li id="treemenu_9c2cab62" onclick="tree1_rightClick" iconCls="icon-reload">刷新</li>
</ul>
<div tagName="javascript" style="display:none;">
var tree = $.tkui["tree1"];
if(!tree){
require.async("tree",function(TreeBus){
tree = new TreeBus("tree_panel_761daa9d",{"resultAsTree":"false","contextMenu":"#treemenus_4f68f62f","showTreeIcon":"true","idField":"id","class":"mini-tree","textField":"name","id":"tree1","eventNo":"e_tree_catalog","inputs":"id:''","style":"height:95%","showLoading":"true","clicks":[{"templateNo":"update_catalog","title":"编辑栏目","inputs":"id:''","loadId":"mainTabs","type":"left","tagId":"tree1","function":"load"},{"templateNo":"add_catalog","title":"添加栏目","inputs":"id:''","loadId":"mainTabs","type":"right","tagId":"treemenu_9413c906","function":"load"},{"templateNo":"update_catalog","title":"修改$name$栏目","inputs":"id:''","loadId":"mainTabs","type":"right","tagId":"treemenu_fa7bf897","function":"load"},{"eventNo":"e_delete_catalog","title":"删除模块","inputs":"id:''","isAlert":"true","alertMsg":"是否删除？","type":"right","tagId":"treemenu_a1ef4555","function":"delete"},{"eventNo":"e_publish_catalog","inputs":"id:''","type":"right","tagId":"treemenu_a04123d1","function":"submit"},{"type":"right","tagId":"treemenu_9c2cab62","function":"refresh"}],"parentField":"pid","isOnlyLeaf":"false"});
$.tkui["tree1"] = tree;
tree.loadViewConfig();
});
}
</div>
</div>
</div>
<div id="group_ca5fe9c4" showCollapseButton="false" style="border:0px;">
<div id="mainTabs" style="height:100%;" activeIndex="0" class="mini-tabs" plain="false">
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
tab = new Tab("mainTabs",{"id":"mainTabs","style":"height:100%;","activeIndex":"0","class":"mini-tabs","plain":"false"});
$.tkui["mainTabs"] = tab;
tab.loadViewConfig();
});
}
</div>
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>