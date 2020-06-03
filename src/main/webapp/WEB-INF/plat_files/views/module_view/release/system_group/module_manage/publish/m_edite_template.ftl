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
<div id="layout1" class="mini-layout" style="width:100%;height:100%;" nodeIndex="0">
<div title="center" region="center" bodyStyle="overflow:hidden;" style="border:0;" nodeIndex="0">
<div id="form1" eventNo="e_query_templateinfo" inputs="template_id:'$template_id$'" style="margin-top:5px" loadDataCallBackFunc="loadDataCallBackFunc">
<div style="padding-left:11px;padding-bottom:5px;padding-right:11px;">
<input id="hidden_0629f87d" name="template_id" class="mini-hidden"/>
<input id="hidden_84f88e65" name="module_id" class="mini-hidden"/>
<table id="table_dca55a71" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_977fecb9" style="border-width:1px;">
<td>
<input id="textbox_1d7d9c66" style="width:100%" labelStyle="text-align:right;" name="template_no" labelField="true" class="mini-textbox" emptyText="请输入模板英文编号，同一模块下编号必须唯一，采用下划线命名法" label="模板编号：" required="true"/>
</td>
<td>
<input id="textbox_e9df8f5b" style="width:100%" labelStyle="text-align:right;" name="template_name" labelField="true" class="mini-textbox" emptyText="请输入模板中文名称" label="模板名称：" required="true"/>
</td>
</tr>
<tr id="group_eb2f9e57" style="border-width:1px;">
<td>
<input id="combobox_3cf79ecf" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="file_encoding" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="生成文件编码：" required="true"/>
</td>
<td>
<input labelStyle="text-align:right;" labelField="true" textField="item_name" class="mini-combobox" label="文件存储类型：" id="combobox_a7387d3c" allowInput="true" style="width:100%" showNullItem="false" name="file_type" valueField="item_value" onvaluechanged="onEventTypeChanged" required="true"/>
</td>
</tr>
<tr id="group_05ee1601" style="border-width:1px;">
<td nodeIndex="0">
<input id="checkbox_a09d3996" text="是否首页" trueValue="1" visible="false" style="margin-left:100px;margin-bottom:5px;display:block;" falseValue="0" name="is_index" value="0" class="mini-checkbox"/>
</td>
<td>
<input id="combobox_9a9550a1" allowInput="true" style="width:100%" showNullItem="false" labelStyle="text-align:right;" name="parse_type" valueField="item_value" labelField="true" class="mini-combobox" textField="item_name" label="文件解析类型：" required="true"/>
</td>
</tr>
<tr id="group_3ae5855c" style="border-width:1px;">
<td>
<input id="textbox_2ff7be9d" visible="false" style="width:100%" labelStyle="text-align:right;" name="window_width" labelField="true" class="mini-textbox" emptyText="请输入模板弹窗宽度" label="弹窗宽度：" required="true"/>
</td>
<td>
<input id="textbox_c538d972" visible="false" style="width:100%" labelStyle="text-align:right;" name="window_height" labelField="true" class="mini-textbox" emptyText="请输入模板弹窗高度" label="弹窗高度：" required="true"/>
</td>
</tr>
<tr id="group_4ea4c881" style="border-width:1px;">
<td colspan="2">
<input id="textarea_412e8e27" style="width:100%;height:50px;" labelStyle="text-align:right;" name="template_brief" labelField="true" class="mini-textarea" label="模板简介："/>
</td>
</tr>
<tr id="group_a907077d" style="border-width:1px;">
<td>
<input id="textbox_d508b122" visible="false" style="width:100%;" labelStyle="text-align:right;" name="template_url" labelField="true" class="mini-textbox" emptyText="请输入模板本地地址" label="模板地址：" required="true"/>
</td>
</tr>
<tr id="group_f8b1cd84" style="border-width:1px;">
<td colspan="2">
<div id="ceditor_paren_2b1acfed" tagName="ceditor">
<input id="content" onvalidation="onValueCheck" visible="false" style="width:100%;height:395px;" labelStyle="text-align:right;" name="content" labelField="true" class="mini-textarea" label="模版内容："/>
</div>
</td>
<div tagName="javascript" style="display:none;">
var ceditor = $.tkui["content"];
if (!ceditor) {
require.async("ceditor",
function(CEditor) {
ceditor = new CEditor("ceditor_paren_2b1acfed", {"id":"content","onvalidation":"onValueCheck","colspan":"2","visible":"false","style":"width:100%;height:395px;","labelStyle":"text-align:right;","name":"content","labelField":"true","class":"mini-textarea","label":"模版内容："});
$.tkui["content"] = ceditor;
ceditor.loadViewConfig();
});
}
</div>
</tr>
</table>
<table id="table_317c2e87" style="width:100%;table-layout:fixed;" cellpadding="1" class="form-table" border="0" cellspacing="2">
<tr id="group_de20802c" style="border-width:1px;">
<td colspan="2" align="center" style="padding-top:10px;" nodeIndex="0">
<@permission eventNo="e_edite_template"><a id="button_1f935306" style="width:60px;margin-right:20px;" class="mini-button" iconCls="icon-ok">确定</a>
</@permission>
<a id="button_c7857f5b" class="mini-button" iconCls="icon-cancel">取消</a>
</td>
</tr>
</table>
</div>
<div tagName="javascript" style="display:none;">
var form = $.tkui["form1"];
if(!form){
require.async("form",function(Form){
form = new Form("form1",{"id":"form1","eventNo":"e_query_templateinfo","toolbar":[{"eventNo":"e_edite_template","isAlert":"true","alertMsg":"是否提交？","tagId":"button_1f935306","isValid":"true","isClose":"true","function":"submit"},{"tagId":"button_c7857f5b","isClose":"true"}],"style":"margin-top:5px","inputs":"template_id:'$template_id$'","loadDataCallBackFunc":"loadDataCallBackFunc","formitem":[{"dataType":"select","format":"encode","tagId":"combobox_3cf79ecf"},{"dataType":"select","format":"file_type","tagId":"combobox_a7387d3c"},{"dataType":"select","format":"parse_type","tagId":"combobox_9a9550a1"}]});
$.tkui["form1"] = form;
form.loadViewConfig();
});
}
</div>
</div>
</div>
<div region="east" title="事件列表" showheader="true" expanded="false" bodystyle="padding-right:1px; overflow-y:hidden;" showspliticon="false" width="350" nodeIndex="1">
<div id="datarid_panel_52540a06" class="mini-fit" style="width:100%;height:100%;">
<div style="width:100%;">
<div style="width:100%;">
<div id="toolbar_0fd81002" style="padding:2px;border-top:0;border-left:0;border-right:0;" class="mini-toolbar">
<table style="width:100%;">
<tr>
<td id="group_83fa1901" style="width:100%;" tagname="toolbar">
<a id="button_2f9d197c" class="mini-button" plain="true" iconCls="icon-add">新增</a>
<a id="button_35299e4a" class="mini-button" plain="true" iconCls="icon-edit">编辑</a>
<@permission eventNo="e_delete_event"><a id="button_82e7527f" class="mini-button" plain="true" iconCls="icon-remove">删除</a>
</@permission>
<a id="button_90cf7456" class="mini-button" plain="true" iconCls="icon-reload">刷新</a>
</td>
</tr>
</table>
</div>
</div>
</div>
<div class="mini-fit" style="width:100%;height:100%;">
<div showSortIcon="false" borderStyle="border:0" idField="event_id" allowUnselect="false" showPager="true" emptyText="暂无数据" id="datagrid1" multiSelect="true" frozenStartColumn="-1" style="width:100%;height:100%;" allowAlternating="true" allowResize="false" pageSize="20" class="mini-datagrid" isCellCopy="true" eventNo="e_query_eventbymoduleid" allowSortColumn="true" isMulPageSelect="true" inputs="module_id:''" showEmptyText="true" showColumnsMenu="true" frozenEndColumn="-1">
<div id="fields_6183d0f0" property="columns">
<div field="field_4df21e0b" id="field_4df21e0b" allowSort="false" headerAlign="center" type="checkcolumn">
</div>
<div id="field_7b9e7f8e" field="event_no" allowSort="true" width="120" headerAlign="center">
事件编号
</div>
<div id="field_7a8a34d0" field="event_name" allowSort="true" width="120" headerAlign="center">
事件名称
</div>
</div>
</div>
</div>
<div tagName="javascript" style="display:none;">
var datagrid = $.tkui["datagrid1"];
if(!datagrid){
require.async("datagrid",function(DataGridBus){
datagrid = new DataGridBus("datarid_panel_52540a06",{"showSortIcon":"false","borderStyle":"border:0","toolbar":[{"templateNo":"m_add_event","title":"新增模板事件","height":"300","inputs":"module_id:'$module_id$'","width":"600","tagId":"button_2f9d197c","function":"popWindow"},{"templateNo":"m_edite_event","isSelect":"true","title":"修改事件","height":"300","inputs":"event_id:'',module_id:'$module_id$'","width":"600","tagId":"button_35299e4a","function":"popWindow"},{"eventNo":"e_delete_event","isMulSelect":"true","inputs":"event_id:'',event_type:'',event_value:''","isAlert":"true","isReLoad":"true","alertMsg":"是否确认操作?","tagId":"button_82e7527f","function":"submit"},{"tagId":"button_90cf7456","function":"refresh"}],"allowResize":"false","allowUnselect":"false","idField":"event_id","pageSize":"20","showPager":"true","class":"mini-datagrid","isCellCopy":"true","emptyText":"暂无数据","id":"datagrid1","eventNo":"e_query_eventbymoduleid","frozenStartColumn":"-1","multiSelect":"true","inputs":"module_id:''","isMulPageSelect":"true","allowSortColumn":"true","style":"width:100%;height:100%;","showEmptyText":"true","allowAlternating":"true","fields":[{"id":"field_4df21e0b","field":"field_4df21e0b","allowSort":"false","headerAlign":"center","type":"checkcolumn"},{"field":"event_no","id":"field_7b9e7f8e","allowSort":"true","headerAlign":"center","width":"120"},{"field":"event_name","id":"field_7a8a34d0","allowSort":"true","headerAlign":"center","width":"120"}],"frozenEndColumn":"-1","showColumnsMenu":"true"});
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

function onEventTypeChanged(e)
{
var fileType = e.value;
if(fileType=='0')
{
mini.getbyName("template_url").setVisible(false);
$.tkui["content"].setVisible(true);
}
else
{
mini.getbyName("template_url").setVisible(true);
$.tkui["content"].setVisible(false);
}
}
function loadDataCallBackFunc(e)
{
if(e.file_type=='1')
{
mini.getbyName("template_url").setVisible(true);
$.tkui["content"].setVisible(false);
}
else
{
$.tkui["content"].setVisible(true);
mini.getbyName("template_url").setVisible(false);
}
}
function onValueCheck(e){
if (e.isValid) {
var type = mini.getbyName("file_type").getValue();
if (type=='0' && e.value.length==0) {
e.errorText = "必须输入模版内容";
e.isValid = false;
}
}
}

-->
</script>
<script type="text/javascript" src="${ctxPath}/framework/version.js"></script>
<!--基础框架包 -->
<script type="text/javascript" src="${ctxPath}/thinkiveJs.min.js"></script>
</body>
</html>