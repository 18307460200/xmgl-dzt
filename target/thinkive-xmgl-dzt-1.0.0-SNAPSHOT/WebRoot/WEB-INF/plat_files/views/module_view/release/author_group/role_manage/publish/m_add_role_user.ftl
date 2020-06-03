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
<div id="splitter_c15366f3" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_18b49c1e" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_798faef2" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_ea21dcda" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbutton" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_3a27eb8b" style="width:100%;" tagname="toolbar">
<@permission eventNo="e_add_role_user"><a id="button_0a414ad1" class="mini-button" plain="true" iconCls="icon-add">增加用户</a>
</@permission>
</td>
<td id="group_cd54e59e" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_e30f5d27" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_roleuser_list" frozenStartColumn="-1" multiSelect="true" inputs="role_id:'$role_id$'" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_8a475a6a" property="columns">
<div field="field_5160e035" id="field_5160e035" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_222a970f" field="login_id" allowSort="true" width="80" headerAlign="center">
登录账号
</div>
<div id="field_eb484e1e" field="name" allowSort="true" width="80" headerAlign="center">
名称
</div>
<div field="state" id="state" dataType="select" allowSort="true" width="60" headerAlign="center" format="state">
是否有效
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_ea21dcda",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"eventNo":"e_add_role_user","isMulSelect":"true","inputs":"user_id:'$user_id$',role_id:'$role_id$'","isAlert":"true","alertMsg":"是否确认添加?","tagId":"button_0a414ad1","isClose":"true","function":"submit"},{"paramFunc":"getSearchParam","tagId":"button_e30f5d27","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_roleuser_list","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","inputs":"role_id:'$role_id$'","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_5160e035","field":"field_5160e035","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"login_id","id":"field_222a970f","allowSort":"true","headerAlign":"center","width":"80"},{"field":"name","id":"field_eb484e1e","allowSort":"true","headerAlign":"center","width":"80"},{"id":"state","field":"state","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"state"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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

function getSearchParam(){
var param = new Object();
var key = mini.get("key").getValue();
param.key=key;
return param;
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>