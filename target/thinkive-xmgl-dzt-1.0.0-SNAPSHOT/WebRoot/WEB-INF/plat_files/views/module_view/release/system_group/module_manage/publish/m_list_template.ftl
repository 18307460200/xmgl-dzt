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
<div id="datarid_panel_6dbb61ef" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_3f19144f" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_22f7d065" style="width:100%;" tagname="toolbar">
<input id="hidden_2e94575c" name="id" class="mini-hidden"/>
<a id="button_98af2be6" class="mini-button" plain="true" iconCls="icon-add">新增</a>
<a id="button_e796bb45" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_template"><a id="button_73604c33" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
<a id="button_007a1065" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" allowResize="false" allowUnselect="false" idField="module_id" pageSize="20" showPager="true" class="mini-datagrid" emptyText="暂无数据" id="datagrid1" eventNo="e_query_alltemplateinfo" frozenStartColumn="-1" multiSelect="true" inputs="module_id:'$module_id$'" isMulPageSelect="true" allowSortColumn="true" style="width:100%;height:100%;" showEmptyText="true" allowAlternating="true" frozenEndColumn="-1" showColumnsMenu="true">
<div id="fields_1e84fedb" property="columns">
<div field="field_69309553" id="field_69309553" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_aefc0984" field="template_no" allowSort="true" width="120" headerAlign="center">
模板编号
</div>
<div id="field_2ec3e86e" field="template_name" allowSort="true" width="120" headerAlign="center">
模板名称
</div>
<div id="field_085f783b" field="template_type" dataType="select" allowSort="true" width="120" align="center" headerAlign="center" format="template_type">
模板类型
</div>
<div id="field_c43c63d5" field="is_index" dataType="select" allowSort="true" width="120" align="center" headerAlign="center" format="is_index">
是否首页模板
</div>
<div field="field_66221a74" id="field_66221a74" dataType="javascript" allowSort="false" headerAlign="center">
操作
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_6dbb61ef",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"isMax":"true","templateNo":"m_add_template","title":"新增模板","inputs":"module_id:'$module_id$'","tagId":"button_98af2be6","function":"popWindow"},{"isMax":"true","templateNo":"m_edite_template","title":"修改模板","isSelect":"true","inputs":"template_id:'',module_id:''","tagId":"button_e796bb45","function":"popWindow"},{"eventNo":"e_delete_template","isMulSelect":"true","inputs":"template_id:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_73604c33","function":"submit"},{"isReLoad":"true","tagId":"button_007a1065","function":"refresh"}],"allowResize":"false","idField":"module_id","allowUnselect":"false","showPager":"true","pageSize":"20","class":"mini-datagrid","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_alltemplateinfo","multiSelect":"true","frozenStartColumn":"-1","style":"width:100%;height:100%;","allowSortColumn":"true","isMulPageSelect":"true","inputs":"module_id:'$module_id$'","allowAlternating":"true","showEmptyText":"true","fields":[{"id":"field_69309553","field":"field_69309553","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"template_no","id":"field_aefc0984","allowSort":"true","headerAlign":"center","width":"120"},{"field":"template_name","id":"field_2ec3e86e","allowSort":"true","headerAlign":"center","width":"120"},{"field":"template_type","id":"field_085f783b","dataType":"select","allowSort":"true","headerAlign":"center","align":"center","width":"120","format":"template_type"},{"field":"is_index","id":"field_c43c63d5","dataType":"select","allowSort":"true","headerAlign":"center","align":"center","width":"120","format":"is_index"},{"id":"field_66221a74","field":"field_66221a74","dataType":"javascript","items":[{"inputs":"_module_id:'$module_id$',_version_type:'0',_template_no:'$template_no$',_catalog_id:'$_catalog_id$'","displayName":"预览","tagId":"field_66221a74","url":"${ctxPath}/servlet/ModuleView","function":"link"}],"allowSort":"false","headerAlign":"center"}],"showColumnsMenu":"true","frozenEndColumn":"-1"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>