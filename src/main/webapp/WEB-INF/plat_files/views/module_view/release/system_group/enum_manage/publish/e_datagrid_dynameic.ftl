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
<div id="splitter_3ee86611" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_d56e12f0" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_d50d7531" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_5c2944c7" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbutton" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="false" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="false" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_enumdynameic" allowSortColumn="true" isMulPageSelect="true" inputs="dictId:'$dictId$'" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_45a01ae1" property="columns">
<div field="field_9699d0ec" id="field_9699d0ec" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_551c8791" field="item_name" allowSort="false" width="110" headerAlign="center">
名称
</div>
<div id="field_47e11d33" field="item_value" allowSort="false" width="110" headerAlign="center">
枚举值
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_5c2944c7",{"showSortIcon":"false","borderStyle":"border:0","allowResize":"false","allowUnselect":"false","idField":"id","pageSize":"20","showPager":"false","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_enumdynameic","frozenStartColumn":"-1","multiSelect":"true","inputs":"dictId:'$dictId$'","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"false","fields":[{"id":"field_9699d0ec","field":"field_9699d0ec","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"item_name","id":"field_551c8791","allowSort":"false","headerAlign":"center","width":"110"},{"field":"item_value","id":"field_47e11d33","allowSort":"false","headerAlign":"center","width":"110"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
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