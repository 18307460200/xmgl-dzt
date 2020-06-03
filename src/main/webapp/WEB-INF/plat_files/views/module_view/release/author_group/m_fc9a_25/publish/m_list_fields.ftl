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
<div id="splitter_3d8ba3d5" borderStyle="border:0;" allowResize="false" style="width:100%;height:100%;" class="mini-splitter">
<div id="group_e4d94b14" showCollapseButton="false" visible="false" style="border-width:1px;" size="0">
</div>
<div id="group_9cde0585" showCollapseButton="true" style="border-width:1px;">
<div id="datarid_panel_f1971e19" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_c60382cf" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_f8a6b066" style="width:100%;" tagname="toolbar">
<a id="button_844a65e4" class="mini-button" iconCls="icon-add">增加</a>
<a id="button_7b44c21b" class="mini-button" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_fields"><a id="button_52ab162a" class="mini-button" iconCls="icon-remove">删除</a>
</@permission>
<a id="button_88b93d44" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
<td id="group_766158e4" style="white-space:nowrap;" tagname="toolbar">
<input id="textbox_5a68807a" style="width:200px;" name="key" class="mini-textbox" emptyText="权限要素名称："/>
<a id="button_c9029329" class="mini-button" iconCls="icon-redo">查询</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="id" pageSize="20" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_fields" frozenStartColumn="-1" multiSelect="true" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" isPage="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_2836fe78" property="columns">
<div field="field_5dc882af" id="field_5dc882af" allowSort="true" headerAlign="center" type="checkcolumn">
序号
</div>
<div id="field_37c8db49" field="data_name" allowSort="true" width="80" headerAlign="center">
权限要素名称
</div>
<div id="field_d6099c46" field="data_type" allowSort="true" width="80" headerAlign="center">
英文标识
</div>
<div id="field_cb672288" field="field_flag" allowSort="true" width="80" headerAlign="center">
数据权限字段标识
</div>
<div id="field_310c7516" field="data_source_impl" allowSort="true" width="200" headerAlign="center">
数据权限实现类
</div>
<div id="field_4dfa5be7" field="status" dataType="select" allowSort="true" width="30" headerAlign="center" format="fields_status">
是否启用
</div>
<div id="field_e5609fb9" field="field_type" dataType="select" allowSort="true" width="30" headerAlign="center" format="field_type">
数据权限类型
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_f1971e19",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_fields","title":"添加数据权限要素","height":"350","width":"500","tagId":"button_844a65e4","function":"popWindow"},{"templateNo":"m_edit_fields","title":"修改数据权限要素","isSelect":"true","height":"380","inputs":"data_id:'$data_id$'","width":"500","tagId":"button_7b44c21b","function":"popWindow"},{"eventNo":"e_delete_fields","isMulSelect":"true","inputs":"data_id:'$data_id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_52ab162a","function":"submit"},{"tagId":"button_88b93d44","function":"refresh"},{"isMulSelect":"false","isSelect":"false","inputs":"key:'$key$'","tagId":"button_c9029329","function":"query"}],"allowResize":"false","idField":"id","allowUnselect":"false","showPager":"true","pageSize":"20","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_fields","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","allowAlternating":"true","showEmptyText":"true","isPage":"true","fields":[{"id":"field_5dc882af","field":"field_5dc882af","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"data_name","id":"field_37c8db49","allowSort":"true","headerAlign":"center","width":"80"},{"field":"data_type","id":"field_d6099c46","allowSort":"true","headerAlign":"center","width":"80"},{"field":"field_flag","id":"field_cb672288","allowSort":"true","headerAlign":"center","width":"80"},{"field":"data_source_impl","id":"field_310c7516","allowSort":"true","headerAlign":"center","width":"200"},{"field":"status","id":"field_4dfa5be7","dataType":"select","allowSort":"true","headerAlign":"center","width":"30","format":"fields_status"},{"field":"field_type","id":"field_e5609fb9","dataType":"select","allowSort":"true","headerAlign":"center","width":"30","format":"field_type"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
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