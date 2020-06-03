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
<div id="layout1" class="mini-layout" style="width:100%;height:100%;margin:2px;" nodeIndex="0">
<div title="center" region="center" bodyStyle="overflow:hidden;" nodeIndex="0">
<div id="datarid_panel_921793cd" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_ff261174" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_bd044181" style="width:100%;" tagname="toolbar">
<a id="button_16cc3ca2" class="mini-button" plain="true" iconCls="icon-add">新增SQL</a>
<a id="button_baf46ca6" class="mini-button" plain="true" iconCls="icon-edit">编辑SQL</a>
<@permission eventNo="e_delete_sql"><a id="button_5a1b32b4" class="mini-button" plain="true" iconCls="icon-remove">删除SQL</a>
</@permission>
<a id="button_0317fb86" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="height:100%;width:100%;" allowAlternating="true" isPage="false" allowResize="false" class="mini-datagrid" isCellCopy="true" eventNo="e_query_sqllist" allowSortColumn="true" isMulPageSelect="true" inputs="module_id:'$module_id$',event_id:'$event_id$'" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_4c98630c" property="columns">
<div field="field_7ca2c2cc" id="field_7ca2c2cc" allowSort="true" headerAlign="center" type="checkcolumn">
</div>
<div id="field_7701596a" field="sql_no" allowSort="true" width="120" headerAlign="center">
SQL编号
</div>
<div id="field_1c0b9f71" field="orderline" allowSort="true" width="120" headerAlign="center">
排序值
</div>
<div id="field_bae0708c" field="state" dataType="select" allowSort="true" width="60" headerAlign="center" format="state">
是否有效
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_921793cd",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_sql","title":"新增SQL","height":"630","inputs":"module_id:'$module_id$',event_id:'$event_id$'","width":"800","tagId":"button_16cc3ca2","function":"popWindow"},{"templateNo":"m_edit_sql","isSelect":"true","title":"修改SQL","height":"630","inputs":"module_id:'$module_id$',sql_id:'$sql_id$'","width":"800","tagId":"button_baf46ca6","function":"popWindow"},{"eventNo":"e_delete_sql","isMulSelect":"true","inputs":"sql_id:'$sql_id$'","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_5a1b32b4","function":"submit"},{"tagId":"button_0317fb86","function":"refresh"}],"allowResize":"false","allowUnselect":"false","idField":"id","showPager":"true","class":"mini-datagrid","isCellCopy":"true","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_sqllist","frozenStartColumn":"-1","multiSelect":"true","inputs":"module_id:'$module_id$',event_id:'$event_id$'","isMulPageSelect":"true","allowSortColumn":"true","style":"height:100%;width:100%;","showEmptyText":"true","allowAlternating":"true","isPage":"false","fields":[{"id":"field_7ca2c2cc","field":"field_7ca2c2cc","allowSort":"true","headerAlign":"center","type":"checkcolumn"},{"field":"sql_no","id":"field_7701596a","allowSort":"true","headerAlign":"center","width":"120"},{"field":"orderline","id":"field_1c0b9f71","allowSort":"true","headerAlign":"center","width":"120"},{"field":"state","id":"field_bae0708c","dataType":"select","allowSort":"true","headerAlign":"center","width":"60","format":"state"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
$.tkui["datagrid1"] = datagrid;
datagrid.loadViewConfig();
});
}
</div>
</div>
</div>
<div region="west" title="SQL流程脚本" showheader="true" expanded="false" bodystyle="padding-right:1px;overflow-y:hidden;" showspliticon="false" width="350" nodeIndex="1">
<div id="form1" eventNo="e_query_js" inputs="module_id:'$module_id$',event_id:'$event_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallbackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_e2d4992f" name="module_id" class="mini-hidden"/>
<input id="hidden_12451995" name="event_id" class="mini-hidden"/>
<input id="hidden_e8640b1b" name="script_type" value="0" class="mini-hidden"/>
<input id="hidden_aecfdc03" name="script_id" class="mini-hidden"/>
<table id="table_d8f98da6" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_e082114c" style="border-width:1px;">
<td>
<div id="ceditor_paren_8dbd7bed" tagName="ceditor">
<input id="script_value" style="width:100%;height:480px;" name="script_value" labelStyle="width:1px;" labelField="true" class="mini-textarea"/>
</div>
</td>
<div tagName="javascript" style="display:none;">
var ceditor = $.tkui["script_value"];
if (!ceditor) {
require.async("ceditor",
function(CEditor) {
ceditor = new CEditor("ceditor_paren_8dbd7bed", {"id":"script_value","style":"width:100%;height:480px;","name":"script_value","labelStyle":"width:1px;","labelField":"true","class":"mini-textarea","label":""});
$.tkui["script_value"] = ceditor;
ceditor.loadViewConfig();
});
}
</div>
</tr>
</table>
<table id="table_cece8f0e" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_c7e1f043" style="border-width:1px;">
<td>
<div labelStyle="width:50px;" labelField="true" textField="item_name" class="mini-radiobuttonlist" label="状态：" repeatDirection="vertical" id="radiobuttonlist_4cf447bd" style="width:250px;" name="status" valueField="item_value" value="1" repeatLayout="table"></div>
</td>
<td align="right" style="padding-top:10px;" nodeIndex="1">
<@permission eventNo="e_add_js"><a id="button_71d6e5b5" class="mini-button" iconCls="icon-save">保存</a>
</@permission>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_js","toolbar":[{"eventNo":"e_add_js","isAlert":"true","alertMsg":"是否提交？","tagId":"button_71d6e5b5","isValid":"true","function":"submit"}],"style":"margin-top:5px","inputs":"module_id:'$module_id$',event_id:'$event_id$'","loadDataCallBackFunc":"loadDataCallbackFunc","formitem":[{"dataType":"url","format":"module_id","tagId":"hidden_e2d4992f"},{"dataType":"url","format":"event_id","tagId":"hidden_12451995"},{"dataType":"select","format":"state","tagId":"radiobuttonlist_4cf447bd"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</div>
</div>
<script type="text/javascript" nodeIndex="1">

mini.parse();
var grid = mini.get("datagrid1");
function GetData()
{
var data = grid.getData();
var sql_ids="";
for(var i=0;i<data.length;i++){
if(i==0){
sql_ids= sql_ids+data[i].sql_id;
}else{
sql_ids= sql_ids+","+data[i].sql_id;
}
}
return sql_ids;
}
function loadDataCallbackFunc(e)
{
var layout = mini.get("layout1");
if(e!=null && e.script_value!=null){
layout.expandRegion("west");
}
}

</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>