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
<div id="splitter_421eb720" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_329c5eb6" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_f4fb3b18" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_831f5a3c" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbutton" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_b2b3657a" style="width:100%;" tagname="toolbar">
<a id="button_9ab0c14e" class="mini-button" plain="true" iconCls="icon-add">增加</a>
<a id="button_903f1af0" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_enumvalue"><a id="button_e12666f9" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
</td>
<td id="group_1c3fecf0" style="white-space:nowrap;" tagname="toolbar">
<input id="key" style="width:150px;" class="mini-textbox" emptyText="请输入名称"/>
<a id="button_9c4fd9fb" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" isPage="true" allowResize="false" pageSize="20" class="mini-datagrid" eventNo="e_query_enumvalue" allowSortColumn="true" isMulPageSelect="true" inputs="id:'$id$'" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_46e3431f" property="columns">
<div field="field_a9985192" id="field_a9985192" allowSort="false" width="20" headerAlign="center" type="checkcolumn">
</div>
<div id="field_702f9c5c" field="item_name" allowSort="true" width="110" headerAlign="center">
名称
</div>
<div id="field_6ed46b49" field="item_value" allowSort="true" width="110" headerAlign="center">
枚举值
</div>
<div id="field_f1477f10" field="orderline" allowSort="true" width="110" headerAlign="center">
排序值
</div>
<div field="status" id="status" dataType="select" allowSort="true" width="60" headerAlign="center" format="state">
是否有效
</div>
<div field="field_d59c2d44" id="pop_window" dataType="javascript" allowSort="false" width="110" align="center" headerAlign="center">
查看转换值
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_831f5a3c",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"add_value","title":"添加数据字典值","height":"250","paramFunc":"getParam","width":"350","tagId":"button_9ab0c14e","function":"popWindow"},{"templateNo":"edit_value","title":"修改数据字典枚举值","isSelect":"true","height":"300","inputs":"item_id:''","width":"350","tagId":"button_903f1af0","function":"popWindow"},{"eventNo":"e_delete_enumvalue","isMulSelect":"true","inputs":"item_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认删除?","tagId":"button_e12666f9","function":"submit"},{"paramFunc":"getSearchParam","tagId":"button_9c4fd9fb","function":"query"}],"allowResize":"false","allowUnselect":"false","idField":"id","pageSize":"20","showPager":"true","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_enumvalue","frozenStartColumn":"-1","multiSelect":"true","inputs":"id:'$id$'","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"true","fields":[{"id":"field_a9985192","field":"field_a9985192","allowSort":"false","headerAlign":"center","width":"20","type":"checkcolumn"},{"field":"item_name","id":"field_702f9c5c","allowSort":"true","headerAlign":"center","width":"110"},{"field":"item_value","id":"field_6ed46b49","allowSort":"true","headerAlign":"center","width":"110"},{"field":"orderline","id":"field_f1477f10","allowSort":"true","headerAlign":"center","width":"110"},{"id":"status","field":"status","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"state"},{"id":"pop_window","field":"field_d59c2d44","dataType":"javascript","items":[{"templateNo":"change_value","title":"数据字典转换值","height":"500","inputs":"item_id:''","width":"900","displayName":"查看","tagId":"pop_window","function":"popWindow"}],"allowSort":"false","headerAlign":"center","align":"center","width":"110"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
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

function getParam()
{
return window.Owner.getParam();
}
function getSearchParam()
{
var param = window.Owner.getSearchParam();
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