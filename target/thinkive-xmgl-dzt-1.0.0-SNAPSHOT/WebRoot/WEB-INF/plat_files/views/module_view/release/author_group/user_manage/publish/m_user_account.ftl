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
<div id="splitter_b8e5a9df" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_b5d3053f" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_7ce15f51" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_e7d2d6b9" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_5dd07e3c" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_dc2ae5bd" style="width:100%;" tagname="toolbar">
<a id="button_64fadf1d" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
<td id="group_43971e07" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_d3417fd2" style="width:200px;" name="account" class="mini-textbox" emptyText="登录账号："/>
<a id="button_11c1318b" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_account" allowSortColumn="true" isMulPageSelect="true" inputs="user_id:'$user_id$'" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_ae146708" property="columns">
<div field="field_eed4605c" id="field_eed4605c" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_5708d725" field="type" allowSort="true" width="120" headerAlign="center">
类型
</div>
<div id="field_f7180507" field="account" allowSort="true" width="120" headerAlign="center">
账号
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_e7d2d6b9",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"tagId":"button_64fadf1d","function":"refresh"},{"isMulSelect":"false","isSelect":"false","inputs":"","tagId":"button_11c1318b","function":"query"}],"allowResize":"false","allowUnselect":"false","idField":"id","pageSize":"20","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_account","frozenStartColumn":"-1","multiSelect":"true","inputs":"user_id:'$user_id$'","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"true","fields":[{"id":"field_eed4605c","field":"field_eed4605c","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"type","id":"field_5708d725","allowSort":"true","headerAlign":"center","width":"120"},{"field":"account","id":"field_f7180507","allowSort":"true","headerAlign":"center","width":"120"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>